#include "openGLShading.hpp"

#include <fstream>
#include <string>

#if defined(WRE_FRONTEND) && WRE_FRONTEND
#include <emscripten.h>
extern "C" {
#include "html5.h"
}
#include <EGL/egl.h>
#include <GLES2/gl2.h>
#include <GLES3/gl3.h>

#define PIXEL_FORMAT GL_RGBA

#else

#include <OpenGL/gl3.h>

#include <GLFW/glfw3.h>
#include <stdio.h>
#include <stdlib.h>

#define PIXEL_FORMAT GL_RGB

#endif

#include "GLException.hpp"
#include "ProgramPool.hpp"
#include "TexturePool.hpp"

#include <src/gpu/gl/GrGLDefines.h>
#include <sstream>
#include "GrContext.h"
#include "SkData.h"
#include "SkFont.h"
#include "SkImage.h"
#include "SkPaint.h"
#include "SkStream.h"
#include "SkString.h"
#include "SkSurface.h"
#include "SkTextBlob.h"
#include "SkTypeface.h"
#include "gl/GrGLInterface.h"

#include <vector>

using namespace WREOpenGL;

static ProgramPool program_pool;
static TexturePool texture_pool;

static sk_sp<GrContext> skiaContext;
static std::vector<sk_sp<SkSurface>> surfaces;
static std::vector<uint32_t> surface_textures;

typedef struct {
  GLuint position_buffer;
  GLuint texture_buffer;
  GLuint vertex_array;
} ProgramInfo;

ProgramInfo invert_program;
ProgramInfo blend_program;
ProgramInfo passthrough_program;
#if defined(WRE_FRONTEND) && !WRE_FRONTEND
GLFWwindow *window;
#endif
GLuint vertex_array;
static sk_sp<SkTypeface> typeface;

static int text_index = 0;

#if defined(WRE_FRONTEND) && WRE_FRONTEND

static const float position[12] = {-1.0f, 1.0f,  1.0f, 1.0f, -1.0f, -1.0f,
                                   -1.0f, -1.0f, 1.0f, 1.0f, 1.0f,  -1.0f};

#else

static const float position[12] = {-1.0f, -1.0f, 1.0f, -1.0f, -1.0f, 1.0f,
                                   -1.0f, 1.0f,  1.0f, -1.0f, 1.0f,  1.0f};

#endif

static const float textureCoords[12] = {0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f,
                                        0.0f, 1.0f, 1.0f, 0.0f, 1.0f, 1.0f};

uint32_t get_texture() {
  return texture_pool.get_texture();
}

void release_texture(uint32_t textureID) {
  texture_pool.release_texture(textureID);
  texture_pool.flush();
}

static GLuint generate_vertex_array() {
  GLuint vao;
  GLCheckDbg("reality check.");
  glGenVertexArrays(1, &vao);
  GLCheckDbg("generating vertex array.");
  glBindVertexArray(vao);
  GLCheckDbg("binding vertex array.");
  return vao;
}

static GLuint position_buffer_setup(GLuint program) {
  GLuint positionBuf;
  glGenBuffers(1, &positionBuf);
  GLCheckDbg("generating position buffer.");
  glBindBuffer(GL_ARRAY_BUFFER, positionBuf);
  GLCheckDbg("binding position buffer.");
  glBufferData(GL_ARRAY_BUFFER, sizeof(position), position, GL_STATIC_DRAW);
  GLCheckDbg("buffering position data.");

  GLint loc = glGetAttribLocation(program, "position");
  glEnableVertexAttribArray(loc);
  GLCheckDbg("enable position vertex attribute array.");
  glVertexAttribPointer(loc, 2, GL_FLOAT, GL_FALSE, 0, 0);
  GLCheckDbg("setting position vertex attribute pointer.");
  return positionBuf;
}

