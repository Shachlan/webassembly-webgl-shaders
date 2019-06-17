#include <emscripten.h>
#include <iostream>
#include <string>
extern "C" {
#include "html5.h"
}
#include "opengl/openGLShading.hpp"

int main(int argc, char const *argv[]) {
  printf("[WASM] Loaded\n");

  EM_ASM(if (typeof window != "undefined") {
    window.dispatchEvent(new CustomEvent("wasmLoaded"))
  } else {global.onWASMLoaded && global.onWASMLoaded()});

  return 0;
}

extern "C" {

EMSCRIPTEN_KEEPALIVE
void clearContexts(void) {
}

EMSCRIPTEN_KEEPALIVE
void createContext(int width, int height, char *id) {
  printf("creating %s context\n", id);
  try {
    setupOpenGL(width, height, id);
  } catch (std::exception ex) {
    std::cout << ex.what() << '\n';
  }
  free(id);
}

EMSCRIPTEN_KEEPALIVE
void invertFrameRun(uint32_t texture1) {
  invertFrame(texture1);
}

EMSCRIPTEN_KEEPALIVE
void passthroughFrameRun(uint32_t texture1) {
  passthroughFrame(texture1);
}

EMSCRIPTEN_KEEPALIVE
void blendTexturesRun(int number_of_textures, uint32_t texture1, uint32_t texture2,
                      uint32_t texture3ID, uint32_t texture4ID, uint32_t texture5ID,
                      uint32_t texture6ID, uint32_t texture7ID, uint32_t texture8ID) {
  blendFrames(number_of_textures, texture1, texture2, texture3ID, texture4ID, texture5ID,
              texture6ID, texture7ID, texture8ID);
}

EMSCRIPTEN_KEEPALIVE
uint32_t renderTextRun(char *text, int x, int y, int font_size, int r, int g, int b, int a) {
  std::string str(text);
  return render_text(str, x, y, font_size, r, g, b, a);
}
}
