module.exports = grunt => {
  grunt.initConfig({
    uglify: {
      my_target: {
        options: {
          sourceMap: false,
          mangle: false
        },
        files: {
          "dist/appWASM.js": ["dist/appWASM.js"]
        }
      }
    },

    exec: {
      build:
        "~/emsdk/emsdk activate latest &&\
        source ~/emsdk/emsdk_env.sh &&\
        cd third_party/Skia &&\
        ./build_skia_wasm_bitcode.sh &&\
        cd .. &&\
        cd .. &&\
        em++ -g4 -o ./assets/appWASM.js ./src/*.cpp ./src/opengl/*.cpp \
        -std=c++17 -include all.hpp \
        -I./src -I./third_party/skia/include/core \
        -I./third_party/skia/include/gpu \
        -I./third_party/skia/ \
        -DFRONTEND=1 \
        ./third_party/skia/out/Build-wasm-Release/Release/*.a \
        -g4 \
        -O3 \
        -s LEGACY_GL_EMULATION=0 \
        -s ALLOW_MEMORY_GROWTH=1 \
        -s USE_WEBGL2=1 \
        -s WASM=0 \
        -s NO_EXIT_RUNTIME=1 \
        -s EXTRA_EXPORTED_RUNTIME_METHODS=['ccall'] \
        -s ERROR_ON_UNDEFINED_SYMBOLS=0 \
        -s USE_LIBPNG=1 \
        -s USE_FREETYPE=1 \
        --embed-file ./fonts \
        --embed-file ./data.json \
        -v"
    },

    watch: {
      cpp: {
        files: ["dev/cpp/*.cpp", "dev/cpp/*.h"],
        tasks: ["exec:build", "babel", "uglify"]
      }
    }
  });

  grunt.loadNpmTasks("grunt-contrib-watch");
  grunt.loadNpmTasks("grunt-contrib-uglify");
  grunt.loadNpmTasks("grunt-exec");

  grunt.registerTask("default", ["watch"]);
};