static GLuint texture_buffer_setup(GLuint program, string buffer_name) {
  GLuint texturesBuffer;
  glGenBuffers(1, &texturesBuffer);
  GLCheckDbg("generating texture buffer.");
  glBindBuffer(GL_ARRAY_BUFFER, texturesBuffer);
  GLCheckDbg("binding texture buffer.");
  glBufferData(GL_ARRAY_BUFFER, sizeof(textureCoords), textureCoords, GL_STATIC_DRAW);
  GLCheckDbg("buffering texture data.");

  GLint loc = glGetAttribLocation(program, buffer_name.c_str());
  glEnableVertexAttribArray(loc);
  GLCheckDbg("enable texture vertex attribute array.");
  glVertexAttribPointer(loc, 2, GL_FLOAT, GL_FALSE, 0, 0);
  GLCheckDbg("setting texture vertex attribute pointer.");
  return texturesBuffer;
}

GLuint get_invert_program() {
  return program_pool.get_program("passthrough", "invert");
}

ProgramInfo build_invert_program() {
  GLuint program = get_invert_program();
  GLCheckDbg("generating program.");
  glUseProgram(program);
  GLCheckDbg("use invert program.");
  auto vertex_array = generate_vertex_array();
  GLuint position_buffer = position_buffer_setup(program);
  GLuint texture_buffer = texture_buffer_setup(program, "texCoord");

  return (ProgramInfo){position_buffer, texture_buffer, vertex_array};
}

GLuint get_passthrough_program() {
  return program_pool.get_program("passthrough", "passthrough");
}

ProgramInfo build_passthrough_program() {
  GLuint program = get_passthrough_program();
  GLCheckDbg("generating program.");
  glUseProgram(program);
  GLCheckDbg("use passthrough program.");
  auto vertex_array = generate_vertex_array();
  GLuint position_buffer = position_buffer_setup(program);
  GLuint texture_buffer = texture_buffer_setup(program, "texCoord");

  return (ProgramInfo){position_buffer, texture_buffer, vertex_array};
}

GLuint get_blend_program() {
  return program_pool.get_program("passthrough", "blend");
}

ProgramInfo build_blend_program() {
  GLuint program = get_blend_program();
  GLCheckDbg("generating program.");
  glUseProgram(program);
  GLCheckDbg("use blending program.");

  auto vertex_array = generate_vertex_array();
  GLuint position_buffer = position_buffer_setup(program);
  GLCheckDbg("Setting up position buffer.");

  GLuint texture_buffer = texture_buffer_setup(program, "texCoord");
  return (ProgramInfo){position_buffer, texture_buffer, vertex_array};
}

void setupOpenGL(int width, int height, char *canvasName) {
#if defined(WRE_FRONTEND) && WRE_FRONTEND
  EmscriptenWebGLContextAttributes attrs;
  attrs.explicitSwapControl = 0;
  attrs.depth = 1;
  attrs.stencil = 1;
  attrs.antialias = 1;
  attrs.majorVersion = 1;
  attrs.minorVersion = 0;
  attrs.enableExtensionsByDefault = true;

  int emscripten_context = emscripten_webgl_create_context(canvasName, &attrs);
  emscripten_webgl_make_context_current(emscripten_context);

#else

  if (!glfwInit()) {
    log_error("init failed");
    exit(1);
  }
  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
  glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GLFW_TRUE);
  glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
  log_info("glfw init");
  glfwWindowHint(GLFW_VISIBLE, 0);
  log_info("creating window");
  window = glfwCreateWindow(width, height, "", NULL, NULL);
  if (window == NULL) {
    log_error("no window");
    exit(1);
  }
  log_info("created window");
  glfwMakeContextCurrent(window);
  log_info("made context current");

  log_info("mdouble check");
  auto version = glGetString(GL_VERSION);
  GLCheckDbg("get version.");
  auto glsl_version = glGetString(GL_SHADING_LANGUAGE_VERSION);
  GLCheckDbg("get glsl version.");
  log_info("version: %s, glsl: %s", version, glsl_version);

