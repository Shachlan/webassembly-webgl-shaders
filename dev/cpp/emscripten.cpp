#define FRONTEND 1

#include <emscripten.h>
#include <string>
extern "C" {
#include "html5.h"
#include "Context.c"
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

extern "C" {

EMSCRIPTEN_KEEPALIVE
void clearContexts(void)
{
}

EMSCRIPTEN_KEEPALIVE
void createContext(int width, int height, float blend_ratio, char *id)
{
    setupOpenGL(width, height, blend_ratio, id);
}

void invertFrameRun(GLuint texture1)
{
    invertFrame(texture1);
}

EMSCRIPTEN_KEEPALIVE
void blendTexturesRun(GLuint texture1, GLuint texture2)
{
    blendFrames(texture1, texture2);
}
}