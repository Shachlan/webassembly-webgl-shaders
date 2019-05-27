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
        "emcc -g4 -o ./assets/appWASM.js ./src/emscripten.cpp -O3 -s LEGACY_GL_EMULATION=0 -s ALLOW_MEMORY_GROWTH=1 -s USE_WEBGL2=1 -s WASM=1 -s NO_EXIT_RUNTIME=1 -s EXTRA_EXPORTED_RUNTIME_METHODS=['ccall'] -std=c++1z -DFRONTEND=1 -include all.hpp -I./src -I./third_party/skia/include/core -I./third_party/skia/include/gpu -I./third_party/skia/ -DFRONTEND=1"
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
