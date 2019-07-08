// Copyright (c) 2019 Lightricks. All rights reserved.
// Created by Shachar Langbeheim.

#include "TexturePool.hpp"

#include "OpenGLHeaders.hpp"

using namespace WREOpenGL;

GLuint create_texture() {
  GLuint textureLoc;
  glGenTextures(1, &textureLoc);
  GLCheckDbg("Failed to generate texture.");
  glActiveTexture(GL_TEXTURE0);

  glBindTexture(GL_TEXTURE_2D, textureLoc);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glBindTexture(GL_TEXTURE_2D, 0);
  GLCheckDbg("Failed to setup texture.");
  log_debug("created texture %d", textureLoc);
  return textureLoc;
}

GLuint TexturePool::get_texture() {
  return create_texture();
}

void TexturePool::release_texture(GLuint name) {
  this->used_textures.erase(name);
  this->available_textures.insert(name);
}

void TexturePool::flush() {
  for (auto &name : this->available_textures) {
    glDeleteTextures(1, &name);
  }
}

void TexturePool::clear() {
  this->flush();

  for (auto &name : this->used_textures) {
    glDeleteTextures(1, &name);
  }
}
