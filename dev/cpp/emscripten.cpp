#include <emscripten.h>
#include <string>
#include <GLES2/gl2.h>
#include <EGL/egl.h>
extern "C" {
    #include "html5.h"
}
#include "Context.cpp"

Context* context;

int main(int argc, char const *argv[]) {
    printf("[WASM] Loaded\n");

    EM_ASM(
        if (typeof window!="undefined") {
            window.dispatchEvent(new CustomEvent("wasmLoaded"))
        } else {
            global.onWASMLoaded && global.onWASMLoaded()
        }
    );

    return 0;
}


extern "C" {
    EMSCRIPTEN_KEEPALIVE
    void createContext (int width, int height, char * id, int index, GLuint texture1) {
        context = new Context(width, height, id, texture1);
        free(id);
    }

    EMSCRIPTEN_KEEPALIVE
    void blendTexturesRun () {
        context->run();
    }
}