#endif
  GLCheckDbg("setting up context.");
  glViewport(0, 0, width, height);
  GLCheckDbg("creating viewport.");
  invert_program = build_invert_program();
  GLCheckDbg("Creating invert.");
  blend_program = build_blend_program();
  GLCheckDbg("Creating blend.");
  passthrough_program = build_passthrough_program();

  skiaContext = GrContext::MakeGL();
  for (int i = 0; i < 7; i++) {
    auto backend_texture = get_texture();
    glBindTexture(GL_TEXTURE_2D, backend_texture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, nullptr);
    GrGLTextureInfo texture_info = {
        .fID = backend_texture, .fTarget = GL_TEXTURE_2D, .fFormat = GR_GL_RGBA8};
    GrBackendTexture texture(width, height, GrMipMapped::kNo, texture_info);

    auto surface = sk_sp(
        SkSurface::MakeFromBackendTexture(skiaContext.get(), texture, kTopLeft_GrSurfaceOrigin, 0,
                                          kRGBA_8888_SkColorType, nullptr, nullptr));

    if (!surface) {
      log_error("SkSurface::MakeRenderTarget returned null");
      exit(1);
    }

    surfaces.push_back(surface);
    surface_textures.push_back(backend_texture);
  }

  typeface = SkTypeface::MakeFromFile("./fonts/pacifico/Pacifico.ttf");
}

GLuint loadTexture(int width, int height, const uint8_t *buffer) {
  GLuint textureID = get_texture();
  GLCheckDbg("get texture");
  glActiveTexture(GL_TEXTURE0 + textureID);
  GLCheckDbg("active texture");
  glBindTexture(GL_TEXTURE_2D, textureID);
  GLCheckDbg("bind texture");
  glTexImage2D(GL_TEXTURE_2D, 0, PIXEL_FORMAT, width, height, 0, PIXEL_FORMAT, GL_UNSIGNED_BYTE,
               buffer);
  GLCheckDbg("load texture");
  return textureID;
}

void invertFrame(uint32_t textureID) {
  glBindFramebuffer(GL_FRAMEBUFFER, 0);
  glClearColor(0, 0, 0, 0);
  glClear(GL_COLOR_BUFFER_BIT);

  auto program = get_invert_program();
  glUseProgram(program);
  glBindVertexArray(invert_program.vertex_array);
  glActiveTexture(GL_TEXTURE0 + textureID);
  glBindTexture(GL_TEXTURE_2D, textureID);
  glUniform1i(glGetUniformLocation(program, "tex"), textureID);

  glBindBuffer(GL_ARRAY_BUFFER, invert_program.texture_buffer);
  GLint loc = glGetAttribLocation(program, "texCoord");
  glEnableVertexAttribArray(loc);
  glVertexAttribPointer(loc, 2, GL_FLOAT, GL_FALSE, 0, 0);
  glDrawArrays(GL_TRIANGLES, 0, 6);

  GLCheckDbg("Invert.");
}

void passthroughFrame(uint32_t textureID) {
  glBindFramebuffer(GL_FRAMEBUFFER, 0);
  glClearColor(0, 0, 0, 0);
  glClear(GL_COLOR_BUFFER_BIT);

  auto program = get_passthrough_program();
  glUseProgram(program);
  glBindVertexArray(passthrough_program.vertex_array);
  glActiveTexture(GL_TEXTURE0 + textureID);
  glBindTexture(GL_TEXTURE_2D, textureID);
  glUniform1i(glGetUniformLocation(program, "tex"), textureID);

  glBindBuffer(GL_ARRAY_BUFFER, passthrough_program.texture_buffer);
  GLint loc = glGetAttribLocation(program, "texCoord");
  glEnableVertexAttribArray(loc);
  glVertexAttribPointer(loc, 2, GL_FLOAT, GL_FALSE, 0, 0);
  glDrawArrays(GL_TRIANGLES, 0, 6);

  GLCheckDbg("Invert.");
}

