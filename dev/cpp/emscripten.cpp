#define FRONTEND 1

#include <emscripten.h>
#include <string>
extern "C"
{
#include "html5.h"
#include "openGLShading.cpp"
}

int main(int argc, char const *argv[])
{
    printf("[WASM] Loaded\n");

    EM_ASM(
        if (typeof window != "undefined") {
            window.dispatchEvent(new CustomEvent("wasmLoaded"))
        } else {
            global.onWASMLoaded && global.onWASMLoaded()});

    return 0;
}

extern "C"
{

    EMSCRIPTEN_KEEPALIVE
    void clearContexts(void)
    {
    }

    EMSCRIPTEN_KEEPALIVE
    void createContext(int width, int height, float blend_ratio, char *id)
    {
        printf("creating %s context\n", id);
        setupOpenGL(width, height, blend_ratio, id);
        free(id);
    }

    EMSCRIPTEN_KEEPALIVE
    void invertFrameRun(uint8_t *buffer, uint8_t *result)
    {
        loadTexture(0, 0, 0, buffer);
        invertFrame(0);
        getCurrentResults(result);
    }

    EMSCRIPTEN_KEEPALIVE
    void blendTexturesRun(uint8_t *buffer1, uint8_t *buffer2, uint8_t *result)
    {
        loadTexture(0, 0, 0, buffer1);
        loadTexture(1, 0, 0, buffer2);
        blendFrames(0, 1);
        getCurrentResults(result);
    }
}
