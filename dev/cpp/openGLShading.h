#include <stdint.h>

#ifdef __cplusplus
extern "C"
{
#endif

    extern void loadTexture(uint32_t textureID, int width, int height, uint8_t *buffer);

    extern void setupOpenGL(int width, int height, float blend_ratio, char *canvasName);

    extern void invertFrame(uint32_t textureID);

    extern void blendFrames(uint32_t texture1ID, uint32_t texture2ID);

    extern void tearDownOpenGL(void);
    extern void getCurrentResults(uint8_t *outputBuffer);

#if FRONTEND == 0
    extern uint32_t createTexture(void);
#endif

#ifdef __cplusplus
}
#endif