void blendFrames(int number_of_textures, uint32_t texture1, uint32_t texture2, uint32_t texture3ID,
                 uint32_t texture4ID, uint32_t texture5ID, uint32_t texture6ID, uint32_t texture7ID,
                 uint32_t texture8ID) {
  text_index = 0;
  glBindFramebuffer(GL_FRAMEBUFFER, 0);
  glClearColor(0, 0, 0, 0);
  glClear(GL_COLOR_BUFFER_BIT);

  GLCheckDbg("sanity check");
  auto program = get_blend_program();
  glUseProgram(program);
  GLCheckDbg("use blend program");
  glBindVertexArray(blend_program.vertex_array);
  GLCheckDbg("bind vertex array");
  glUniform1i(glGetUniformLocation(program, "number_of_textures"), number_of_textures);
  GLCheckDbg("set number_of_textures");

  glActiveTexture(GL_TEXTURE0 + texture1);
  GLCheckDbg("active texture 1");
  glBindTexture(GL_TEXTURE_2D, texture1);
  GLCheckDbg("bind texture 1.");
  glUniform1i(glGetUniformLocation(program, "tex1"), texture1);

  GLCheckDbg("set texture 1");
  glActiveTexture(GL_TEXTURE0 + texture2);
  GLCheckDbg("active texture 2");
  glBindTexture(GL_TEXTURE_2D, texture2);
  GLCheckDbg("bind texture 2.");
  glUniform1i(glGetUniformLocation(program, "tex2"), texture2);
  GLCheckDbg("set texture 2");

  glActiveTexture(GL_TEXTURE0 + texture3ID);
  glBindTexture(GL_TEXTURE_2D, texture3ID);
  glUniform1i(glGetUniformLocation(program, "tex3"), texture3ID);

  glActiveTexture(GL_TEXTURE0 + texture4ID);
  glBindTexture(GL_TEXTURE_2D, texture4ID);
  glUniform1i(glGetUniformLocation(program, "tex4"), texture4ID);

  glActiveTexture(GL_TEXTURE0 + texture5ID);
  glBindTexture(GL_TEXTURE_2D, texture5ID);
  glUniform1i(glGetUniformLocation(program, "tex5"), texture5ID);

  glActiveTexture(GL_TEXTURE0 + texture6ID);
  glBindTexture(GL_TEXTURE_2D, texture6ID);
  glUniform1i(glGetUniformLocation(program, "tex6"), texture6ID);

  glActiveTexture(GL_TEXTURE0 + texture7ID);
  glBindTexture(GL_TEXTURE_2D, texture7ID);
  glUniform1i(glGetUniformLocation(program, "tex7"), texture7ID);

  glActiveTexture(GL_TEXTURE0 + texture8ID);
  glBindTexture(GL_TEXTURE_2D, texture8ID);
  glUniform1i(glGetUniformLocation(program, "tex8"), texture8ID);

  glDrawArrays(GL_TRIANGLES, 0, 6);
  GLCheckDbg("Draw.");
}

void getCurrentResults(int width, int height, uint8_t *outputBuffer) {
  glReadPixels(0, 0, width, height, PIXEL_FORMAT, GL_UNSIGNED_BYTE, outputBuffer);
}

uint32_t render_text(string text, int x, int y, int font_size, int r, int g, int b, int a) {
  GLCheckDbg("Entering skia");
  glBindVertexArray(0);
  skiaContext->resetContext();
  auto canvas = surfaces[text_index]->getCanvas();
  auto backing_texture = surface_textures[text_index];
  text_index++;
  canvas->clear(SkColorSetARGB(255, 0, 0, 0));
  auto text_color = SkColor4f::FromColor(SkColorSetARGB(a, r, g, b));
  SkPaint paint2(text_color);
  if (typeface == nullptr) {
    log_error("no typeface");
    exit(1);
  }

  auto text_blob = SkTextBlob::MakeFromString(text.c_str(), SkFont(typeface, font_size));
  canvas->drawTextBlob(text_blob.get(), x, y, paint2);
  canvas->flush();
  GLCheckDbg("Skia");

  return backing_texture;
}

void tearDownOpenGL() {
  glDeleteBuffers(1, &invert_program.position_buffer);
  glDeleteBuffers(1, &invert_program.texture_buffer);
  glDeleteBuffers(1, &blend_program.position_buffer);
  glDeleteBuffers(1, &blend_program.texture_buffer);
  log_debug("releasing programs");
  program_pool.clear();
#if defined(WRE_FRONTEND) && !WRE_FRONTEND
  log_debug("releasing textures");
  texture_pool.clear();
  glfwDestroyWindow(window);
#endif
}
