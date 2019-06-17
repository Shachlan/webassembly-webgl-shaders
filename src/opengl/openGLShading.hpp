#include <stdint.h>

void setupOpenGL(int width, int height, char *canvasName);

void invertFrame(uint32_t textureID);

void passthroughFrame(uint32_t textureID);

void blendFrames(int number_of_textures, uint32_t texture1, uint32_t texture2, uint32_t texture3ID,
                 uint32_t texture4ID, uint32_t texture5ID, uint32_t texture6ID, uint32_t texture7ID,
                 uint32_t texture8ID);

void tearDownOpenGL();

uint32_t render_text(string text, int x, int y, int font_size, int r, int g, int b, int a);

#if FRONTEND == 0
uint32_t get_texture();
void release_texture(uint32_t textureID);
void getCurrentResults(int width, int height, uint8_t *outputBuffer);
uint32_t loadTexture(int width, int height, const uint8_t *buffer);
#endif
