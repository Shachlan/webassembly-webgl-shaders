(module
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$vid (func (param i32 f64)))
 (type $FUNCSIG$viiiiii (func (param i32 i32 i32 i32 i32 i32)))
 (import "env" "memory" (memory $memory 256))
 (data (i32.const 1026) "\80\bf\00\00\80\bf\00\00\80?\00\00\80\bf\00\00\80\bf\00\00\80?\00\00\80\bf\00\00\80?\00\00\80?\00\00\80\bf\00\00\80?\00\00\80?")
 (data (i32.const 1082) "\80?")
 (data (i32.const 1094) "\80?\00\00\00\00\00\00\80?\00\00\80?\00\00\00\00\00\00\80?\00\00\80?\11\00\n\00\11\11\11\00\00\00\00\05\00\00\00\00\00\00\t\00\00\00\00\0b")
 (data (i32.const 1152) "\11\00\0f\n\11\11\11\03\n\07\00\01\13\t\0b\0b\00\00\t\06\0b\00\00\0b\00\06\11\00\00\00\11\11\11")
 (data (i32.const 1201) "\0b")
 (data (i32.const 1210) "\11\00\n\n\11\11\11\00\n\00\00\02\00\t\0b\00\00\00\t\00\0b\00\00\0b")
 (data (i32.const 1259) "\0c")
 (data (i32.const 1271) "\0c\00\00\00\00\0c\00\00\00\00\t\0c\00\00\00\00\00\0c\00\00\0c")
 (data (i32.const 1317) "\0e")
 (data (i32.const 1329) "\0d\00\00\00\04\0d\00\00\00\00\t\0e\00\00\00\00\00\0e\00\00\0e")
 (data (i32.const 1375) "\10")
 (data (i32.const 1387) "\0f\00\00\00\00\0f\00\00\00\00\t\10\00\00\00\00\00\10\00\00\10\00\00\12\00\00\00\12\12\12")
 (data (i32.const 1442) "\12\00\00\00\12\12\12\00\00\00\00\00\00\t")
 (data (i32.const 1491) "\0b")
 (data (i32.const 1503) "\n\00\00\00\00\n\00\00\00\00\t\0b\00\00\00\00\00\0b\00\00\0b")
 (data (i32.const 1549) "\0c")
 (data (i32.const 1561) "\0c\00\00\00\00\0c\00\00\00\00\t\0c\00\00\00\00\00\0c\00\00\0c\00\000123456789ABCDEFD\06\00\00\05")
 (data (i32.const 1616) "\01")
 (data (i32.const 1640) "\01\00\00\00\02\00\00\00H\0b\00\00\00\04")
 (data (i32.const 1664) "\01")
 (data (i32.const 1679) "\n\ff\ff\ff\ff")
 (data (i32.const 1916) "\a8\0f")
 (data (i32.const 1972) "attribute vec2 position;\nattribute vec2 texCoord;\nvarying vec2 vTexCoord;\nvoid main(void) {\n    gl_Position = vec4(position, 0, 1);\n    vTexCoord = texCoord;\n}\n\00uniform sampler2D tex;\nvarying vec2 vTexCoord;\nvoid main() {\n    const vec4 kInvert = vec4(1, 1, 1, 0);\n    gl_FragColor = kInvert - texture2D(tex, vTexCoord);\n}\n\00uniform sampler2D tex1;\nuniform sampler2D tex2;\nuniform float blendFactor;\nvarying vec2 vTexCoord;\n\nvoid main() {\n    vec4 color1 = texture2D(tex1, vTexCoord);\n    vec4 color2 = texture2D(tex2, vTexCoord);\n    gl_FragColor = (color1 * blendFactor) + (color2 * (1.0 - blendFactor));\n}\n\00blendFactor\00setting up\00finding context\00found context: %d\00tex1\00tex2\00if (typeof window != \"undefined\") { window.dispatchEvent(new CustomEvent(\"wasmLoaded\")) } else { global.onWASMLoaded && global.onWASMLoaded()}\00%s\00position\00texCoord\00[WASM] Loaded\00-+   0X0x\00(null)\00-0X+0X 0X-0x+0x 0x\00inf\00INF\00nan\00NAN\00.")
 (import "env" "table" (table $table 7 7 funcref))
 (elem (global.get $__table_base) $b0 $___stdio_close $b1 $___stdout_write $___stdio_seek $___stdio_write $b2)
 (import "env" "__table_base" (global $__table_base i32))
 (import "env" "DYNAMICTOP_PTR" (global $DYNAMICTOP_PTR$asm2wasm$import i32))
 (import "env" "abort" (func $abort (param i32)))
 (import "env" "___setErrNo" (func $___setErrNo (param i32)))
 (import "env" "___syscall140" (func $___syscall140 (param i32 i32) (result i32)))
 (import "env" "___syscall146" (func $___syscall146 (param i32 i32) (result i32)))
 (import "env" "___syscall54" (func $___syscall54 (param i32 i32) (result i32)))
 (import "env" "___syscall6" (func $___syscall6 (param i32 i32) (result i32)))
 (import "env" "_abort" (func $_abort))
 (import "env" "_emscripten_asm_const_i" (func $_emscripten_asm_const_i (param i32) (result i32)))
 (import "env" "_emscripten_get_heap_size" (func $_emscripten_get_heap_size (result i32)))
 (import "env" "_emscripten_memcpy_big" (func $_emscripten_memcpy_big (param i32 i32 i32) (result i32)))
 (import "env" "_emscripten_resize_heap" (func $_emscripten_resize_heap (param i32) (result i32)))
 (import "env" "_emscripten_webgl_create_context" (func $_emscripten_webgl_create_context (param i32 i32) (result i32)))
 (import "env" "_emscripten_webgl_make_context_current" (func $_emscripten_webgl_make_context_current (param i32) (result i32)))
 (import "env" "_exit" (func $_exit (param i32)))
 (import "env" "_glAttachShader" (func $_glAttachShader (param i32 i32)))
 (import "env" "_glBindBuffer" (func $_glBindBuffer (param i32 i32)))
 (import "env" "_glBufferData" (func $_glBufferData (param i32 i32 i32 i32)))
 (import "env" "_glCompileShader" (func $_glCompileShader (param i32)))
 (import "env" "_glCreateProgram" (func $_glCreateProgram (result i32)))
 (import "env" "_glCreateShader" (func $_glCreateShader (param i32) (result i32)))
 (import "env" "_glDrawArrays" (func $_glDrawArrays (param i32 i32 i32)))
 (import "env" "_glEnableVertexAttribArray" (func $_glEnableVertexAttribArray (param i32)))
 (import "env" "_glGenBuffers" (func $_glGenBuffers (param i32 i32)))
 (import "env" "_glGetAttribLocation" (func $_glGetAttribLocation (param i32 i32) (result i32)))
 (import "env" "_glGetProgramiv" (func $_glGetProgramiv (param i32 i32 i32)))
 (import "env" "_glGetShaderInfoLog" (func $_glGetShaderInfoLog (param i32 i32 i32 i32)))
 (import "env" "_glGetShaderiv" (func $_glGetShaderiv (param i32 i32 i32)))
 (import "env" "_glGetUniformLocation" (func $_glGetUniformLocation (param i32 i32) (result i32)))
 (import "env" "_glIsShader" (func $_glIsShader (param i32) (result i32)))
 (import "env" "_glLinkProgram" (func $_glLinkProgram (param i32)))
 (import "env" "_glShaderSource" (func $_glShaderSource (param i32 i32 i32 i32)))
 (import "env" "_glUniform1f" (func $_glUniform1f (param i32 f64)))
 (import "env" "_glUniform1i" (func $_glUniform1i (param i32 i32)))
 (import "env" "_glUseProgram" (func $_glUseProgram (param i32)))
 (import "env" "_glVertexAttribPointer" (func $_glVertexAttribPointer (param i32 i32 i32 i32 i32 i32)))
 (import "env" "_glViewport" (func $_glViewport (param i32 i32 i32 i32)))
 (import "env" "abortOnCannotGrowMemory" (func $abortOnCannotGrowMemory (param i32) (result i32)))
 (global $DYNAMICTOP_PTR (mut i32) (global.get $DYNAMICTOP_PTR$asm2wasm$import))
 (global $STACKTOP (mut i32) (i32.const 5824))
 (global $STACK_MAX (mut i32) (i32.const 5248704))
 (export "__growWasmMemory" (func $__growWasmMemory))
 (export "__GLOBAL__sub_I_emscripten_cpp" (func $__GLOBAL__sub_I_emscripten_cpp))
 (export "___errno_location" (func $___errno_location))
 (export "_blendTexturesRun" (func $_blendTexturesRun))
 (export "_clearContexts" (func $_clearContexts))
 (export "_createContext" (func $legalstub$_createContext))
 (export "_free" (func $_free))
 (export "_main" (func $_main))
 (export "_malloc" (func $_malloc))
 (export "_memcpy" (func $_memcpy))
 (export "_memset" (func $_memset))
 (export "_sbrk" (func $_sbrk))
 (export "dynCall_ii" (func $dynCall_ii))
 (export "dynCall_iiii" (func $dynCall_iiii))
 (export "dynCall_v" (func $dynCall_v))
 (export "establishStackSpace" (func $establishStackSpace))
 (export "stackAlloc" (func $stackAlloc))
 (export "stackRestore" (func $stackRestore))
 (export "stackSave" (func $stackSave))
 (func $__growWasmMemory (; 37 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (grow_memory
   (local.get $0)
  )
 )
 (func $stackAlloc (; 38 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local.set $1
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (local.get $0)
    (global.get $STACKTOP)
   )
  )
  (global.set $STACKTOP
   (i32.and
    (i32.add
     (global.get $STACKTOP)
     (i32.const 15)
    )
    (i32.const -16)
   )
  )
  (local.get $1)
 )
 (func $stackSave (; 39 ;) (; has Stack IR ;) (result i32)
  (global.get $STACKTOP)
 )
 (func $stackRestore (; 40 ;) (; has Stack IR ;) (param $0 i32)
  (global.set $STACKTOP
   (local.get $0)
  )
 )
 (func $establishStackSpace (; 41 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32)
  (global.set $STACKTOP
   (local.get $0)
  )
  (global.set $STACK_MAX
   (local.get $1)
  )
 )
 (func $_build_invert_program (; 42 ;) (; has Stack IR ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $2
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:160:0
  (local.set $3
   (call $__ZL13build_programPNSt3__212basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES6_
    (i32.const 3932)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:161:0
  (call $_glUseProgram
   (local.get $3)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:110:0
  (call $_glGenBuffers
   (i32.const 1)
   (local.get $2)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:111:0
  (local.set $1
   (i32.load
    (local.get $2)
   )
  )
  (call $_glBindBuffer
   (i32.const 34962)
   (local.get $1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:112:0
  (call $_glBufferData
   (i32.const 34962)
   (i32.const 48)
   (i32.const 1024)
   (i32.const 35044)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:114:0
  (local.set $1
   (call $_glGetAttribLocation
    (local.get $3)
    (i32.const 2794)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:115:0
  (call $_glEnableVertexAttribArray
   (local.get $1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:116:0
  (call $_glVertexAttribPointer
   (local.get $1)
   (i32.const 2)
   (i32.const 5126)
   (i32.const 0)
   (i32.const 0)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:117:0
  (local.set $4
   (i32.load
    (local.get $2)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:123:0
  (call $_glGenBuffers
   (i32.const 1)
   (local.get $2)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:124:0
  (local.set $1
   (i32.load
    (local.get $2)
   )
  )
  (call $_glBindBuffer
   (i32.const 34962)
   (local.get $1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:125:0
  (call $_glBufferData
   (i32.const 34962)
   (i32.const 48)
   (i32.const 1072)
   (i32.const 35044)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:127:0
  (local.set $1
   (call $_glGetAttribLocation
    (local.get $3)
    (i32.const 2803)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:128:0
  (call $_glEnableVertexAttribArray
   (local.get $1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:129:0
  (call $_glVertexAttribPointer
   (local.get $1)
   (i32.const 2)
   (i32.const 5126)
   (i32.const 0)
   (i32.const 0)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:130:0
  (local.set $5
   (i32.load
    (local.get $2)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:164:0
  (i32.store
   (local.get $0)
   (local.get $3)
  )
  (local.set $1
   (i32.add
    (local.get $0)
    (i32.const 4)
   )
  )
  (i32.store
   (local.get $1)
   (local.get $4)
  )
  (local.set $0
   (i32.add
    (local.get $0)
    (i32.const 8)
   )
  )
  (i32.store
   (local.get $0)
   (local.get $5)
  )
  (global.set $STACKTOP
   (local.get $2)
  )
 )
 (func $__ZL13build_programPNSt3__212basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES6_ (; 43 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local.set $3
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1255:0
  (local.set $1
   (i32.load8_s
    (i32.const 3931)
   )
  )
  (local.set $1
   (i32.lt_s
    (local.get $1)
    (i32.const 0)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1337:0
  (local.set $2
   (i32.load
    (i32.const 3920)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1349:0
  (local.set $1
   (select
    (local.get $2)
    (i32.const 3920)
    (local.get $1)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:137:0
  (local.set $1
   (call $__ZL12build_shaderPKcj
    (local.get $1)
    (i32.const 35633)
   )
  )
  (block $folding-inner0
   (br_if $folding-inner0
    (i32.eqz
     (local.get $1)
    )
   )
   ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1255:0
   (local.set $2
    (i32.add
     (local.get $0)
     (i32.const 11)
    )
   )
   (local.set $2
    (i32.load8_s
     (local.get $2)
    )
   )
   (if
    (i32.lt_s
     (local.get $2)
     (i32.const 0)
    )
    ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1337:0
    (local.set $0
     (i32.load
      (local.get $0)
     )
    )
   )
   ;;@ ./dev/cpp/openGLShading.cpp:138:0
   (local.set $2
    (call $__ZL12build_shaderPKcj
     (local.get $0)
     (i32.const 35632)
    )
   )
   (br_if $folding-inner0
    (i32.eqz
     (local.get $2)
    )
   )
   ;;@ ./dev/cpp/openGLShading.cpp:143:0
   (local.set $0
    (call $_glCreateProgram)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:144:0
   (call $_glAttachShader
    (local.get $0)
    (local.get $1)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:145:0
   (call $_glAttachShader
    (local.get $0)
    (local.get $2)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:146:0
   (call $_glLinkProgram
    (local.get $0)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:149:0
   (call $_glGetProgramiv
    (local.get $0)
    (i32.const 35714)
    (local.get $3)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:150:0
   (local.set $1
    (i32.load
     (local.get $3)
    )
   )
   (if
    (i32.ne
     (local.get $1)
     (i32.const 1)
    )
    ;;@ ./dev/cpp/openGLShading.cpp:153:0
    (call $_exit
     (i32.const 1)
    )
   )
   (global.set $STACKTOP
    (local.get $3)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:156:0
   (return
    (local.get $0)
   )
  )
  (global.set $STACKTOP
   (local.get $3)
  )
  (i32.const -1)
 )
 (func $_build_blend_program (; 44 ;) (; has Stack IR ;) (param $0 i32) (param $1 f32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local.set $3
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:172:0
  (local.set $4
   (call $__ZL13build_programPNSt3__212basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES6_
    (i32.const 3944)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:173:0
  (call $_glUseProgram
   (local.get $4)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:174:0
  (local.set $2
   (call $_glGetUniformLocation
    (local.get $4)
    (i32.const 2581)
   )
  )
  (call $_glUniform1f
   (local.get $2)
   (f64.promote_f32
    (local.get $1)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:110:0
  (call $_glGenBuffers
   (i32.const 1)
   (local.get $3)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:111:0
  (local.set $2
   (i32.load
    (local.get $3)
   )
  )
  (call $_glBindBuffer
   (i32.const 34962)
   (local.get $2)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:112:0
  (call $_glBufferData
   (i32.const 34962)
   (i32.const 48)
   (i32.const 1024)
   (i32.const 35044)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:114:0
  (local.set $2
   (call $_glGetAttribLocation
    (local.get $4)
    (i32.const 2794)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:115:0
  (call $_glEnableVertexAttribArray
   (local.get $2)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:116:0
  (call $_glVertexAttribPointer
   (local.get $2)
   (i32.const 2)
   (i32.const 5126)
   (i32.const 0)
   (i32.const 0)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:117:0
  (local.set $5
   (i32.load
    (local.get $3)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:123:0
  (call $_glGenBuffers
   (i32.const 1)
   (local.get $3)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:124:0
  (local.set $2
   (i32.load
    (local.get $3)
   )
  )
  (call $_glBindBuffer
   (i32.const 34962)
   (local.get $2)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:125:0
  (call $_glBufferData
   (i32.const 34962)
   (i32.const 48)
   (i32.const 1072)
   (i32.const 35044)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:127:0
  (local.set $2
   (call $_glGetAttribLocation
    (local.get $4)
    (i32.const 2803)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:128:0
  (call $_glEnableVertexAttribArray
   (local.get $2)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:129:0
  (call $_glVertexAttribPointer
   (local.get $2)
   (i32.const 2)
   (i32.const 5126)
   (i32.const 0)
   (i32.const 0)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:130:0
  (local.set $6
   (i32.load
    (local.get $3)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:177:0
  (i32.store
   (local.get $0)
   (local.get $4)
  )
  (local.set $2
   (i32.add
    (local.get $0)
    (i32.const 4)
   )
  )
  (i32.store
   (local.get $2)
   (local.get $5)
  )
  (local.set $0
   (i32.add
    (local.get $0)
    (i32.const 8)
   )
  )
  (i32.store
   (local.get $0)
   (local.get $6)
  )
  (global.set $STACKTOP
   (local.get $3)
  )
 )
 (func $_main (; 45 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  ;;@ ./dev/cpp/emscripten.cpp:12:0
  (drop
   (call $_puts)
  )
  ;;@ ./dev/cpp/emscripten.cpp:14:0
  (drop
   (call $_emscripten_asm_const_i
    (i32.const 0)
   )
  )
  ;;@ ./dev/cpp/emscripten.cpp:20:0
  (i32.const 0)
 )
 (func $_clearContexts (; 46 ;) (; has Stack IR ;)
  (nop)
 )
 (func $_createContext (; 47 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 f32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local.set $6
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 80)
   )
  )
  (local.set $7
   (i32.sub
    (local.get $6)
    (i32.const -64)
   )
  )
  (local.set $5
   (i32.add
    (local.get $6)
    (i32.const 16)
   )
  )
  (local.set $4
   (i32.add
    (local.get $6)
    (i32.const 8)
   )
  )
  ;;@ ./dev/cpp/emscripten.cpp:33:0
  (i32.store
   (local.get $6)
   (local.get $3)
  )
  (drop
   (call $_printf
    (i32.const 2791)
    (local.get $6)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:185:0
  (drop
   (call $_printf
    (i32.const 2593)
    (local.get $4)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:188:0
  (drop
   (call $_printf
    (i32.const 2604)
    (local.get $5)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:190:0
  (local.set $4
   (i32.add
    (local.get $5)
    (i32.const 44)
   )
  )
  (i32.store
   (local.get $4)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:191:0
  (local.set $4
   (i32.add
    (local.get $5)
    (i32.const 4)
   )
  )
  (i32.store
   (local.get $4)
   (i32.const 1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:192:0
  (local.set $4
   (i32.add
    (local.get $5)
    (i32.const 8)
   )
  )
  (i32.store
   (local.get $4)
   (i32.const 1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:193:0
  (local.set $4
   (i32.add
    (local.get $5)
    (i32.const 12)
   )
  )
  (i32.store
   (local.get $4)
   (i32.const 1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:194:0
  (local.set $4
   (i32.add
    (local.get $5)
    (i32.const 32)
   )
  )
  (i32.store
   (local.get $4)
   (i32.const 1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:195:0
  (local.set $4
   (i32.add
    (local.get $5)
    (i32.const 36)
   )
  )
  (i32.store
   (local.get $4)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:197:0
  (local.set $3
   (call $_emscripten_webgl_create_context
    (local.get $3)
    (local.get $5)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:198:0
  (i32.store
   (local.get $7)
   (local.get $3)
  )
  (drop
   (call $_printf
    (i32.const 2620)
    (local.get $7)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:199:0
  (drop
   (call $_emscripten_webgl_make_context_current
    (local.get $3)
   )
  )
  ;;@ ./dev/cpp/openGLShading.cpp:209:0
  (call $_glViewport
   (i32.const 0)
   (i32.const 0)
   (local.get $0)
   (local.get $1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:210:0
  (call $_build_invert_program
   (local.get $7)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:211:0
  (call $_build_blend_program
   (local.get $7)
   (local.get $2)
  )
  (i64.store align=4
   (i32.const 3956)
   (i64.load align=4
    (local.get $7)
   )
  )
  (i32.store
   (i32.const 3964)
   (i32.load offset=8
    (local.get $7)
   )
  )
  (global.set $STACKTOP
   (local.get $6)
  )
 )
 (func $_blendTexturesRun (; 48 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32)
  (local $2 i32)
  ;;@ ./dev/cpp/openGLShading.cpp:230:0
  (local.set $2
   (i32.load
    (i32.const 3956)
   )
  )
  (call $_glUseProgram
   (local.get $2)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:231:0
  (local.set $2
   (i32.load
    (i32.const 3956)
   )
  )
  (local.set $2
   (call $_glGetUniformLocation
    (local.get $2)
    (i32.const 2638)
   )
  )
  (call $_glUniform1i
   (local.get $2)
   (local.get $0)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:232:0
  (local.set $0
   (i32.load
    (i32.const 3956)
   )
  )
  (local.set $0
   (call $_glGetUniformLocation
    (local.get $0)
    (i32.const 2643)
   )
  )
  (call $_glUniform1i
   (local.get $0)
   (local.get $1)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:233:0
  (call $_glDrawArrays
   (i32.const 4)
   (i32.const 0)
   (i32.const 6)
  )
 )
 (func $__ZL12build_shaderPKcj (; 49 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $2
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (local.set $4
   (i32.add
    (local.get $2)
    (i32.const 12)
   )
  )
  (local.set $3
   (i32.add
    (local.get $2)
    (i32.const 4)
   )
  )
  (i32.store
   (local.tee $5
    (i32.add
     (local.get $2)
     (i32.const 8)
    )
   )
   (local.get $0)
  )
  ;;@ ./dev/cpp/openGLShading.cpp:85:0
  (local.set $0
   (call $_glCreateShader
    (local.get $1)
   )
  )
  (block $folding-inner0
   ;;@ ./dev/cpp/openGLShading.cpp:86:0
   (br_if $folding-inner0
    (i32.eqz
     (local.get $0)
    )
   )
   (local.set $1
    (call $_glIsShader
     (local.get $0)
    )
   )
   (br_if $folding-inner0
    (i32.eqz
     (i32.and
      (local.get $1)
      (i32.const 255)
     )
    )
   )
   ;;@ ./dev/cpp/openGLShading.cpp:90:0
   (call $_glShaderSource
    (local.get $0)
    (i32.const 1)
    (local.get $5)
    (i32.const 0)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:91:0
   (call $_glCompileShader
    (local.get $0)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:93:0
   (call $_glGetShaderiv
    (local.get $0)
    (i32.const 35713)
    (local.get $4)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:94:0
   (local.set $1
    (i32.load
     (local.get $4)
    )
   )
   (if
    (i32.ne
     (local.get $1)
     (i32.const 1)
    )
    (block
     ;;@ ./dev/cpp/openGLShading.cpp:98:0
     (i32.store
      (local.get $3)
      (i32.const 0)
     )
     ;;@ ./dev/cpp/openGLShading.cpp:99:0
     (call $_glGetShaderiv
      (local.get $0)
      (i32.const 35716)
      (local.get $3)
     )
     ;;@ ./dev/cpp/openGLShading.cpp:100:0
     (local.set $3
      (i32.load
       (local.get $3)
      )
     )
     (local.set $1
      (call $_calloc
       (local.get $3)
      )
     )
     ;;@ ./dev/cpp/openGLShading.cpp:101:0
     (call $_glGetShaderInfoLog
      (local.get $0)
      (local.get $3)
      (i32.const 0)
      (local.get $1)
     )
     ;;@ ./dev/cpp/openGLShading.cpp:102:0
     (i32.store
      (local.get $2)
      (local.get $1)
     )
     (drop
      (call $_printf
       (i32.const 2791)
       (local.get $2)
      )
     )
     ;;@ ./dev/cpp/openGLShading.cpp:103:0
     (call $_free
      (local.get $1)
     )
     (local.set $0
      (i32.const 0)
     )
    )
   )
   (global.set $STACKTOP
    (local.get $2)
   )
   ;;@ ./dev/cpp/openGLShading.cpp:105:0
   (return
    (local.get $0)
   )
  )
  (global.set $STACKTOP
   (local.get $2)
  )
  (i32.const 0)
 )
 (func $__GLOBAL__sub_I_emscripten_cpp (; 50 ;) (; has Stack IR ;)
  (local $0 i32)
  (i64.store align=4
   (i32.const 3920)
   (i64.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/memory:2089:0
  (i32.store
   (i32.const 3928)
   (i32.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/new:228:0
  (local.set $0
   (call $__Znwm
    (i32.const 176)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1331:0
  (i32.store
   (i32.const 3920)
   (local.get $0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1324:0
  (i32.store
   (i32.const 3928)
   (i32.const -2147483472)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1314:0
  (i32.store
   (i32.const 3924)
   (i32.const 160)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:225:0
  (drop
   (call $_memcpy
    (local.get $0)
    (i32.const 1972)
    (i32.const 160)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1597:0
  (local.set $0
   (i32.add
    (local.get $0)
    (i32.const 160)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:208:0
  (i32.store8
   (local.get $0)
   (i32.const 0)
  )
  (i64.store align=4
   (i32.const 3932)
   (i64.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/memory:2089:0
  (i32.store
   (i32.const 3940)
   (i32.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/new:228:0
  (local.set $0
   (call $__Znwm
    (i32.const 176)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1331:0
  (i32.store
   (i32.const 3932)
   (local.get $0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1324:0
  (i32.store
   (i32.const 3940)
   (i32.const -2147483472)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1314:0
  (i32.store
   (i32.const 3936)
   (i32.const 162)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:225:0
  (drop
   (call $_memcpy
    (local.get $0)
    (i32.const 2133)
    (i32.const 162)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1597:0
  (local.set $0
   (i32.add
    (local.get $0)
    (i32.const 162)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:208:0
  (i32.store8
   (local.get $0)
   (i32.const 0)
  )
  (i64.store align=4
   (i32.const 3944)
   (i64.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/memory:2089:0
  (i32.store
   (i32.const 3952)
   (i32.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/new:228:0
  (local.set $0
   (call $__Znwm
    (i32.const 288)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1331:0
  (i32.store
   (i32.const 3944)
   (local.get $0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1324:0
  (i32.store
   (i32.const 3952)
   (i32.const -2147483360)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1314:0
  (i32.store
   (i32.const 3948)
   (i32.const 284)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:225:0
  (drop
   (call $_memcpy
    (local.get $0)
    (i32.const 2296)
    (i32.const 284)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1597:0
  (local.set $0
   (i32.add
    (local.get $0)
    (i32.const 284)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:208:0
  (i32.store8
   (local.get $0)
   (i32.const 0)
  )
 )
 (func $___stdio_close (; 51 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local.set $1
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (i32.store
   (local.get $1)
   (call $_dummy
    (i32.load offset=60
     (local.get $0)
    )
   )
  )
  (local.set $0
   (call $___syscall_ret
    (call $___syscall6
     (i32.const 6)
     (local.get $1)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $1)
  )
  (local.get $0)
 )
 (func $___stdio_write (; 52 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local.set $7
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 48)
   )
  )
  (local.set $5
   (i32.add
    (local.get $7)
    (i32.const 32)
   )
  )
  (i32.store
   (local.tee $3
    (local.get $7)
   )
   (local.tee $4
    (i32.load
     (local.tee $10
      (i32.add
       (local.get $0)
       (i32.const 28)
      )
     )
    )
   )
  )
  (i32.store offset=4
   (local.get $3)
   (local.tee $4
    (i32.sub
     (i32.load
      (local.tee $11
       (i32.add
        (local.get $0)
        (i32.const 20)
       )
      )
     )
     (local.get $4)
    )
   )
  )
  (i32.store offset=8
   (local.get $3)
   (local.get $1)
  )
  (i32.store offset=12
   (local.get $3)
   (local.get $2)
  )
  (i32.store
   (local.tee $1
    (i32.add
     (local.get $3)
     (i32.const 16)
    )
   )
   (i32.load
    (local.tee $12
     (i32.add
      (local.get $0)
      (i32.const 60)
     )
    )
   )
  )
  (i32.store offset=4
   (local.get $1)
   (local.get $3)
  )
  (i32.store offset=8
   (local.get $1)
   (i32.const 2)
  )
  (block $__rjto$0
   (block $__rjti$0
    (br_if $__rjti$0
     (i32.eq
      (local.tee $4
       (i32.add
        (local.get $2)
        (local.get $4)
       )
      )
      (local.tee $6
       (call $___syscall_ret
        (call $___syscall146
         (i32.const 146)
         (local.get $1)
        )
       )
      )
     )
    )
    (local.set $8
     (i32.const 2)
    )
    (local.set $1
     (local.get $3)
    )
    (local.set $3
     (local.get $6)
    )
    (loop $while-in
     (if
      (i32.ge_s
       (local.get $3)
       (i32.const 0)
      )
      (block
       (i32.store
        (local.tee $1
         (select
          (i32.add
           (local.get $1)
           (i32.const 8)
          )
          (local.get $1)
          (local.tee $6
           (i32.gt_u
            (local.get $3)
            (local.tee $9
             (i32.load offset=4
              (local.get $1)
             )
            )
           )
          )
         )
        )
        (i32.add
         (local.tee $9
          (i32.sub
           (local.get $3)
           (select
            (local.get $9)
            (i32.const 0)
            (local.get $6)
           )
          )
         )
         (i32.load
          (local.get $1)
         )
        )
       )
       (i32.store
        (local.tee $13
         (i32.add
          (local.get $1)
          (i32.const 4)
         )
        )
        (i32.sub
         (i32.load
          (local.get $13)
         )
         (local.get $9)
        )
       )
       (i32.store
        (local.get $5)
        (i32.load
         (local.get $12)
        )
       )
       (i32.store offset=4
        (local.get $5)
        (local.get $1)
       )
       (i32.store offset=8
        (local.get $5)
        (local.tee $8
         (i32.add
          (local.get $8)
          (i32.shr_s
           (i32.shl
            (local.get $6)
            (i32.const 31)
           )
           (i32.const 31)
          )
         )
        )
       )
       (br_if $__rjti$0
        (i32.eq
         (local.tee $4
          (i32.sub
           (local.get $4)
           (local.get $3)
          )
         )
         (local.tee $3
          (call $___syscall_ret
           (call $___syscall146
            (i32.const 146)
            (local.get $5)
           )
          )
         )
        )
       )
       (br $while-in)
      )
     )
    )
    (i32.store offset=16
     (local.get $0)
     (i32.const 0)
    )
    (i32.store
     (local.get $10)
     (i32.const 0)
    )
    (i32.store
     (local.get $11)
     (i32.const 0)
    )
    (i32.store
     (local.get $0)
     (i32.or
      (i32.load
       (local.get $0)
      )
      (i32.const 32)
     )
    )
    (local.set $2
     (if (result i32)
      (i32.eq
       (local.get $8)
       (i32.const 2)
      )
      (i32.const 0)
      (i32.sub
       (local.get $2)
       (i32.load offset=4
        (local.get $1)
       )
      )
     )
    )
    (br $__rjto$0)
   )
   (i32.store offset=16
    (local.get $0)
    (i32.add
     (local.tee $1
      (i32.load offset=44
       (local.get $0)
      )
     )
     (i32.load offset=48
      (local.get $0)
     )
    )
   )
   (i32.store
    (local.get $10)
    (local.get $1)
   )
   (i32.store
    (local.get $11)
    (local.get $1)
   )
  )
  (global.set $STACKTOP
   (local.get $7)
  )
  (local.get $2)
 )
 (func $___stdio_seek (; 53 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local.set $3
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 32)
   )
  )
  (i32.store
   (local.get $3)
   (i32.load offset=60
    (local.get $0)
   )
  )
  (i32.store offset=4
   (local.get $3)
   (i32.const 0)
  )
  (i32.store offset=8
   (local.get $3)
   (local.get $1)
  )
  (i32.store offset=12
   (local.get $3)
   (local.tee $0
    (i32.add
     (local.get $3)
     (i32.const 20)
    )
   )
  )
  (i32.store offset=16
   (local.get $3)
   (local.get $2)
  )
  (local.set $0
   (if (result i32)
    (i32.lt_s
     (call $___syscall_ret
      (call $___syscall140
       (i32.const 140)
       (local.get $3)
      )
     )
     (i32.const 0)
    )
    (block (result i32)
     (i32.store
      (local.get $0)
      (i32.const -1)
     )
     (i32.const -1)
    )
    (i32.load
     (local.get $0)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $3)
  )
  (local.get $0)
 )
 (func $___syscall_ret (; 54 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (if
   (i32.gt_u
    (local.get $0)
    (i32.const -4096)
   )
   (block
    (local.set $0
     (i32.sub
      (i32.const 0)
      (local.get $0)
     )
    )
    (i32.store
     (call $___errno_location)
     (local.get $0)
    )
    (local.set $0
     (i32.const -1)
    )
   )
  )
  (local.get $0)
 )
 (func $___errno_location (; 55 ;) (; has Stack IR ;) (result i32)
  (i32.const 4032)
 )
 (func $_dummy (; 56 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local.get $0)
 )
 (func $___stdout_write (; 57 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local.set $3
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 32)
   )
  )
  (local.set $4
   (i32.add
    (local.get $3)
    (i32.const 16)
   )
  )
  (i32.store offset=36
   (local.get $0)
   (i32.const 3)
  )
  (if
   (i32.eqz
    (i32.and
     (i32.load
      (local.get $0)
     )
     (i32.const 64)
    )
   )
   (block
    (i32.store
     (local.get $3)
     (i32.load offset=60
      (local.get $0)
     )
    )
    (i32.store offset=4
     (local.get $3)
     (i32.const 21523)
    )
    (i32.store offset=8
     (local.get $3)
     (local.get $4)
    )
    (if
     (call $___syscall54
      (i32.const 54)
      (local.get $3)
     )
     (i32.store8 offset=75
      (local.get $0)
      (i32.const -1)
     )
    )
   )
  )
  (local.set $0
   (call $___stdio_write
    (local.get $0)
    (local.get $1)
    (local.get $2)
   )
  )
  (global.set $STACKTOP
   (local.get $3)
  )
  (local.get $0)
 )
 (func $_isdigit (; 58 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (i32.lt_u
   (i32.add
    (local.get $0)
    (i32.const -48)
   )
   (i32.const 10)
  )
 )
 (func $_pthread_self (; 59 ;) (; has Stack IR ;) (result i32)
  (i32.const 1728)
 )
 (func $_strlen (; 60 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (block $__rjto$0
   (block $__rjti$0
    (br_if $__rjti$0
     (i32.eqz
      (i32.and
       (local.tee $2
        (local.get $0)
       )
       (i32.const 3)
      )
     )
    )
    (local.set $0
     (local.tee $1
      (local.get $2)
     )
    )
    (block $label$break$L1
     (loop $while-in
      (br_if $label$break$L1
       (i32.eqz
        (i32.load8_s
         (local.get $1)
        )
       )
      )
      (br_if $while-in
       (i32.and
        (local.tee $0
         (local.tee $1
          (i32.add
           (local.get $1)
           (i32.const 1)
          )
         )
        )
        (i32.const 3)
       )
      )
     )
     (local.set $0
      (local.get $1)
     )
     (br $__rjti$0)
    )
    (br $__rjto$0)
   )
   (loop $while-in1
    (local.set $1
     (i32.add
      (local.get $0)
      (i32.const 4)
     )
    )
    (if
     (i32.eqz
      (i32.and
       (i32.add
        (local.tee $3
         (i32.load
          (local.get $0)
         )
        )
        (i32.const -16843009)
       )
       (i32.xor
        (i32.and
         (local.get $3)
         (i32.const -2139062144)
        )
        (i32.const -2139062144)
       )
      )
     )
     (block
      (local.set $0
       (local.get $1)
      )
      (br $while-in1)
     )
    )
   )
   (if
    (i32.and
     (local.get $3)
     (i32.const 255)
    )
    (loop $while-in3
     (br_if $while-in3
      (i32.load8_s
       (local.tee $0
        (i32.add
         (local.get $0)
         (i32.const 1)
        )
       )
      )
     )
    )
   )
  )
  (i32.sub
   (local.get $0)
   (local.get $2)
  )
 )
 (func $_fputs (; 61 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (i32.shr_s
   (i32.shl
    (i32.ne
     (local.tee $2
      (call $_strlen
       (local.get $0)
      )
     )
     (call $_fwrite
      (local.get $0)
      (local.get $2)
      (local.get $1)
     )
    )
    (i32.const 31)
   )
   (i32.const 31)
  )
 )
 (func $_fwrite (; 62 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local.set $3
   (local.get $1)
  )
  (if
   (i32.gt_s
    (i32.load offset=76
     (local.get $2)
    )
    (i32.const -1)
   )
   (block
    (local.set $1
     (i32.eqz
      (call $___lockfile)
     )
    )
    (local.set $0
     (call $___fwritex
      (local.get $0)
      (local.get $3)
      (local.get $2)
     )
    )
    (if
     (i32.eqz
      (local.get $1)
     )
     (call $_clearContexts)
    )
   )
   (local.set $0
    (call $___fwritex
     (local.get $0)
     (local.get $3)
     (local.get $2)
    )
   )
  )
  (local.set $1
   (local.get $3)
  )
  (select
   (local.get $0)
   (local.get $1)
   (i32.ne
    (local.get $0)
    (local.get $3)
   )
  )
 )
 (func $___lockfile (; 63 ;) (; has Stack IR ;) (result i32)
  (i32.const 1)
 )
 (func $___overflow (; 64 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local.set $2
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (i32.store8
   (local.get $2)
   (i32.const 10)
  )
  (block $do-once
   (block $__rjti$0
    (br_if $__rjti$0
     (local.tee $1
      (i32.load
       (local.tee $3
        (i32.add
         (local.get $0)
         (i32.const 16)
        )
       )
      )
     )
    )
    (local.set $1
     (if (result i32)
      (call $___towrite
       (local.get $0)
      )
      (i32.const -1)
      (block
       (local.set $1
        (i32.load
         (local.get $3)
        )
       )
       (br $__rjti$0)
      )
     )
    )
    (br $do-once)
   )
   (if
    (i32.lt_u
     (local.tee $4
      (i32.load
       (local.tee $3
        (i32.add
         (local.get $0)
         (i32.const 20)
        )
       )
      )
     )
     (local.get $1)
    )
    (if
     (i32.ne
      (local.tee $1
       (i32.const 10)
      )
      (i32.load8_s offset=75
       (local.get $0)
      )
     )
     (block
      (i32.store
       (local.get $3)
       (i32.add
        (local.get $4)
        (i32.const 1)
       )
      )
      (i32.store8
       (local.get $4)
       (i32.const 10)
      )
      (br $do-once)
     )
    )
   )
   (local.set $1
    (if (result i32)
     (i32.eq
      (call_indirect (type $FUNCSIG$iiii)
       (local.get $0)
       (local.get $2)
       (i32.const 1)
       (i32.add
        (i32.and
         (i32.load offset=36
          (local.get $0)
         )
         (i32.const 3)
        )
        (i32.const 2)
       )
      )
      (i32.const 1)
     )
     (i32.load8_u
      (local.get $2)
     )
     (i32.const -1)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $2)
  )
  (local.get $1)
 )
 (func $___towrite (; 65 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local.set $1
   (i32.load8_s
    (local.tee $2
     (i32.add
      (local.get $0)
      (i32.const 74)
     )
    )
   )
  )
  (i32.store8
   (local.get $2)
   (i32.or
    (local.get $1)
    (i32.add
     (local.get $1)
     (i32.const 255)
    )
   )
  )
  (if (result i32)
   (i32.and
    (local.tee $1
     (i32.load
      (local.get $0)
     )
    )
    (i32.const 8)
   )
   (block (result i32)
    (i32.store
     (local.get $0)
     (i32.or
      (local.get $1)
      (i32.const 32)
     )
    )
    (i32.const -1)
   )
   (block (result i32)
    (i32.store offset=8
     (local.get $0)
     (i32.const 0)
    )
    (i32.store offset=4
     (local.get $0)
     (i32.const 0)
    )
    (i32.store offset=28
     (local.get $0)
     (local.tee $1
      (i32.load offset=44
       (local.get $0)
      )
     )
    )
    (i32.store offset=20
     (local.get $0)
     (local.get $1)
    )
    (i32.store offset=16
     (local.get $0)
     (i32.add
      (local.get $1)
      (i32.load offset=48
       (local.get $0)
      )
     )
    )
    (i32.const 0)
   )
  )
 )
 (func $___fwritex (; 66 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (block $label$break$L5
   (block $__rjti$0
    (br_if $__rjti$0
     (local.tee $3
      (i32.load
       (local.tee $4
        (i32.add
         (local.get $2)
         (i32.const 16)
        )
       )
      )
     )
    )
    (local.set $2
     (if (result i32)
      (call $___towrite
       (local.get $2)
      )
      (i32.const 0)
      (block
       (local.set $3
        (i32.load
         (local.get $4)
        )
       )
       (br $__rjti$0)
      )
     )
    )
    (br $label$break$L5)
   )
   (if
    (i32.lt_u
     (i32.sub
      (local.get $3)
      (local.tee $4
       (i32.load
        (local.tee $5
         (i32.add
          (local.get $2)
          (i32.const 20)
         )
        )
       )
      )
     )
     (local.get $1)
    )
    (block
     (local.set $3
      (i32.load offset=36
       (local.get $2)
      )
     )
     (local.set $2
      (call_indirect (type $FUNCSIG$iiii)
       (local.get $2)
       (local.get $0)
       (local.get $1)
       (i32.add
        (i32.and
         (local.get $3)
         (i32.const 3)
        )
        (i32.const 2)
       )
      )
     )
     (br $label$break$L5)
    )
   )
   (if
    (i32.or
     (i32.eqz
      (local.get $1)
     )
     (i32.lt_s
      (i32.load8_s offset=75
       (local.get $2)
      )
      (i32.const 0)
     )
    )
    (local.set $3
     (i32.const 0)
    )
    (block $label$break$L10
     (local.set $3
      (local.get $1)
     )
     (loop $while-in
      (if
       (i32.ne
        (i32.load8_s
         (i32.add
          (local.get $0)
          (local.tee $6
           (i32.add
            (local.get $3)
            (i32.const -1)
           )
          )
         )
        )
        (i32.const 10)
       )
       (if
        (local.get $6)
        (block
         (local.set $3
          (local.get $6)
         )
         (br $while-in)
        )
        (block
         (local.set $3
          (i32.const 0)
         )
         (br $label$break$L10)
        )
       )
      )
     )
     (local.set $4
      (i32.load offset=36
       (local.get $2)
      )
     )
     (br_if $label$break$L5
      (i32.lt_u
       (local.tee $2
        (call_indirect (type $FUNCSIG$iiii)
         (local.get $2)
         (local.get $0)
         (local.get $3)
         (i32.add
          (i32.and
           (local.get $4)
           (i32.const 3)
          )
          (i32.const 2)
         )
        )
       )
       (local.get $3)
      )
     )
     (local.set $0
      (i32.add
       (local.get $0)
       (local.get $3)
      )
     )
     (local.set $1
      (i32.sub
       (local.get $1)
       (local.get $3)
      )
     )
     (local.set $4
      (i32.load
       (local.get $5)
      )
     )
    )
   )
   (drop
    (call $_memcpy
     (local.get $4)
     (local.get $0)
     (local.get $1)
    )
   )
   (i32.store
    (local.get $5)
    (i32.add
     (local.get $1)
     (i32.load
      (local.get $5)
     )
    )
   )
   (local.set $2
    (i32.add
     (local.get $1)
     (local.get $3)
    )
   )
  )
  (local.get $2)
 )
 (func $_memchr (; 67 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (block $__rjto$3
   (block $__rjti$3
    (block $__rjti$2
     (if
      (i32.and
       (local.tee $2
        (i32.ne
         (local.get $1)
         (i32.const 0)
        )
       )
       (i32.ne
        (i32.and
         (local.get $0)
         (i32.const 3)
        )
        (i32.const 0)
       )
      )
      (loop $while-in
       (br_if $__rjti$2
        (i32.eqz
         (i32.load8_u
          (local.get $0)
         )
        )
       )
       (br_if $while-in
        (i32.and
         (local.tee $2
          (i32.ne
           (local.tee $1
            (i32.add
             (local.get $1)
             (i32.const -1)
            )
           )
           (i32.const 0)
          )
         )
         (i32.ne
          (i32.and
           (local.tee $0
            (i32.add
             (local.get $0)
             (i32.const 1)
            )
           )
           (i32.const 3)
          )
          (i32.const 0)
         )
        )
       )
      )
     )
     (br_if $__rjti$3
      (i32.eqz
       (local.get $2)
      )
     )
    )
    (if
     (i32.eqz
      (i32.load8_u
       (local.get $0)
      )
     )
     (if
      (local.get $1)
      (br $__rjto$3)
      (br $__rjti$3)
     )
    )
    (block $__rjto$0
     (block $__rjti$0
      (br_if $__rjti$0
       (i32.le_u
        (local.get $1)
        (i32.const 3)
       )
      )
      (loop $while-in3
       (if
        (i32.eqz
         (i32.and
          (i32.add
           (local.tee $2
            (i32.load
             (local.get $0)
            )
           )
           (i32.const -16843009)
          )
          (i32.xor
           (i32.and
            (local.get $2)
            (i32.const -2139062144)
           )
           (i32.const -2139062144)
          )
         )
        )
        (block
         (local.set $0
          (i32.add
           (local.get $0)
           (i32.const 4)
          )
         )
         (br_if $while-in3
          (i32.gt_u
           (local.tee $1
            (i32.add
             (local.get $1)
             (i32.const -4)
            )
           )
           (i32.const 3)
          )
         )
         (br $__rjti$0)
        )
       )
      )
      (br $__rjto$0)
     )
     (br_if $__rjti$3
      (i32.eqz
       (local.get $1)
      )
     )
    )
    (loop $while-in5
     (br_if $__rjto$3
      (i32.eqz
       (i32.load8_u
        (local.get $0)
       )
      )
     )
     (local.set $0
      (i32.add
       (local.get $0)
       (i32.const 1)
      )
     )
     (br_if $while-in5
      (local.tee $1
       (i32.add
        (local.get $1)
        (i32.const -1)
       )
      )
     )
    )
   )
   (local.set $0
    (i32.const 0)
   )
  )
  (local.get $0)
 )
 (func $_vfprintf (; 68 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local.set $3
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 224)
   )
  )
  (i64.store
   (local.tee $4
    (i32.add
     (local.get $3)
     (i32.const 160)
    )
   )
   (i64.const 0)
  )
  (i64.store offset=8
   (local.get $4)
   (i64.const 0)
  )
  (i64.store offset=16
   (local.get $4)
   (i64.const 0)
  )
  (i64.store offset=24
   (local.get $4)
   (i64.const 0)
  )
  (i64.store offset=32
   (local.get $4)
   (i64.const 0)
  )
  (i32.store
   (local.tee $5
    (i32.add
     (local.get $3)
     (i32.const 208)
    )
   )
   (i32.load
    (local.get $2)
   )
  )
  (local.set $0
   (if (result i32)
    (i32.lt_s
     (call $_printf_core
      (i32.const 0)
      (local.get $1)
      (local.get $5)
      (local.tee $2
       (i32.add
        (local.get $3)
        (i32.const 80)
       )
      )
      (local.get $4)
     )
     (i32.const 0)
    )
    (i32.const -1)
    (block (result i32)
     (local.set $11
      (if (result i32)
       (i32.gt_s
        (i32.load offset=76
         (local.get $0)
        )
        (i32.const -1)
       )
       (call $___lockfile)
       (i32.const 0)
      )
     )
     (local.set $6
      (i32.load
       (local.get $0)
      )
     )
     (if
      (i32.lt_s
       (i32.load8_s offset=74
        (local.get $0)
       )
       (i32.const 1)
      )
      (i32.store
       (local.get $0)
       (i32.and
        (local.get $6)
        (i32.const -33)
       )
      )
     )
     (if
      (i32.load
       (local.tee $7
        (i32.add
         (local.get $0)
         (i32.const 48)
        )
       )
      )
      (local.set $1
       (call $_printf_core
        (local.get $0)
        (local.get $1)
        (local.get $5)
        (local.get $2)
        (local.get $4)
       )
      )
      (block
       (local.set $9
        (i32.load
         (local.tee $8
          (i32.add
           (local.get $0)
           (i32.const 44)
          )
         )
        )
       )
       (i32.store
        (local.get $8)
        (local.get $3)
       )
       (i32.store
        (local.tee $12
         (i32.add
          (local.get $0)
          (i32.const 28)
         )
        )
        (local.get $3)
       )
       (i32.store
        (local.tee $10
         (i32.add
          (local.get $0)
          (i32.const 20)
         )
        )
        (local.get $3)
       )
       (i32.store
        (local.get $7)
        (i32.const 80)
       )
       (i32.store
        (local.tee $13
         (i32.add
          (local.get $0)
          (i32.const 16)
         )
        )
        (i32.add
         (local.get $3)
         (i32.const 80)
        )
       )
       (local.set $1
        (call $_printf_core
         (local.get $0)
         (local.get $1)
         (local.get $5)
         (local.get $2)
         (local.get $4)
        )
       )
       (if
        (local.get $9)
        (block
         (local.set $2
          (i32.load offset=36
           (local.get $0)
          )
         )
         (drop
          (call_indirect (type $FUNCSIG$iiii)
           (local.get $0)
           (i32.const 0)
           (i32.const 0)
           (i32.add
            (i32.and
             (local.get $2)
             (i32.const 3)
            )
            (i32.const 2)
           )
          )
         )
         (local.set $1
          (select
           (local.get $1)
           (i32.const -1)
           (i32.load
            (local.get $10)
           )
          )
         )
         (i32.store
          (local.get $8)
          (local.get $9)
         )
         (i32.store
          (local.get $7)
          (i32.const 0)
         )
         (i32.store
          (local.get $13)
          (i32.const 0)
         )
         (i32.store
          (local.get $12)
          (i32.const 0)
         )
         (i32.store
          (local.get $10)
          (i32.const 0)
         )
        )
       )
      )
     )
     (i32.store
      (local.get $0)
      (i32.or
       (local.tee $2
        (i32.load
         (local.get $0)
        )
       )
       (i32.and
        (local.get $6)
        (i32.const 32)
       )
      )
     )
     (if
      (local.get $11)
      (call $_clearContexts)
     )
     (select
      (i32.const -1)
      (local.get $1)
      (i32.and
       (local.get $2)
       (i32.const 32)
      )
     )
    )
   )
  )
  (global.set $STACKTOP
   (local.get $3)
  )
  (local.get $0)
 )
 (func $_printf_core (; 69 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i64)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i32)
  (local.set $18
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.sub
    (global.get $STACKTOP)
    (i32.const -64)
   )
  )
  (local.set $11
   (i32.add
    (local.get $18)
    (i32.const 40)
   )
  )
  (local.set $23
   (i32.add
    (local.get $18)
    (i32.const 60)
   )
  )
  (i32.store
   (local.tee $12
    (i32.add
     (local.get $18)
     (i32.const 56)
    )
   )
   (local.get $1)
  )
  (local.set $20
   (i32.ne
    (local.get $0)
    (i32.const 0)
   )
  )
  (local.set $21
   (local.tee $22
    (i32.add
     (local.get $18)
     (i32.const 40)
    )
   )
  )
  (local.set $24
   (i32.add
    (local.get $18)
    (i32.const 39)
   )
  )
  (local.set $26
   (i32.add
    (local.tee $25
     (i32.add
      (local.get $18)
      (i32.const 48)
     )
    )
    (i32.const 4)
   )
  )
  (local.set $1
   (i32.const 0)
  )
  (block $label$break$L123
   (block $__rjti$10
    (loop $label$continue$L1
     (block $label$break$L1
      (loop $while-in
       (if
        (i32.gt_s
         (local.get $8)
         (i32.const -1)
        )
        (local.set $8
         (if (result i32)
          (i32.gt_s
           (local.get $1)
           (i32.sub
            (i32.const 2147483647)
            (local.get $8)
           )
          )
          (block (result i32)
           (i32.store
            (call $___errno_location)
            (i32.const 75)
           )
           (i32.const -1)
          )
          (i32.add
           (local.get $1)
           (local.get $8)
          )
         )
        )
       )
       (br_if $__rjti$10
        (i32.eqz
         (local.tee $9
          (i32.load8_s
           (local.tee $10
            (i32.load
             (local.get $12)
            )
           )
          )
         )
        )
       )
       (local.set $1
        (local.get $10)
       )
       (block $label$break$L15
        (block $__rjti$0
         (loop $label$continue$L12
          (block $label$break$L12
           (block $switch
            (br_table $label$break$L12 $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $switch $__rjti$0 $switch
             (i32.shr_s
              (i32.shl
               (local.get $9)
               (i32.const 24)
              )
              (i32.const 24)
             )
            )
           )
           (i32.store
            (local.get $12)
            (local.tee $1
             (i32.add
              (local.get $1)
              (i32.const 1)
             )
            )
           )
           (local.set $9
            (i32.load8_s
             (local.get $1)
            )
           )
           (br $label$continue$L12)
          )
         )
         (br $label$break$L15)
        )
        (local.set $9
         (local.get $1)
        )
        (loop $while-in3
         (br_if $label$break$L15
          (i32.ne
           (i32.load8_s offset=1
            (local.get $9)
           )
           (i32.const 37)
          )
         )
         (local.set $1
          (i32.add
           (local.get $1)
           (i32.const 1)
          )
         )
         (i32.store
          (local.get $12)
          (local.tee $9
           (i32.add
            (local.get $9)
            (i32.const 2)
           )
          )
         )
         (br_if $while-in3
          (i32.eq
           (i32.load8_s
            (local.get $9)
           )
           (i32.const 37)
          )
         )
        )
       )
       (local.set $1
        (i32.sub
         (local.get $1)
         (local.get $10)
        )
       )
       (if
        (local.get $20)
        (call $_out_655
         (local.get $0)
         (local.get $10)
         (local.get $1)
        )
       )
       (br_if $while-in
        (local.get $1)
       )
      )
      (local.set $9
       (i32.eqz
        (call $_isdigit
         (i32.load8_s offset=1
          (i32.load
           (local.get $12)
          )
         )
        )
       )
      )
      (i32.store
       (local.get $12)
       (local.tee $1
        (i32.add
         (local.tee $1
          (i32.load
           (local.get $12)
          )
         )
         (if (result i32)
          (local.get $9)
          (block (result i32)
           (local.set $14
            (i32.const -1)
           )
           (i32.const 1)
          )
          (if (result i32)
           (i32.eq
            (i32.load8_s offset=2
             (local.get $1)
            )
            (i32.const 36)
           )
           (block (result i32)
            (local.set $14
             (i32.add
              (i32.load8_s offset=1
               (local.get $1)
              )
              (i32.const -48)
             )
            )
            (local.set $5
             (i32.const 1)
            )
            (i32.const 3)
           )
           (block (result i32)
            (local.set $14
             (i32.const -1)
            )
            (i32.const 1)
           )
          )
         )
        )
       )
      )
      (if
       (i32.or
        (i32.gt_u
         (local.tee $9
          (i32.add
           (local.tee $6
            (i32.load8_s
             (local.get $1)
            )
           )
           (i32.const -32)
          )
         )
         (i32.const 31)
        )
        (i32.eqz
         (i32.and
          (i32.shl
           (i32.const 1)
           (local.get $9)
          )
          (i32.const 75913)
         )
        )
       )
       (local.set $9
        (i32.const 0)
       )
       (block
        (local.set $6
         (i32.const 0)
        )
        (loop $while-in5
         (local.set $9
          (i32.or
           (local.get $6)
           (i32.shl
            (i32.const 1)
            (local.get $9)
           )
          )
         )
         (i32.store
          (local.get $12)
          (local.tee $1
           (i32.add
            (local.get $1)
            (i32.const 1)
           )
          )
         )
         (if
          (i32.eqz
           (i32.or
            (i32.gt_u
             (local.tee $7
              (i32.add
               (local.tee $6
                (i32.load8_s
                 (local.get $1)
                )
               )
               (i32.const -32)
              )
             )
             (i32.const 31)
            )
            (i32.eqz
             (i32.and
              (i32.shl
               (i32.const 1)
               (local.get $7)
              )
              (i32.const 75913)
             )
            )
           )
          )
          (block
           (local.set $6
            (local.get $9)
           )
           (local.set $9
            (local.get $7)
           )
           (br $while-in5)
          )
         )
        )
       )
      )
      (if
       (i32.eq
        (i32.and
         (local.get $6)
         (i32.const 255)
        )
        (i32.const 42)
       )
       (block
        (i32.store
         (local.get $12)
         (local.tee $5
          (block $__rjto$1 (result i32)
           (block $__rjti$1
            (br_if $__rjti$1
             (i32.eqz
              (call $_isdigit
               (i32.load8_s offset=1
                (local.get $1)
               )
              )
             )
            )
            (br_if $__rjti$1
             (i32.ne
              (i32.load8_s offset=2
               (local.tee $7
                (i32.load
                 (local.get $12)
                )
               )
              )
              (i32.const 36)
             )
            )
            (i32.store
             (i32.add
              (i32.shl
               (i32.add
                (i32.load8_s
                 (local.tee $1
                  (i32.add
                   (local.get $7)
                   (i32.const 1)
                  )
                 )
                )
                (i32.const -48)
               )
               (i32.const 2)
              )
              (local.get $4)
             )
             (i32.const 10)
            )
            (local.set $1
             (i32.wrap_i64
              (i64.load
               (i32.add
                (i32.shl
                 (i32.add
                  (i32.load8_s
                   (local.get $1)
                  )
                  (i32.const -48)
                 )
                 (i32.const 3)
                )
                (local.get $3)
               )
              )
             )
            )
            (local.set $6
             (i32.const 1)
            )
            (br $__rjto$1
             (i32.add
              (local.get $7)
              (i32.const 3)
             )
            )
           )
           (if
            (local.get $5)
            (block
             (local.set $8
              (i32.const -1)
             )
             (br $label$break$L1)
            )
           )
           (if
            (local.get $20)
            (block
             (local.set $1
              (i32.load
               (local.tee $5
                (i32.and
                 (i32.add
                  (i32.load
                   (local.get $2)
                  )
                  (i32.const 3)
                 )
                 (i32.const -4)
                )
               )
              )
             )
             (i32.store
              (local.get $2)
              (i32.add
               (local.get $5)
               (i32.const 4)
              )
             )
            )
            (local.set $1
             (i32.const 0)
            )
           )
           (local.set $6
            (i32.const 0)
           )
           (i32.add
            (i32.load
             (local.get $12)
            )
            (i32.const 1)
           )
          )
         )
        )
        (local.set $15
         (select
          (i32.sub
           (i32.const 0)
           (local.get $1)
          )
          (local.get $1)
          (local.tee $1
           (i32.lt_s
            (local.get $1)
            (i32.const 0)
           )
          )
         )
        )
        (local.set $16
         (select
          (i32.or
           (local.get $9)
           (i32.const 8192)
          )
          (local.get $9)
          (local.get $1)
         )
        )
        (local.set $9
         (local.get $6)
        )
       )
       (block
        (if
         (i32.lt_s
          (local.tee $15
           (call $_getint_656
            (local.get $12)
           )
          )
          (i32.const 0)
         )
         (block
          (local.set $8
           (i32.const -1)
          )
          (br $label$break$L1)
         )
        )
        (local.set $16
         (local.get $9)
        )
        (local.set $9
         (local.get $5)
        )
        (local.set $5
         (i32.load
          (local.get $12)
         )
        )
       )
      )
      (if
       (i32.eq
        (i32.load8_s
         (local.get $5)
        )
        (i32.const 46)
       )
       (block $do-once6
        (if
         (i32.ne
          (i32.load8_s
           (local.tee $1
            (i32.add
             (local.get $5)
             (i32.const 1)
            )
           )
          )
          (i32.const 42)
         )
         (block
          (i32.store
           (local.get $12)
           (local.get $1)
          )
          (local.set $1
           (call $_getint_656
            (local.get $12)
           )
          )
          (local.set $5
           (i32.load
            (local.get $12)
           )
          )
          (br $do-once6)
         )
        )
        (if
         (call $_isdigit
          (i32.load8_s offset=2
           (local.get $5)
          )
         )
         (if
          (i32.eq
           (i32.load8_s offset=3
            (local.tee $5
             (i32.load
              (local.get $12)
             )
            )
           )
           (i32.const 36)
          )
          (block
           (i32.store
            (i32.add
             (i32.shl
              (i32.add
               (i32.load8_s
                (local.tee $1
                 (i32.add
                  (local.get $5)
                  (i32.const 2)
                 )
                )
               )
               (i32.const -48)
              )
              (i32.const 2)
             )
             (local.get $4)
            )
            (i32.const 10)
           )
           (local.set $1
            (i32.wrap_i64
             (i64.load
              (i32.add
               (i32.shl
                (i32.add
                 (i32.load8_s
                  (local.get $1)
                 )
                 (i32.const -48)
                )
                (i32.const 3)
               )
               (local.get $3)
              )
             )
            )
           )
           (i32.store
            (local.get $12)
            (local.tee $5
             (i32.add
              (local.get $5)
              (i32.const 4)
             )
            )
           )
           (br $do-once6)
          )
         )
        )
        (if
         (local.get $9)
         (block
          (local.set $8
           (i32.const -1)
          )
          (br $label$break$L1)
         )
        )
        (if
         (local.get $20)
         (block
          (local.set $1
           (i32.load
            (local.tee $5
             (i32.and
              (i32.add
               (i32.load
                (local.get $2)
               )
               (i32.const 3)
              )
              (i32.const -4)
             )
            )
           )
          )
          (i32.store
           (local.get $2)
           (i32.add
            (local.get $5)
            (i32.const 4)
           )
          )
         )
         (local.set $1
          (i32.const 0)
         )
        )
        (i32.store
         (local.get $12)
         (local.tee $5
          (i32.add
           (i32.load
            (local.get $12)
           )
           (i32.const 2)
          )
         )
        )
       )
       (local.set $1
        (i32.const -1)
       )
      )
      (local.set $13
       (i32.const 0)
      )
      (loop $while-in9
       (if
        (i32.gt_u
         (i32.add
          (i32.load8_s
           (local.get $5)
          )
          (i32.const -65)
         )
         (i32.const 57)
        )
        (block
         (local.set $8
          (i32.const -1)
         )
         (br $label$break$L1)
        )
       )
       (i32.store
        (local.get $12)
        (local.tee $6
         (i32.add
          (local.get $5)
          (i32.const 1)
         )
        )
       )
       (if
        (i32.lt_u
         (i32.add
          (local.tee $5
           (i32.and
            (local.tee $7
             (i32.load8_s
              (i32.add
               (i32.add
                (i32.load8_s
                 (local.get $5)
                )
                (i32.mul
                 (local.get $13)
                 (i32.const 58)
                )
               )
               (i32.const 1055)
              )
             )
            )
            (i32.const 255)
           )
          )
          (i32.const -1)
         )
         (i32.const 8)
        )
        (block
         (local.set $13
          (local.get $5)
         )
         (local.set $5
          (local.get $6)
         )
         (br $while-in9)
        )
       )
      )
      (if
       (i32.eqz
        (local.get $7)
       )
       (block
        (local.set $8
         (i32.const -1)
        )
        (br $label$break$L1)
       )
      )
      (local.set $19
       (i32.gt_s
        (local.get $14)
        (i32.const -1)
       )
      )
      (block $label$break$L77
       (block $__rjti$9
        (if
         (i32.eq
          (local.get $7)
          (i32.const 19)
         )
         (if
          (local.get $19)
          (block
           (local.set $8
            (i32.const -1)
           )
           (br $label$break$L1)
          )
         )
         (block $__rjti$8
          (if
           (local.get $19)
           (block
            (i32.store
             (i32.add
              (i32.shl
               (local.get $14)
               (i32.const 2)
              )
              (local.get $4)
             )
             (local.get $5)
            )
            (i64.store
             (local.get $11)
             (i64.load
              (i32.add
               (i32.shl
                (local.get $14)
                (i32.const 3)
               )
               (local.get $3)
              )
             )
            )
            (br $__rjti$8)
           )
          )
          (if
           (i32.eqz
            (local.get $20)
           )
           (block
            (local.set $8
             (i32.const 0)
            )
            (br $label$break$L1)
           )
          )
          (call $_pop_arg_658
           (local.get $11)
           (local.get $5)
           (local.get $2)
          )
          (local.set $6
           (i32.load
            (local.get $12)
           )
          )
          (br $__rjti$9)
         )
        )
        (br_if $__rjti$9
         (local.get $20)
        )
        (local.set $1
         (i32.const 0)
        )
        (br $label$break$L77)
       )
       (local.set $5
        (select
         (local.tee $7
          (i32.and
           (local.get $16)
           (i32.const -65537)
          )
         )
         (local.get $16)
         (i32.and
          (local.get $16)
          (i32.const 8192)
         )
        )
       )
       (block $__rjto$7
        (block $__rjti$7
         (block $__rjti$6
          (block $__rjti$5
           (block $__rjti$4
            (block $__rjti$3
             (block $switch-default44
              (block $switch-case43
               (block $switch-case35
                (block $switch-case34
                 (block $switch-case33
                  (block $switch-case32
                   (block $switch-case31
                    (block $switch-case30
                     (block $switch-case28
                      (block $switch-case25
                       (block $switch-case24
                        (br_table $switch-case43 $switch-default44 $switch-case34 $switch-default44 $switch-case43 $switch-case43 $switch-case43 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-case35 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $__rjti$3 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-case43 $switch-default44 $switch-case32 $switch-case30 $switch-case43 $switch-case43 $switch-case43 $switch-default44 $switch-case30 $switch-default44 $switch-default44 $switch-default44 $switch-default44 $switch-case24 $switch-case28 $switch-case25 $switch-default44 $switch-default44 $switch-case33 $switch-default44 $switch-case31 $switch-default44 $switch-default44 $__rjti$3 $switch-default44
                         (i32.sub
                          (local.tee $6
                           (select
                            (i32.and
                             (local.tee $6
                              (i32.load8_s
                               (i32.add
                                (local.get $6)
                                (i32.const -1)
                               )
                              )
                             )
                             (i32.const -33)
                            )
                            (local.get $6)
                            (i32.and
                             (i32.eq
                              (i32.and
                               (local.get $6)
                               (i32.const 15)
                              )
                              (i32.const 3)
                             )
                             (i32.ne
                              (local.get $13)
                              (i32.const 0)
                             )
                            )
                           )
                          )
                          (i32.const 65)
                         )
                        )
                       )
                       (block $switch-default23
                        (block $switch-case22
                         (block $switch-case21
                          (block $switch-case20
                           (block $switch-case19
                            (block $switch-case18
                             (block $switch-case17
                              (block $switch-case16
                               (br_table $switch-case16 $switch-case17 $switch-case18 $switch-case19 $switch-case20 $switch-default23 $switch-case21 $switch-case22 $switch-default23
                                (i32.shr_s
                                 (i32.shl
                                  (i32.and
                                   (local.get $13)
                                   (i32.const 255)
                                  )
                                  (i32.const 24)
                                 )
                                 (i32.const 24)
                                )
                               )
                              )
                              (i32.store
                               (i32.load
                                (local.get $11)
                               )
                               (local.get $8)
                              )
                              (local.set $1
                               (i32.const 0)
                              )
                              (br $label$break$L77)
                             )
                             (i32.store
                              (i32.load
                               (local.get $11)
                              )
                              (local.get $8)
                             )
                             (local.set $1
                              (i32.const 0)
                             )
                             (br $label$break$L77)
                            )
                            (i64.store
                             (i32.load
                              (local.get $11)
                             )
                             (i64.extend_i32_s
                              (local.get $8)
                             )
                            )
                            (local.set $1
                             (i32.const 0)
                            )
                            (br $label$break$L77)
                           )
                           (i32.store16
                            (i32.load
                             (local.get $11)
                            )
                            (local.get $8)
                           )
                           (local.set $1
                            (i32.const 0)
                           )
                           (br $label$break$L77)
                          )
                          (i32.store8
                           (i32.load
                            (local.get $11)
                           )
                           (local.get $8)
                          )
                          (local.set $1
                           (i32.const 0)
                          )
                          (br $label$break$L77)
                         )
                         (i32.store
                          (i32.load
                           (local.get $11)
                          )
                          (local.get $8)
                         )
                         (local.set $1
                          (i32.const 0)
                         )
                         (br $label$break$L77)
                        )
                        (i64.store
                         (i32.load
                          (local.get $11)
                         )
                         (i64.extend_i32_s
                          (local.get $8)
                         )
                        )
                        (local.set $1
                         (i32.const 0)
                        )
                        (br $label$break$L77)
                       )
                       (local.set $1
                        (i32.const 0)
                       )
                       (br $label$break$L77)
                      )
                      (local.set $6
                       (i32.const 120)
                      )
                      (local.set $1
                       (select
                        (local.get $1)
                        (i32.const 8)
                        (i32.gt_u
                         (local.get $1)
                         (i32.const 8)
                        )
                       )
                      )
                      (local.set $5
                       (i32.or
                        (local.get $5)
                        (i32.const 8)
                       )
                      )
                      (br $__rjti$3)
                     )
                     (local.set $6
                      (i32.sub
                       (local.get $21)
                       (local.tee $13
                        (call $_fmt_o
                         (local.tee $17
                          (i64.load
                           (local.get $11)
                          )
                         )
                         (local.get $22)
                        )
                       )
                      )
                     )
                     (local.set $10
                      (i32.const 0)
                     )
                     (local.set $7
                      (i32.const 2826)
                     )
                     (local.set $1
                      (select
                       (local.get $1)
                       (i32.add
                        (local.get $6)
                        (i32.const 1)
                       )
                       (i32.or
                        (i32.eqz
                         (i32.and
                          (local.get $5)
                          (i32.const 8)
                         )
                        )
                        (i32.gt_s
                         (local.get $1)
                         (local.get $6)
                        )
                       )
                      )
                     )
                     (br $__rjti$6)
                    )
                    (if
                     (i64.lt_s
                      (local.tee $17
                       (i64.load
                        (local.get $11)
                       )
                      )
                      (i64.const 0)
                     )
                     (block
                      (i64.store
                       (local.get $11)
                       (local.tee $17
                        (i64.sub
                         (i64.const 0)
                         (local.get $17)
                        )
                       )
                      )
                      (local.set $10
                       (i32.const 1)
                      )
                      (local.set $7
                       (i32.const 2826)
                      )
                     )
                     (block
                      (local.set $10
                       (i32.ne
                        (i32.and
                         (local.get $5)
                         (i32.const 2049)
                        )
                        (i32.const 0)
                       )
                      )
                      (local.set $7
                       (select
                        (i32.const 2827)
                        (select
                         (i32.const 2828)
                         (i32.const 2826)
                         (i32.and
                          (local.get $5)
                          (i32.const 1)
                         )
                        )
                        (i32.and
                         (local.get $5)
                         (i32.const 2048)
                        )
                       )
                      )
                     )
                    )
                    (br $__rjti$4)
                   )
                   (local.set $10
                    (i32.const 0)
                   )
                   (local.set $7
                    (i32.const 2826)
                   )
                   (local.set $17
                    (i64.load
                     (local.get $11)
                    )
                   )
                   (br $__rjti$4)
                  )
                  (i64.store8
                   (local.get $24)
                   (i64.load
                    (local.get $11)
                   )
                  )
                  (local.set $6
                   (local.get $24)
                  )
                  (local.set $10
                   (i32.const 0)
                  )
                  (local.set $16
                   (i32.const 2826)
                  )
                  (local.set $13
                   (i32.const 1)
                  )
                  (local.set $5
                   (local.get $7)
                  )
                  (local.set $1
                   (local.get $21)
                  )
                  (br $__rjto$7)
                 )
                 (local.set $19
                  (i32.eqz
                   (local.tee $14
                    (call $_memchr
                     (local.tee $6
                      (select
                       (local.tee $5
                        (i32.load
                         (local.get $11)
                        )
                       )
                       (i32.const 2836)
                       (local.get $5)
                      )
                     )
                     (local.get $1)
                    )
                   )
                  )
                 )
                 (local.set $10
                  (i32.const 0)
                 )
                 (local.set $16
                  (i32.const 2826)
                 )
                 (local.set $13
                  (select
                   (local.get $1)
                   (i32.sub
                    (local.get $14)
                    (local.get $6)
                   )
                   (local.get $19)
                  )
                 )
                 (local.set $5
                  (local.get $7)
                 )
                 (local.set $1
                  (select
                   (i32.add
                    (local.get $1)
                    (local.get $6)
                   )
                   (local.get $14)
                   (local.get $19)
                  )
                 )
                 (br $__rjto$7)
                )
                (i64.store32
                 (local.get $25)
                 (i64.load
                  (local.get $11)
                 )
                )
                (i32.store
                 (local.get $26)
                 (i32.const 0)
                )
                (i32.store
                 (local.get $11)
                 (local.get $25)
                )
                (local.set $10
                 (i32.const -1)
                )
                (br $__rjti$5)
               )
               (if
                (local.get $1)
                (block
                 (local.set $10
                  (local.get $1)
                 )
                 (br $__rjti$5)
                )
                (block
                 (call $_pad_661
                  (local.get $0)
                  (i32.const 32)
                  (local.get $15)
                  (i32.const 0)
                  (local.get $5)
                 )
                 (local.set $1
                  (i32.const 0)
                 )
                 (br $__rjti$7)
                )
               )
              )
              (local.set $1
               (call $_fmt_fp
                (local.get $0)
                (f64.load
                 (local.get $11)
                )
                (local.get $15)
                (local.get $1)
                (local.get $5)
                (local.get $6)
               )
              )
              (br $label$break$L77)
             )
             (local.set $6
              (local.get $10)
             )
             (local.set $10
              (i32.const 0)
             )
             (local.set $16
              (i32.const 2826)
             )
             (local.set $13
              (local.get $1)
             )
             (local.set $1
              (local.get $21)
             )
             (br $__rjto$7)
            )
            (local.set $13
             (call $_fmt_x
              (local.tee $17
               (i64.load
                (local.get $11)
               )
              )
              (local.get $22)
              (i32.and
               (local.get $6)
               (i32.const 32)
              )
             )
            )
            (local.set $10
             (select
              (i32.const 0)
              (i32.const 2)
              (local.tee $7
               (i32.or
                (i32.eqz
                 (i32.and
                  (local.get $5)
                  (i32.const 8)
                 )
                )
                (i64.eq
                 (local.get $17)
                 (i64.const 0)
                )
               )
              )
             )
            )
            (local.set $7
             (select
              (i32.const 2826)
              (i32.add
               (i32.shr_u
                (local.get $6)
                (i32.const 4)
               )
               (i32.const 2826)
              )
              (local.get $7)
             )
            )
            (br $__rjti$6)
           )
           (local.set $13
            (call $_fmt_u
             (local.get $17)
             (local.get $22)
            )
           )
           (br $__rjti$6)
          )
          (local.set $6
           (i32.load
            (local.get $11)
           )
          )
          (local.set $1
           (i32.const 0)
          )
          (block $__rjto$2
           (block $__rjti$2
            (loop $while-in47
             (if
              (local.tee $7
               (i32.load
                (local.get $6)
               )
              )
              (block
               (br_if $__rjti$2
                (i32.or
                 (local.tee $13
                  (i32.lt_s
                   (local.tee $7
                    (call $_wctomb
                     (local.get $23)
                     (local.get $7)
                    )
                   )
                   (i32.const 0)
                  )
                 )
                 (i32.gt_u
                  (local.get $7)
                  (i32.sub
                   (local.get $10)
                   (local.get $1)
                  )
                 )
                )
               )
               (local.set $6
                (i32.add
                 (local.get $6)
                 (i32.const 4)
                )
               )
               (br_if $while-in47
                (i32.gt_u
                 (local.get $10)
                 (local.tee $1
                  (i32.add
                   (local.get $1)
                   (local.get $7)
                  )
                 )
                )
               )
              )
             )
            )
            (br $__rjto$2)
           )
           (if
            (local.get $13)
            (block
             (local.set $8
              (i32.const -1)
             )
             (br $label$break$L1)
            )
           )
          )
          (call $_pad_661
           (local.get $0)
           (i32.const 32)
           (local.get $15)
           (local.get $1)
           (local.get $5)
          )
          (if
           (local.get $1)
           (block
            (local.set $6
             (i32.load
              (local.get $11)
             )
            )
            (local.set $10
             (i32.const 0)
            )
            (loop $while-in49
             (br_if $__rjti$7
              (i32.eqz
               (local.tee $7
                (i32.load
                 (local.get $6)
                )
               )
              )
             )
             (br_if $__rjti$7
              (i32.gt_s
               (local.tee $10
                (i32.add
                 (local.get $10)
                 (local.tee $7
                  (call $_wctomb
                   (local.get $23)
                   (local.get $7)
                  )
                 )
                )
               )
               (local.get $1)
              )
             )
             (local.set $6
              (i32.add
               (local.get $6)
               (i32.const 4)
              )
             )
             (call $_out_655
              (local.get $0)
              (local.get $23)
              (local.get $7)
             )
             (br_if $while-in49
              (i32.lt_u
               (local.get $10)
               (local.get $1)
              )
             )
            )
            (br $__rjti$7)
           )
           (block
            (local.set $1
             (i32.const 0)
            )
            (br $__rjti$7)
           )
          )
         )
         (local.set $6
          (select
           (local.get $13)
           (local.get $22)
           (local.tee $19
            (i32.or
             (local.tee $14
              (i64.ne
               (local.get $17)
               (i64.const 0)
              )
             )
             (i32.ne
              (local.get $1)
              (i32.const 0)
             )
            )
           )
          )
         )
         (local.set $16
          (local.get $7)
         )
         (local.set $13
          (select
           (select
            (local.get $1)
            (local.tee $7
             (i32.add
              (i32.sub
               (local.get $21)
               (local.get $13)
              )
              (i32.and
               (i32.xor
                (local.get $14)
                (i32.const 1)
               )
               (i32.const 1)
              )
             )
            )
            (i32.gt_s
             (local.get $1)
             (local.get $7)
            )
           )
           (i32.const 0)
           (local.get $19)
          )
         )
         (local.set $5
          (select
           (i32.and
            (local.get $5)
            (i32.const -65537)
           )
           (local.get $5)
           (i32.gt_s
            (local.get $1)
            (i32.const -1)
           )
          )
         )
         (local.set $1
          (local.get $21)
         )
         (br $__rjto$7)
        )
        (call $_pad_661
         (local.get $0)
         (i32.const 32)
         (local.get $15)
         (local.get $1)
         (i32.xor
          (local.get $5)
          (i32.const 8192)
         )
        )
        (local.set $1
         (select
          (local.get $15)
          (local.get $1)
          (i32.gt_s
           (local.get $15)
           (local.get $1)
          )
         )
        )
        (br $label$break$L77)
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 32)
        (local.tee $1
         (select
          (local.tee $7
           (i32.add
            (local.get $10)
            (local.tee $13
             (select
              (local.tee $14
               (i32.sub
                (local.get $1)
                (local.get $6)
               )
              )
              (local.get $13)
              (i32.lt_s
               (local.get $13)
               (local.get $14)
              )
             )
            )
           )
          )
          (local.get $15)
          (i32.lt_s
           (local.get $15)
           (local.get $7)
          )
         )
        )
        (local.get $7)
        (local.get $5)
       )
       (call $_out_655
        (local.get $0)
        (local.get $16)
        (local.get $10)
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 48)
        (local.get $1)
        (local.get $7)
        (i32.xor
         (local.get $5)
         (i32.const 65536)
        )
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 48)
        (local.get $13)
        (local.get $14)
        (i32.const 0)
       )
       (call $_out_655
        (local.get $0)
        (local.get $6)
        (local.get $14)
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 32)
        (local.get $1)
        (local.get $7)
        (i32.xor
         (local.get $5)
         (i32.const 8192)
        )
       )
      )
      (local.set $5
       (local.get $9)
      )
      (br $label$continue$L1)
     )
    )
    (br $label$break$L123)
   )
   (if
    (i32.eqz
     (local.get $0)
    )
    (local.set $8
     (if (result i32)
      (local.get $5)
      (block (result i32)
       (local.set $0
        (i32.const 1)
       )
       (loop $while-in52
        (if
         (local.tee $1
          (i32.load
           (i32.add
            (i32.shl
             (local.get $0)
             (i32.const 2)
            )
            (local.get $4)
           )
          )
         )
         (block
          (call $_pop_arg_658
           (i32.add
            (i32.shl
             (local.get $0)
             (i32.const 3)
            )
            (local.get $3)
           )
           (local.get $1)
           (local.get $2)
          )
          (br_if $while-in52
           (i32.lt_u
            (local.tee $0
             (i32.add
              (local.get $0)
              (i32.const 1)
             )
            )
            (i32.const 10)
           )
          )
          (local.set $8
           (i32.const 1)
          )
          (br $label$break$L123)
         )
        )
       )
       (loop $while-in54 (result i32)
        (if
         (i32.load
          (i32.add
           (i32.shl
            (local.get $0)
            (i32.const 2)
           )
           (local.get $4)
          )
         )
         (block
          (local.set $8
           (i32.const -1)
          )
          (br $label$break$L123)
         )
        )
        (br_if $while-in54
         (i32.lt_u
          (local.tee $0
           (i32.add
            (local.get $0)
            (i32.const 1)
           )
          )
          (i32.const 10)
         )
        )
        (i32.const 1)
       )
      )
      (i32.const 0)
     )
    )
   )
  )
  (global.set $STACKTOP
   (local.get $18)
  )
  (local.get $8)
 )
 (func $_out_655 (; 70 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (if
   (i32.eqz
    (i32.and
     (i32.load
      (local.get $0)
     )
     (i32.const 32)
    )
   )
   (drop
    (call $___fwritex
     (local.get $1)
     (local.get $2)
     (local.get $0)
    )
   )
  )
 )
 (func $_getint_656 (; 71 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (if
   (call $_isdigit
    (i32.load8_s
     (i32.load
      (local.get $0)
     )
    )
   )
   (loop $while-in
    (local.set $1
     (i32.add
      (i32.load8_s
       (local.tee $2
        (i32.load
         (local.get $0)
        )
       )
      )
      (i32.add
       (i32.mul
        (local.get $1)
        (i32.const 10)
       )
       (i32.const -48)
      )
     )
    )
    (i32.store
     (local.get $0)
     (local.tee $2
      (i32.add
       (local.get $2)
       (i32.const 1)
      )
     )
    )
    (br_if $while-in
     (call $_isdigit
      (i32.load8_s
       (local.get $2)
      )
     )
    )
   )
  )
  (local.get $1)
 )
 (func $_pop_arg_658 (; 72 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 f64)
  (local $5 i64)
  (if
   (i32.le_u
    (local.get $1)
    (i32.const 20)
   )
   (block $label$break$L1
    (block $switch-case9
     (block $switch-case8
      (block $switch-case7
       (block $switch-case6
        (block $switch-case5
         (block $switch-case4
          (block $switch-case3
           (block $switch-case2
            (block $switch-case1
             (block $switch-case
              (br_table $switch-case $switch-case1 $switch-case2 $switch-case3 $switch-case4 $switch-case5 $switch-case6 $switch-case7 $switch-case8 $switch-case9 $label$break$L1
               (i32.sub
                (local.get $1)
                (i32.const 9)
               )
              )
             )
             (local.set $3
              (i32.load
               (local.tee $1
                (i32.and
                 (i32.add
                  (i32.load
                   (local.get $2)
                  )
                  (i32.const 3)
                 )
                 (i32.const -4)
                )
               )
              )
             )
             (i32.store
              (local.get $2)
              (i32.add
               (local.get $1)
               (i32.const 4)
              )
             )
             (i32.store
              (local.get $0)
              (local.get $3)
             )
             (br $label$break$L1)
            )
            (local.set $3
             (i32.load
              (local.tee $1
               (i32.and
                (i32.add
                 (i32.load
                  (local.get $2)
                 )
                 (i32.const 3)
                )
                (i32.const -4)
               )
              )
             )
            )
            (i32.store
             (local.get $2)
             (i32.add
              (local.get $1)
              (i32.const 4)
             )
            )
            (i64.store
             (local.get $0)
             (i64.extend_i32_s
              (local.get $3)
             )
            )
            (br $label$break$L1)
           )
           (local.set $3
            (i32.load
             (local.tee $1
              (i32.and
               (i32.add
                (i32.load
                 (local.get $2)
                )
                (i32.const 3)
               )
               (i32.const -4)
              )
             )
            )
           )
           (i32.store
            (local.get $2)
            (i32.add
             (local.get $1)
             (i32.const 4)
            )
           )
           (i64.store
            (local.get $0)
            (i64.extend_i32_u
             (local.get $3)
            )
           )
           (br $label$break$L1)
          )
          (local.set $5
           (i64.load
            (local.tee $1
             (i32.and
              (i32.add
               (i32.load
                (local.get $2)
               )
               (i32.const 7)
              )
              (i32.const -8)
             )
            )
           )
          )
          (i32.store
           (local.get $2)
           (i32.add
            (local.get $1)
            (i32.const 8)
           )
          )
          (i64.store
           (local.get $0)
           (local.get $5)
          )
          (br $label$break$L1)
         )
         (local.set $3
          (i32.load
           (local.tee $1
            (i32.and
             (i32.add
              (i32.load
               (local.get $2)
              )
              (i32.const 3)
             )
             (i32.const -4)
            )
           )
          )
         )
         (i32.store
          (local.get $2)
          (i32.add
           (local.get $1)
           (i32.const 4)
          )
         )
         (i64.store
          (local.get $0)
          (i64.extend_i32_s
           (i32.shr_s
            (i32.shl
             (i32.and
              (local.get $3)
              (i32.const 65535)
             )
             (i32.const 16)
            )
            (i32.const 16)
           )
          )
         )
         (br $label$break$L1)
        )
        (local.set $3
         (i32.load
          (local.tee $1
           (i32.and
            (i32.add
             (i32.load
              (local.get $2)
             )
             (i32.const 3)
            )
            (i32.const -4)
           )
          )
         )
        )
        (i32.store
         (local.get $2)
         (i32.add
          (local.get $1)
          (i32.const 4)
         )
        )
        (i64.store
         (local.get $0)
         (i64.extend_i32_u
          (i32.and
           (local.get $3)
           (i32.const 65535)
          )
         )
        )
        (br $label$break$L1)
       )
       (local.set $3
        (i32.load
         (local.tee $1
          (i32.and
           (i32.add
            (i32.load
             (local.get $2)
            )
            (i32.const 3)
           )
           (i32.const -4)
          )
         )
        )
       )
       (i32.store
        (local.get $2)
        (i32.add
         (local.get $1)
         (i32.const 4)
        )
       )
       (i64.store
        (local.get $0)
        (i64.extend_i32_s
         (i32.shr_s
          (i32.shl
           (i32.and
            (local.get $3)
            (i32.const 255)
           )
           (i32.const 24)
          )
          (i32.const 24)
         )
        )
       )
       (br $label$break$L1)
      )
      (local.set $3
       (i32.load
        (local.tee $1
         (i32.and
          (i32.add
           (i32.load
            (local.get $2)
           )
           (i32.const 3)
          )
          (i32.const -4)
         )
        )
       )
      )
      (i32.store
       (local.get $2)
       (i32.add
        (local.get $1)
        (i32.const 4)
       )
      )
      (i64.store
       (local.get $0)
       (i64.extend_i32_u
        (i32.and
         (local.get $3)
         (i32.const 255)
        )
       )
      )
      (br $label$break$L1)
     )
     (local.set $4
      (f64.load
       (local.tee $1
        (i32.and
         (i32.add
          (i32.load
           (local.get $2)
          )
          (i32.const 7)
         )
         (i32.const -8)
        )
       )
      )
     )
     (i32.store
      (local.get $2)
      (i32.add
       (local.get $1)
       (i32.const 8)
      )
     )
     (f64.store
      (local.get $0)
      (local.get $4)
     )
     (br $label$break$L1)
    )
    (local.set $4
     (f64.load
      (local.tee $1
       (i32.and
        (i32.add
         (i32.load
          (local.get $2)
         )
         (i32.const 7)
        )
        (i32.const -8)
       )
      )
     )
    )
    (i32.store
     (local.get $2)
     (i32.add
      (local.get $1)
      (i32.const 8)
     )
    )
    (f64.store
     (local.get $0)
     (local.get $4)
    )
   )
  )
 )
 (func $_fmt_x (; 73 ;) (; has Stack IR ;) (param $0 i64) (param $1 i32) (param $2 i32) (result i32)
  (if
   (i64.ne
    (local.get $0)
    (i64.const 0)
   )
   (loop $while-in
    (i32.store8
     (local.tee $1
      (i32.add
       (local.get $1)
       (i32.const -1)
      )
     )
     (i32.or
      (local.get $2)
      (i32.load8_u
       (i32.add
        (i32.and
         (i32.wrap_i64
          (local.get $0)
         )
         (i32.const 15)
        )
        (i32.const 1584)
       )
      )
     )
    )
    (br_if $while-in
     (i64.ne
      (local.tee $0
       (i64.shr_u
        (local.get $0)
        (i64.const 4)
       )
      )
      (i64.const 0)
     )
    )
   )
  )
  (local.get $1)
 )
 (func $_fmt_o (; 74 ;) (; has Stack IR ;) (param $0 i64) (param $1 i32) (result i32)
  (if
   (i64.ne
    (local.get $0)
    (i64.const 0)
   )
   (loop $while-in
    (i32.store8
     (local.tee $1
      (i32.add
       (local.get $1)
       (i32.const -1)
      )
     )
     (i32.or
      (i32.and
       (i32.wrap_i64
        (local.get $0)
       )
       (i32.const 7)
      )
      (i32.const 48)
     )
    )
    (br_if $while-in
     (i64.ne
      (local.tee $0
       (i64.shr_u
        (local.get $0)
        (i64.const 3)
       )
      )
      (i64.const 0)
     )
    )
   )
  )
  (local.get $1)
 )
 (func $_fmt_u (; 75 ;) (; has Stack IR ;) (param $0 i64) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local.set $2
   (i32.wrap_i64
    (local.get $0)
   )
  )
  (if
   (i64.gt_u
    (local.get $0)
    (i64.const 4294967295)
   )
   (block
    (loop $while-in
     (i32.store8
      (local.tee $1
       (i32.add
        (local.get $1)
        (i32.const -1)
       )
      )
      (i32.or
       (i32.and
        (i32.wrap_i64
         (i64.sub
          (local.get $0)
          (i64.mul
           (local.tee $3
            (i64.div_u
             (local.get $0)
             (i64.const 10)
            )
           )
           (i64.const 10)
          )
         )
        )
        (i32.const 255)
       )
       (i32.const 48)
      )
     )
     (if
      (i64.gt_u
       (local.get $0)
       (i64.const 42949672959)
      )
      (block
       (local.set $0
        (local.get $3)
       )
       (br $while-in)
      )
     )
    )
    (local.set $2
     (i32.wrap_i64
      (local.get $3)
     )
    )
   )
  )
  (if
   (local.get $2)
   (loop $while-in1
    (i32.store8
     (local.tee $1
      (i32.add
       (local.get $1)
       (i32.const -1)
      )
     )
     (i32.or
      (i32.sub
       (local.get $2)
       (i32.mul
        (local.tee $4
         (i32.div_u
          (local.get $2)
          (i32.const 10)
         )
        )
        (i32.const 10)
       )
      )
      (i32.const 48)
     )
    )
    (if
     (i32.ge_u
      (local.get $2)
      (i32.const 10)
     )
     (block
      (local.set $2
       (local.get $4)
      )
      (br $while-in1)
     )
    )
   )
  )
  (local.get $1)
 )
 (func $_pad_661 (; 76 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local.set $5
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 256)
   )
  )
  (if
   (i32.and
    (i32.eqz
     (i32.and
      (local.get $4)
      (i32.const 73728)
     )
    )
    (i32.gt_s
     (local.get $2)
     (local.get $3)
    )
   )
   (block
    (drop
     (call $_memset
      (local.get $5)
      (i32.shr_s
       (i32.shl
        (local.get $1)
        (i32.const 24)
       )
       (i32.const 24)
      )
      (select
       (local.tee $1
        (i32.sub
         (local.get $2)
         (local.get $3)
        )
       )
       (i32.const 256)
       (i32.lt_u
        (local.get $1)
        (i32.const 256)
       )
      )
     )
    )
    (if
     (i32.gt_u
      (local.get $1)
      (i32.const 255)
     )
     (block
      (local.set $2
       (i32.sub
        (local.get $2)
        (local.get $3)
       )
      )
      (loop $while-in
       (call $_out_655
        (local.get $0)
        (local.get $5)
        (i32.const 256)
       )
       (br_if $while-in
        (i32.gt_u
         (local.tee $1
          (i32.add
           (local.get $1)
           (i32.const -256)
          )
         )
         (i32.const 255)
        )
       )
      )
      (local.set $1
       (i32.and
        (local.get $2)
        (i32.const 255)
       )
      )
     )
    )
    (call $_out_655
     (local.get $0)
     (local.get $5)
     (local.get $1)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $5)
  )
 )
 (func $_wctomb (; 77 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (if (result i32)
   (local.get $0)
   (call $_wcrtomb
    (local.get $0)
    (local.get $1)
   )
   (i32.const 0)
  )
 )
 (func $_fmt_fp (; 78 ;) (; has Stack IR ;) (param $0 i32) (param $1 f64) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (result i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 f64)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i64)
  (local $22 i32)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i64)
  (local $27 i64)
  (local.set $22
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 560)
   )
  )
  (local.set $7
   (i32.add
    (local.get $22)
    (i32.const 32)
   )
  )
  (local.set $18
   (local.tee $13
    (local.get $22)
   )
  )
  (i32.store
   (local.tee $11
    (i32.add
     (local.get $13)
     (i32.const 536)
    )
   )
   (i32.const 0)
  )
  (local.set $15
   (i32.add
    (local.tee $9
     (i32.add
      (local.get $13)
      (i32.const 540)
     )
    )
    (i32.const 12)
   )
  )
  (local.set $20
   (if (result i32)
    (i64.lt_s
     (local.tee $21
      (call $___DOUBLE_BITS_662
       (local.get $1)
      )
     )
     (i64.const 0)
    )
    (block (result i32)
     (local.set $21
      (call $___DOUBLE_BITS_662
       (local.tee $1
        (f64.neg
         (local.get $1)
        )
       )
      )
     )
     (local.set $19
      (i32.const 2843)
     )
     (i32.const 1)
    )
    (block (result i32)
     (local.set $19
      (select
       (i32.const 2846)
       (select
        (i32.const 2849)
        (i32.const 2844)
        (i32.and
         (local.get $4)
         (i32.const 1)
        )
       )
       (i32.and
        (local.get $4)
        (i32.const 2048)
       )
      )
     )
     (i32.ne
      (i32.and
       (local.get $4)
       (i32.const 2049)
      )
      (i32.const 0)
     )
    )
   )
  )
  (local.set $0
   (if (result i32)
    (i64.eq
     (i64.and
      (local.get $21)
      (i64.const 9218868437227405312)
     )
     (i64.const 9218868437227405312)
    )
    (block (result i32)
     (local.set $5
      (select
       (select
        (i32.const 2870)
        (i32.const 2874)
        (local.tee $3
         (i32.ne
          (i32.and
           (local.get $5)
           (i32.const 32)
          )
          (i32.const 0)
         )
        )
       )
       (select
        (i32.const 2862)
        (i32.const 2866)
        (local.get $3)
       )
       (f64.ne
        (local.get $1)
        (local.get $1)
       )
      )
     )
     (call $_pad_661
      (local.get $0)
      (i32.const 32)
      (local.get $2)
      (local.tee $3
       (i32.add
        (local.get $20)
        (i32.const 3)
       )
      )
      (i32.and
       (local.get $4)
       (i32.const -65537)
      )
     )
     (call $_out_655
      (local.get $0)
      (local.get $19)
      (local.get $20)
     )
     (call $_out_655
      (local.get $0)
      (local.get $5)
      (i32.const 3)
     )
     (call $_pad_661
      (local.get $0)
      (i32.const 32)
      (local.get $2)
      (local.get $3)
      (i32.xor
       (local.get $4)
       (i32.const 8192)
      )
     )
     (local.get $3)
    )
    (block $do-once (result i32)
     (if
      (local.tee $6
       (f64.ne
        (local.tee $1
         (f64.mul
          (call $_frexpl
           (local.get $1)
           (local.get $11)
          )
          (f64.const 2)
         )
        )
        (f64.const 0)
       )
      )
      (i32.store
       (local.get $11)
       (i32.add
        (i32.load
         (local.get $11)
        )
        (i32.const -1)
       )
      )
     )
     (if
      (i32.eq
       (local.tee $14
        (i32.or
         (local.get $5)
         (i32.const 32)
        )
       )
       (i32.const 97)
      )
      (block
       (local.set $8
        (select
         (i32.add
          (local.get $19)
          (i32.const 9)
         )
         (local.get $19)
         (local.tee $12
          (i32.and
           (local.get $5)
           (i32.const 32)
          )
         )
        )
       )
       (if
        (i32.eqz
         (i32.or
          (i32.eqz
           (local.tee $7
            (i32.sub
             (i32.const 12)
             (local.get $3)
            )
           )
          )
          (i32.gt_u
           (local.get $3)
           (i32.const 11)
          )
         )
        )
        (block
         (local.set $16
          (f64.const 8)
         )
         (loop $while-in
          (local.set $16
           (f64.mul
            (local.get $16)
            (f64.const 16)
           )
          )
          (br_if $while-in
           (local.tee $7
            (i32.add
             (local.get $7)
             (i32.const -1)
            )
           )
          )
         )
         (local.set $1
          (if (result f64)
           (i32.eq
            (i32.load8_s
             (local.get $8)
            )
            (i32.const 45)
           )
           (f64.neg
            (f64.add
             (local.get $16)
             (f64.sub
              (f64.neg
               (local.get $1)
              )
              (local.get $16)
             )
            )
           )
           (f64.sub
            (f64.add
             (local.get $1)
             (local.get $16)
            )
            (local.get $16)
           )
          )
         )
        )
       )
       (local.set $10
        (i32.or
         (local.get $20)
         (i32.const 2)
        )
       )
       (if
        (i32.eq
         (local.get $15)
         (local.tee $7
          (call $_fmt_u
           (i64.extend_i32_s
            (select
             (i32.sub
              (i32.const 0)
              (local.tee $6
               (i32.load
                (local.get $11)
               )
              )
             )
             (local.get $6)
             (i32.lt_s
              (local.get $6)
              (i32.const 0)
             )
            )
           )
           (local.get $15)
          )
         )
        )
        (i32.store8
         (local.tee $7
          (i32.add
           (local.get $9)
           (i32.const 11)
          )
         )
         (i32.const 48)
        )
       )
       (i32.store8
        (i32.add
         (local.get $7)
         (i32.const -1)
        )
        (i32.add
         (i32.and
          (i32.shr_s
           (local.get $6)
           (i32.const 31)
          )
          (i32.const 2)
         )
         (i32.const 43)
        )
       )
       (i32.store8
        (local.tee $7
         (i32.add
          (local.get $7)
          (i32.const -2)
         )
        )
        (i32.add
         (local.get $5)
         (i32.const 15)
        )
       )
       (local.set $9
        (i32.lt_s
         (local.get $3)
         (i32.const 1)
        )
       )
       (local.set $11
        (i32.eqz
         (i32.and
          (local.get $4)
          (i32.const 8)
         )
        )
       )
       (local.set $5
        (local.get $13)
       )
       (loop $while-in3
        (i32.store8
         (local.get $5)
         (i32.or
          (local.get $12)
          (i32.load8_u
           (i32.add
            (local.tee $6
             (i32.trunc_f64_s
              (local.get $1)
             )
            )
            (i32.const 1584)
           )
          )
         )
        )
        (local.set $1
         (f64.mul
          (f64.sub
           (local.get $1)
           (f64.convert_i32_s
            (local.get $6)
           )
          )
          (f64.const 16)
         )
        )
        (local.set $5
         (if (result i32)
          (i32.eq
           (i32.sub
            (local.tee $6
             (i32.add
              (local.get $5)
              (i32.const 1)
             )
            )
            (local.get $18)
           )
           (i32.const 1)
          )
          (if (result i32)
           (i32.and
            (local.get $11)
            (i32.and
             (local.get $9)
             (f64.eq
              (local.get $1)
              (f64.const 0)
             )
            )
           )
           (local.get $6)
           (block (result i32)
            (i32.store8
             (local.get $6)
             (i32.const 46)
            )
            (i32.add
             (local.get $5)
             (i32.const 2)
            )
           )
          )
          (local.get $6)
         )
        )
        (br_if $while-in3
         (f64.ne
          (local.get $1)
          (f64.const 0)
         )
        )
       )
       (local.set $3
        (block $__rjto$0 (result i32)
         (block $__rjti$0
          (br_if $__rjti$0
           (i32.eqz
            (local.get $3)
           )
          )
          (br_if $__rjti$0
           (i32.ge_s
            (i32.add
             (local.get $5)
             (i32.sub
              (i32.const -2)
              (local.get $18)
             )
            )
            (local.get $3)
           )
          )
          (local.set $9
           (i32.sub
            (i32.add
             (local.get $15)
             (i32.add
              (local.get $3)
              (i32.const 2)
             )
            )
            (local.get $7)
           )
          )
          (br $__rjto$0
           (local.get $7)
          )
         )
         (local.set $9
          (i32.add
           (local.get $5)
           (i32.sub
            (i32.sub
             (local.get $15)
             (local.get $18)
            )
            (local.get $7)
           )
          )
         )
         (local.get $7)
        )
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 32)
        (local.get $2)
        (local.tee $6
         (i32.add
          (local.get $9)
          (local.get $10)
         )
        )
        (local.get $4)
       )
       (call $_out_655
        (local.get $0)
        (local.get $8)
        (local.get $10)
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 48)
        (local.get $2)
        (local.get $6)
        (i32.xor
         (local.get $4)
         (i32.const 65536)
        )
       )
       (call $_out_655
        (local.get $0)
        (local.get $13)
        (local.tee $5
         (i32.sub
          (local.get $5)
          (local.get $18)
         )
        )
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 48)
        (i32.sub
         (local.get $9)
         (i32.add
          (local.get $5)
          (local.tee $3
           (i32.sub
            (local.get $15)
            (local.get $3)
           )
          )
         )
        )
        (i32.const 0)
        (i32.const 0)
       )
       (call $_out_655
        (local.get $0)
        (local.get $7)
        (local.get $3)
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 32)
        (local.get $2)
        (local.get $6)
        (i32.xor
         (local.get $4)
         (i32.const 8192)
        )
       )
       (br $do-once
        (local.get $6)
       )
      )
     )
     (if
      (local.get $6)
      (block
       (i32.store
        (local.get $11)
        (local.tee $8
         (i32.add
          (i32.load
           (local.get $11)
          )
          (i32.const -28)
         )
        )
       )
       (local.set $1
        (f64.mul
         (local.get $1)
         (f64.const 268435456)
        )
       )
      )
      (local.set $8
       (i32.load
        (local.get $11)
       )
      )
     )
     (local.set $6
      (local.tee $9
       (select
        (local.get $7)
        (i32.add
         (local.get $7)
         (i32.const 288)
        )
        (i32.lt_s
         (local.get $8)
         (i32.const 0)
        )
       )
      )
     )
     (loop $while-in5
      (i32.store
       (local.get $6)
       (local.tee $7
        (i32.trunc_f64_u
         (local.get $1)
        )
       )
      )
      (local.set $6
       (i32.add
        (local.get $6)
        (i32.const 4)
       )
      )
      (br_if $while-in5
       (f64.ne
        (local.tee $1
         (f64.mul
          (f64.sub
           (local.get $1)
           (f64.convert_i32_u
            (local.get $7)
           )
          )
          (f64.const 1e9)
         )
        )
        (f64.const 0)
       )
      )
     )
     (if
      (i32.gt_s
       (local.get $8)
       (i32.const 0)
      )
      (block
       (local.set $7
        (local.get $9)
       )
       (loop $while-in7
        (local.set $12
         (select
          (local.get $8)
          (i32.const 29)
          (i32.lt_s
           (local.get $8)
           (i32.const 29)
          )
         )
        )
        (if
         (i32.ge_u
          (local.tee $8
           (i32.add
            (local.get $6)
            (i32.const -4)
           )
          )
          (local.get $7)
         )
         (block
          (local.set $26
           (i64.extend_i32_u
            (local.get $12)
           )
          )
          (local.set $10
           (i32.const 0)
          )
          (loop $while-in9
           (local.set $21
            (i64.div_u
             (local.tee $27
              (i64.add
               (i64.extend_i32_u
                (local.get $10)
               )
               (i64.shl
                (i64.extend_i32_u
                 (i32.load
                  (local.get $8)
                 )
                )
                (local.get $26)
               )
              )
             )
             (i64.const 1000000000)
            )
           )
           (i64.store32
            (local.get $8)
            (i64.sub
             (local.get $27)
             (i64.mul
              (local.get $21)
              (i64.const 1000000000)
             )
            )
           )
           (local.set $10
            (i32.wrap_i64
             (local.get $21)
            )
           )
           (br_if $while-in9
            (i32.ge_u
             (local.tee $8
              (i32.add
               (local.get $8)
               (i32.const -4)
              )
             )
             (local.get $7)
            )
           )
          )
          (if
           (local.get $10)
           (i32.store
            (local.tee $7
             (i32.add
              (local.get $7)
              (i32.const -4)
             )
            )
            (local.get $10)
           )
          )
         )
        )
        (if
         (i32.gt_u
          (local.get $6)
          (local.get $7)
         )
         (block $label$break$L57
          (local.set $6
           (loop $while-in12 (result i32)
            (br_if $label$break$L57
             (i32.load
              (local.tee $8
               (i32.add
                (local.get $6)
                (i32.const -4)
               )
              )
             )
            )
            (if (result i32)
             (i32.gt_u
              (local.get $8)
              (local.get $7)
             )
             (block
              (local.set $6
               (local.get $8)
              )
              (br $while-in12)
             )
             (local.get $8)
            )
           )
          )
         )
        )
        (i32.store
         (local.get $11)
         (local.tee $8
          (i32.sub
           (i32.load
            (local.get $11)
           )
           (local.get $12)
          )
         )
        )
        (br_if $while-in7
         (i32.gt_s
          (local.get $8)
          (i32.const 0)
         )
        )
       )
      )
      (local.set $7
       (local.get $9)
      )
     )
     (local.set $12
      (select
       (i32.const 6)
       (local.get $3)
       (i32.lt_s
        (local.get $3)
        (i32.const 0)
       )
      )
     )
     (if
      (i32.lt_s
       (local.get $8)
       (i32.const 0)
      )
      (block
       (local.set $17
        (i32.add
         (i32.div_s
          (i32.add
           (local.get $12)
           (i32.const 25)
          )
          (i32.const 9)
         )
         (i32.const 1)
        )
       )
       (local.set $23
        (i32.eq
         (local.get $14)
         (i32.const 102)
        )
       )
       (local.set $3
        (local.get $6)
       )
       (loop $while-in14
        (local.set $10
         (select
          (local.tee $6
           (i32.sub
            (i32.const 0)
            (local.get $8)
           )
          )
          (i32.const 9)
          (i32.lt_s
           (local.get $6)
           (i32.const 9)
          )
         )
        )
        (local.set $8
         (select
          (i32.add
           (local.tee $7
            (select
             (local.get $9)
             (local.tee $3
              (if (result i32)
               (i32.lt_u
                (local.get $7)
                (local.get $3)
               )
               (block (result i32)
                (local.set $24
                 (i32.add
                  (i32.shl
                   (i32.const 1)
                   (local.get $10)
                  )
                  (i32.const -1)
                 )
                )
                (local.set $25
                 (i32.shr_u
                  (i32.const 1000000000)
                  (local.get $10)
                 )
                )
                (local.set $8
                 (i32.const 0)
                )
                (local.set $6
                 (local.get $7)
                )
                (loop $while-in16
                 (i32.store
                  (local.get $6)
                  (i32.add
                   (local.get $8)
                   (i32.shr_u
                    (local.tee $8
                     (i32.load
                      (local.get $6)
                     )
                    )
                    (local.get $10)
                   )
                  )
                 )
                 (local.set $8
                  (i32.mul
                   (local.get $25)
                   (i32.and
                    (local.get $8)
                    (local.get $24)
                   )
                  )
                 )
                 (br_if $while-in16
                  (i32.lt_u
                   (local.tee $6
                    (i32.add
                     (local.get $6)
                     (i32.const 4)
                    )
                   )
                   (local.get $3)
                  )
                 )
                )
                (local.set $7
                 (select
                  (local.get $7)
                  (i32.add
                   (local.get $7)
                   (i32.const 4)
                  )
                  (i32.load
                   (local.get $7)
                  )
                 )
                )
                (if
                 (local.get $8)
                 (block
                  (i32.store
                   (local.get $3)
                   (local.get $8)
                  )
                  (local.set $6
                   (i32.add
                    (local.get $3)
                    (i32.const 4)
                   )
                  )
                 )
                 (local.set $6
                  (local.get $3)
                 )
                )
                (local.get $7)
               )
               (block (result i32)
                (local.set $6
                 (local.get $3)
                )
                (select
                 (local.get $7)
                 (i32.add
                  (local.get $7)
                  (i32.const 4)
                 )
                 (i32.load
                  (local.get $7)
                 )
                )
               )
              )
             )
             (local.get $23)
            )
           )
           (i32.shl
            (local.get $17)
            (i32.const 2)
           )
          )
          (local.get $6)
          (i32.gt_s
           (i32.shr_s
            (i32.sub
             (local.get $6)
             (local.get $7)
            )
            (i32.const 2)
           )
           (local.get $17)
          )
         )
        )
        (i32.store
         (local.get $11)
         (local.tee $6
          (i32.add
           (local.get $10)
           (i32.load
            (local.get $11)
           )
          )
         )
        )
        (if
         (i32.lt_s
          (local.get $6)
          (i32.const 0)
         )
         (block
          (local.set $7
           (local.get $3)
          )
          (local.set $3
           (local.get $8)
          )
          (local.set $8
           (local.get $6)
          )
          (br $while-in14)
         )
        )
       )
      )
      (block
       (local.set $3
        (local.get $7)
       )
       (local.set $8
        (local.get $6)
       )
      )
     )
     (local.set $11
      (local.get $9)
     )
     (if
      (i32.lt_u
       (local.get $3)
       (local.get $8)
      )
      (block
       (local.set $7
        (i32.mul
         (i32.shr_s
          (i32.sub
           (local.get $11)
           (local.get $3)
          )
          (i32.const 2)
         )
         (i32.const 9)
        )
       )
       (if
        (i32.ge_u
         (local.tee $9
          (i32.load
           (local.get $3)
          )
         )
         (i32.const 10)
        )
        (block
         (local.set $6
          (i32.const 10)
         )
         (loop $while-in18
          (local.set $7
           (i32.add
            (local.get $7)
            (i32.const 1)
           )
          )
          (br_if $while-in18
           (i32.ge_u
            (local.get $9)
            (local.tee $6
             (i32.mul
              (local.get $6)
              (i32.const 10)
             )
            )
           )
          )
         )
        )
       )
      )
      (local.set $7
       (i32.const 0)
      )
     )
     (local.set $7
      (if (result i32)
       (i32.lt_s
        (local.tee $6
         (i32.add
          (i32.sub
           (local.get $12)
           (select
            (i32.const 0)
            (local.get $7)
            (i32.eq
             (local.get $14)
             (i32.const 102)
            )
           )
          )
          (i32.shr_s
           (i32.shl
            (i32.and
             (local.tee $23
              (i32.eq
               (local.get $14)
               (i32.const 103)
              )
             )
             (local.tee $24
              (i32.ne
               (local.get $12)
               (i32.const 0)
              )
             )
            )
            (i32.const 31)
           )
           (i32.const 31)
          )
         )
        )
        (i32.add
         (i32.mul
          (i32.shr_s
           (i32.sub
            (local.get $8)
            (local.get $11)
           )
           (i32.const 2)
          )
          (i32.const 9)
         )
         (i32.const -9)
        )
       )
       (block (result i32)
        (local.set $14
         (i32.div_s
          (local.tee $6
           (i32.add
            (local.get $6)
            (i32.const 9216)
           )
          )
          (i32.const 9)
         )
        )
        (if
         (i32.lt_s
          (local.tee $6
           (i32.sub
            (local.get $6)
            (i32.mul
             (local.get $14)
             (i32.const 9)
            )
           )
          )
          (i32.const 8)
         )
         (block
          (local.set $9
           (i32.const 10)
          )
          (loop $while-in20
           (local.set $10
            (i32.add
             (local.get $6)
             (i32.const 1)
            )
           )
           (local.set $9
            (i32.mul
             (local.get $9)
             (i32.const 10)
            )
           )
           (if
            (i32.lt_s
             (local.get $6)
             (i32.const 7)
            )
            (block
             (local.set $6
              (local.get $10)
             )
             (br $while-in20)
            )
           )
          )
         )
         (local.set $9
          (i32.const 10)
         )
        )
        (local.set $17
         (i32.div_u
          (local.tee $14
           (i32.load
            (local.tee $6
             (i32.add
              (i32.add
               (i32.shl
                (local.get $14)
                (i32.const 2)
               )
               (local.get $11)
              )
              (i32.const -4092)
             )
            )
           )
          )
          (local.get $9)
         )
        )
        (if
         (i32.eqz
          (i32.and
           (local.tee $25
            (i32.eq
             (local.get $8)
             (i32.add
              (local.get $6)
              (i32.const 4)
             )
            )
           )
           (i32.eqz
            (local.tee $10
             (i32.sub
              (local.get $14)
              (i32.mul
               (local.get $9)
               (local.get $17)
              )
             )
            )
           )
          )
         )
         (block
          (local.set $1
           (select
            (f64.const 9007199254740994)
            (f64.const 9007199254740992)
            (i32.and
             (local.get $17)
             (i32.const 1)
            )
           )
          )
          (local.set $16
           (select
            (f64.const 0.5)
            (select
             (f64.const 1)
             (f64.const 1.5)
             (i32.and
              (local.get $25)
              (i32.eq
               (local.get $10)
               (local.tee $17
                (i32.shr_u
                 (local.get $9)
                 (i32.const 1)
                )
               )
              )
             )
            )
            (i32.lt_u
             (local.get $10)
             (local.get $17)
            )
           )
          )
          (if
           (local.get $20)
           (block
            (local.set $16
             (select
              (f64.neg
               (local.get $16)
              )
              (local.get $16)
              (local.tee $17
               (i32.eq
                (i32.load8_s
                 (local.get $19)
                )
                (i32.const 45)
               )
              )
             )
            )
            (local.set $1
             (select
              (f64.neg
               (local.get $1)
              )
              (local.get $1)
              (local.get $17)
             )
            )
           )
          )
          (i32.store
           (local.get $6)
           (local.tee $10
            (i32.sub
             (local.get $14)
             (local.get $10)
            )
           )
          )
          (if
           (f64.ne
            (f64.add
             (local.get $1)
             (local.get $16)
            )
            (local.get $1)
           )
           (block
            (i32.store
             (local.get $6)
             (local.tee $7
              (i32.add
               (local.get $9)
               (local.get $10)
              )
             )
            )
            (if
             (i32.gt_u
              (local.get $7)
              (i32.const 999999999)
             )
             (loop $while-in22
              (i32.store
               (local.get $6)
               (i32.const 0)
              )
              (if
               (i32.lt_u
                (local.tee $6
                 (i32.add
                  (local.get $6)
                  (i32.const -4)
                 )
                )
                (local.get $3)
               )
               (i32.store
                (local.tee $3
                 (i32.add
                  (local.get $3)
                  (i32.const -4)
                 )
                )
                (i32.const 0)
               )
              )
              (i32.store
               (local.get $6)
               (local.tee $7
                (i32.add
                 (i32.load
                  (local.get $6)
                 )
                 (i32.const 1)
                )
               )
              )
              (br_if $while-in22
               (i32.gt_u
                (local.get $7)
                (i32.const 999999999)
               )
              )
             )
            )
            (local.set $7
             (i32.mul
              (i32.shr_s
               (i32.sub
                (local.get $11)
                (local.get $3)
               )
               (i32.const 2)
              )
              (i32.const 9)
             )
            )
            (if
             (i32.ge_u
              (local.tee $10
               (i32.load
                (local.get $3)
               )
              )
              (i32.const 10)
             )
             (block
              (local.set $9
               (i32.const 10)
              )
              (loop $while-in24
               (local.set $7
                (i32.add
                 (local.get $7)
                 (i32.const 1)
                )
               )
               (br_if $while-in24
                (i32.ge_u
                 (local.get $10)
                 (local.tee $9
                  (i32.mul
                   (local.get $9)
                   (i32.const 10)
                  )
                 )
                )
               )
              )
             )
            )
           )
          )
         )
        )
        (local.set $10
         (local.get $7)
        )
        (local.set $6
         (select
          (local.tee $7
           (i32.add
            (local.get $6)
            (i32.const 4)
           )
          )
          (local.get $8)
          (i32.gt_u
           (local.get $8)
           (local.get $7)
          )
         )
        )
        (local.get $3)
       )
       (block (result i32)
        (local.set $10
         (local.get $7)
        )
        (local.set $6
         (local.get $8)
        )
        (local.get $3)
       )
      )
     )
     (local.set $14
      (if (result i32)
       (i32.gt_u
        (local.get $6)
        (local.get $7)
       )
       (block $label$break$L109 (result i32)
        (local.set $3
         (local.get $6)
        )
        (loop $while-in27 (result i32)
         (if
          (i32.load
           (local.tee $6
            (i32.add
             (local.get $3)
             (i32.const -4)
            )
           )
          )
          (block
           (local.set $6
            (local.get $3)
           )
           (br $label$break$L109
            (i32.const 1)
           )
          )
         )
         (if (result i32)
          (i32.gt_u
           (local.get $6)
           (local.get $7)
          )
          (block
           (local.set $3
            (local.get $6)
           )
           (br $while-in27)
          )
          (i32.const 0)
         )
        )
       )
       (i32.const 0)
      )
     )
     (local.set $3
      (if (result i32)
       (local.get $23)
       (block (result i32)
        (local.set $5
         (if (result i32)
          (i32.and
           (i32.gt_s
            (local.tee $3
             (i32.add
              (i32.and
               (i32.xor
                (local.get $24)
                (i32.const 1)
               )
               (i32.const 1)
              )
              (local.get $12)
             )
            )
            (local.get $10)
           )
           (i32.gt_s
            (local.get $10)
            (i32.const -5)
           )
          )
          (block (result i32)
           (local.set $8
            (i32.sub
             (i32.add
              (local.get $3)
              (i32.const -1)
             )
             (local.get $10)
            )
           )
           (i32.add
            (local.get $5)
            (i32.const -1)
           )
          )
          (block (result i32)
           (local.set $8
            (i32.add
             (local.get $3)
             (i32.const -1)
            )
           )
           (i32.add
            (local.get $5)
            (i32.const -2)
           )
          )
         )
        )
        (if (result i32)
         (i32.and
          (local.get $4)
          (i32.const 8)
         )
         (local.get $8)
         (block (result i32)
          (if
           (local.get $14)
           (if
            (local.tee $12
             (i32.load
              (i32.add
               (local.get $6)
               (i32.const -4)
              )
             )
            )
            (if
             (i32.rem_u
              (local.get $12)
              (i32.const 10)
             )
             (local.set $3
              (i32.const 0)
             )
             (block
              (local.set $3
               (i32.const 0)
              )
              (local.set $9
               (i32.const 10)
              )
              (loop $while-in31
               (local.set $3
                (i32.add
                 (local.get $3)
                 (i32.const 1)
                )
               )
               (br_if $while-in31
                (i32.eqz
                 (i32.rem_u
                  (local.get $12)
                  (local.tee $9
                   (i32.mul
                    (local.get $9)
                    (i32.const 10)
                   )
                  )
                 )
                )
               )
              )
             )
            )
            (local.set $3
             (i32.const 9)
            )
           )
           (local.set $3
            (i32.const 9)
           )
          )
          (local.set $9
           (i32.add
            (i32.mul
             (i32.shr_s
              (i32.sub
               (local.get $6)
               (local.get $11)
              )
              (i32.const 2)
             )
             (i32.const 9)
            )
            (i32.const -9)
           )
          )
          (if (result i32)
           (i32.eq
            (i32.or
             (local.get $5)
             (i32.const 32)
            )
            (i32.const 102)
           )
           (select
            (local.get $8)
            (local.tee $3
             (select
              (local.tee $3
               (i32.sub
                (local.get $9)
                (local.get $3)
               )
              )
              (i32.const 0)
              (i32.gt_s
               (local.get $3)
               (i32.const 0)
              )
             )
            )
            (i32.lt_s
             (local.get $8)
             (local.get $3)
            )
           )
           (select
            (local.get $8)
            (local.tee $3
             (select
              (local.tee $3
               (i32.sub
                (i32.add
                 (local.get $9)
                 (local.get $10)
                )
                (local.get $3)
               )
              )
              (i32.const 0)
              (i32.gt_s
               (local.get $3)
               (i32.const 0)
              )
             )
            )
            (i32.lt_s
             (local.get $8)
             (local.get $3)
            )
           )
          )
         )
        )
       )
       (local.get $12)
      )
     )
     (local.set $9
      (i32.sub
       (i32.const 0)
       (local.get $10)
      )
     )
     (local.set $5
      (if (result i32)
       (local.tee $12
        (i32.eq
         (i32.or
          (local.get $5)
          (i32.const 32)
         )
         (i32.const 102)
        )
       )
       (block (result i32)
        (local.set $8
         (i32.const 0)
        )
        (select
         (local.get $10)
         (i32.const 0)
         (i32.gt_s
          (local.get $10)
          (i32.const 0)
         )
        )
       )
       (block (result i32)
        (if
         (i32.lt_s
          (i32.sub
           (local.get $15)
           (local.tee $9
            (call $_fmt_u
             (i64.extend_i32_s
              (select
               (local.get $9)
               (local.get $10)
               (i32.lt_s
                (local.get $10)
                (i32.const 0)
               )
              )
             )
             (local.get $15)
            )
           )
          )
          (i32.const 2)
         )
         (loop $while-in33
          (i32.store8
           (local.tee $9
            (i32.add
             (local.get $9)
             (i32.const -1)
            )
           )
           (i32.const 48)
          )
          (br_if $while-in33
           (i32.lt_s
            (i32.sub
             (local.get $15)
             (local.get $9)
            )
            (i32.const 2)
           )
          )
         )
        )
        (i32.store8
         (i32.add
          (local.get $9)
          (i32.const -1)
         )
         (i32.add
          (i32.and
           (i32.shr_s
            (local.get $10)
            (i32.const 31)
           )
           (i32.const 2)
          )
          (i32.const 43)
         )
        )
        (i32.store8
         (local.tee $8
          (i32.add
           (local.get $9)
           (i32.const -2)
          )
         )
         (local.get $5)
        )
        (i32.sub
         (local.get $15)
         (local.get $8)
        )
       )
      )
     )
     (call $_pad_661
      (local.get $0)
      (i32.const 32)
      (local.get $2)
      (local.tee $10
       (i32.add
        (i32.add
         (i32.add
          (local.get $3)
          (i32.add
           (local.get $20)
           (i32.const 1)
          )
         )
         (select
          (i32.const 1)
          (i32.and
           (i32.shr_u
            (local.get $4)
            (i32.const 3)
           )
           (i32.const 1)
          )
          (local.tee $17
           (i32.ne
            (local.get $3)
            (i32.const 0)
           )
          )
         )
        )
        (local.get $5)
       )
      )
      (local.get $4)
     )
     (call $_out_655
      (local.get $0)
      (local.get $19)
      (local.get $20)
     )
     (call $_pad_661
      (local.get $0)
      (i32.const 48)
      (local.get $2)
      (local.get $10)
      (i32.xor
       (local.get $4)
       (i32.const 65536)
      )
     )
     (if
      (local.get $12)
      (block
       (local.set $8
        (local.tee $9
         (i32.add
          (local.get $13)
          (i32.const 9)
         )
        )
       )
       (local.set $15
        (i32.add
         (local.get $13)
         (i32.const 8)
        )
       )
       (local.set $7
        (local.tee $12
         (select
          (local.get $11)
          (local.get $7)
          (i32.gt_u
           (local.get $7)
           (local.get $11)
          )
         )
        )
       )
       (loop $while-in35
        (local.set $5
         (call $_fmt_u
          (i64.extend_i32_u
           (i32.load
            (local.get $7)
           )
          )
          (local.get $9)
         )
        )
        (if
         (i32.eq
          (local.get $7)
          (local.get $12)
         )
         (if
          (i32.eq
           (local.get $5)
           (local.get $9)
          )
          (block
           (i32.store8
            (local.get $15)
            (i32.const 48)
           )
           (local.set $5
            (local.get $15)
           )
          )
         )
         (if
          (i32.gt_u
           (local.get $5)
           (local.get $13)
          )
          (block
           (drop
            (call $_memset
             (local.get $13)
             (i32.const 48)
             (i32.sub
              (local.get $5)
              (local.get $18)
             )
            )
           )
           (loop $while-in37
            (br_if $while-in37
             (i32.gt_u
              (local.tee $5
               (i32.add
                (local.get $5)
                (i32.const -1)
               )
              )
              (local.get $13)
             )
            )
           )
          )
         )
        )
        (call $_out_655
         (local.get $0)
         (local.get $5)
         (i32.sub
          (local.get $8)
          (local.get $5)
         )
        )
        (if
         (i32.le_u
          (local.tee $5
           (i32.add
            (local.get $7)
            (i32.const 4)
           )
          )
          (local.get $11)
         )
         (block
          (local.set $7
           (local.get $5)
          )
          (br $while-in35)
         )
        )
       )
       (if
        (i32.eqz
         (i32.and
          (i32.eqz
           (i32.and
            (local.get $4)
            (i32.const 8)
           )
          )
          (i32.xor
           (local.get $17)
           (i32.const 1)
          )
         )
        )
        (call $_out_655
         (local.get $0)
         (i32.const 2878)
         (i32.const 1)
        )
       )
       (if
        (i32.and
         (i32.lt_u
          (local.get $5)
          (local.get $6)
         )
         (i32.gt_s
          (local.get $3)
          (i32.const 0)
         )
        )
        (local.set $3
         (loop $while-in39 (result i32)
          (if
           (i32.gt_u
            (local.tee $7
             (call $_fmt_u
              (i64.extend_i32_u
               (i32.load
                (local.get $5)
               )
              )
              (local.get $9)
             )
            )
            (local.get $13)
           )
           (block
            (drop
             (call $_memset
              (local.get $13)
              (i32.const 48)
              (i32.sub
               (local.get $7)
               (local.get $18)
              )
             )
            )
            (loop $while-in41
             (br_if $while-in41
              (i32.gt_u
               (local.tee $7
                (i32.add
                 (local.get $7)
                 (i32.const -1)
                )
               )
               (local.get $13)
              )
             )
            )
           )
          )
          (call $_out_655
           (local.get $0)
           (local.get $7)
           (select
            (local.get $3)
            (i32.const 9)
            (i32.lt_s
             (local.get $3)
             (i32.const 9)
            )
           )
          )
          (local.set $7
           (i32.add
            (local.get $3)
            (i32.const -9)
           )
          )
          (if (result i32)
           (i32.and
            (i32.lt_u
             (local.tee $5
              (i32.add
               (local.get $5)
               (i32.const 4)
              )
             )
             (local.get $6)
            )
            (i32.gt_s
             (local.get $3)
             (i32.const 9)
            )
           )
           (block
            (local.set $3
             (local.get $7)
            )
            (br $while-in39)
           )
           (local.get $7)
          )
         )
        )
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 48)
        (i32.add
         (local.get $3)
         (i32.const 9)
        )
        (i32.const 9)
        (i32.const 0)
       )
      )
      (block
       (if
        (i32.and
         (i32.lt_u
          (local.get $7)
          (local.tee $20
           (select
            (local.get $6)
            (i32.add
             (local.get $7)
             (i32.const 4)
            )
            (local.get $14)
           )
          )
         )
         (i32.gt_s
          (local.get $3)
          (i32.const -1)
         )
        )
        (block
         (local.set $19
          (i32.eqz
           (i32.and
            (local.get $4)
            (i32.const 8)
           )
          )
         )
         (local.set $14
          (local.tee $11
           (i32.add
            (local.get $13)
            (i32.const 9)
           )
          )
         )
         (local.set $18
          (i32.sub
           (i32.const 0)
           (local.get $18)
          )
         )
         (local.set $12
          (i32.add
           (local.get $13)
           (i32.const 8)
          )
         )
         (local.set $5
          (local.get $3)
         )
         (local.set $6
          (local.get $7)
         )
         (local.set $3
          (loop $while-in43 (result i32)
           (if
            (i32.eq
             (local.get $11)
             (local.tee $3
              (call $_fmt_u
               (i64.extend_i32_u
                (i32.load
                 (local.get $6)
                )
               )
               (local.get $11)
              )
             )
            )
            (block
             (i32.store8
              (local.get $12)
              (i32.const 48)
             )
             (local.set $3
              (local.get $12)
             )
            )
           )
           (block $do-once44
            (if
             (i32.eq
              (local.get $6)
              (local.get $7)
             )
             (block
              (local.set $9
               (i32.add
                (local.get $3)
                (i32.const 1)
               )
              )
              (call $_out_655
               (local.get $0)
               (local.get $3)
               (i32.const 1)
              )
              (if
               (i32.and
                (local.get $19)
                (i32.lt_s
                 (local.get $5)
                 (i32.const 1)
                )
               )
               (block
                (local.set $3
                 (local.get $9)
                )
                (br $do-once44)
               )
              )
              (call $_out_655
               (local.get $0)
               (i32.const 2878)
               (i32.const 1)
              )
              (local.set $3
               (local.get $9)
              )
             )
             (block
              (br_if $do-once44
               (i32.le_u
                (local.get $3)
                (local.get $13)
               )
              )
              (drop
               (call $_memset
                (local.get $13)
                (i32.const 48)
                (i32.add
                 (local.get $3)
                 (local.get $18)
                )
               )
              )
              (loop $while-in47
               (br_if $while-in47
                (i32.gt_u
                 (local.tee $3
                  (i32.add
                   (local.get $3)
                   (i32.const -1)
                  )
                 )
                 (local.get $13)
                )
               )
              )
             )
            )
           )
           (call $_out_655
            (local.get $0)
            (local.get $3)
            (select
             (local.tee $3
              (i32.sub
               (local.get $14)
               (local.get $3)
              )
             )
             (local.get $5)
             (i32.gt_s
              (local.get $5)
              (local.get $3)
             )
            )
           )
           (br_if $while-in43
            (i32.and
             (i32.lt_u
              (local.tee $6
               (i32.add
                (local.get $6)
                (i32.const 4)
               )
              )
              (local.get $20)
             )
             (i32.gt_s
              (local.tee $5
               (i32.sub
                (local.get $5)
                (local.get $3)
               )
              )
              (i32.const -1)
             )
            )
           )
           (local.get $5)
          )
         )
        )
       )
       (call $_pad_661
        (local.get $0)
        (i32.const 48)
        (i32.add
         (local.get $3)
         (i32.const 18)
        )
        (i32.const 18)
        (i32.const 0)
       )
       (call $_out_655
        (local.get $0)
        (local.get $8)
        (i32.sub
         (local.get $15)
         (local.get $8)
        )
       )
      )
     )
     (call $_pad_661
      (local.get $0)
      (i32.const 32)
      (local.get $2)
      (local.get $10)
      (i32.xor
       (local.get $4)
       (i32.const 8192)
      )
     )
     (local.get $10)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $22)
  )
  (select
   (local.get $2)
   (local.get $0)
   (i32.lt_s
    (local.get $0)
    (local.get $2)
   )
  )
 )
 (func $___DOUBLE_BITS_662 (; 79 ;) (; has Stack IR ;) (param $0 f64) (result i64)
  (i64.reinterpret_f64
   (local.get $0)
  )
 )
 (func $_frexpl (; 80 ;) (; has Stack IR ;) (param $0 f64) (param $1 i32) (result f64)
  (call $_frexp
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_frexp (; 81 ;) (; has Stack IR ;) (param $0 f64) (param $1 i32) (result f64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (block $switch
   (block $switch-default
    (if
     (local.tee $4
      (i32.and
       (i32.wrap_i64
        (local.tee $3
         (i64.shr_u
          (local.tee $2
           (i64.reinterpret_f64
            (local.get $0)
           )
          )
          (i64.const 52)
         )
        )
       )
       (i32.const 2047)
      )
     )
     (if
      (i32.eq
       (local.get $4)
       (i32.const 2047)
      )
      (br $switch)
      (br $switch-default)
     )
    )
    (i32.store
     (local.get $1)
     (if (result i32)
      (f64.ne
       (local.get $0)
       (f64.const 0)
      )
      (block (result i32)
       (local.set $0
        (call $_frexp
         (f64.mul
          (local.get $0)
          (f64.const 18446744073709551615)
         )
         (local.get $1)
        )
       )
       (i32.add
        (i32.load
         (local.get $1)
        )
        (i32.const -64)
       )
      )
      (i32.const 0)
     )
    )
    (br $switch)
   )
   (i32.store
    (local.get $1)
    (i32.add
     (i32.and
      (i32.wrap_i64
       (local.get $3)
      )
      (i32.const 2047)
     )
     (i32.const -1022)
    )
   )
   (local.set $0
    (f64.reinterpret_i64
     (i64.or
      (i64.and
       (local.get $2)
       (i64.const -9218868437227405313)
      )
      (i64.const 4602678819172646912)
     )
    )
   )
  )
  (local.get $0)
 )
 (func $_wcrtomb (; 82 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (if (result i32)
   (local.get $0)
   (block $do-once (result i32)
    (if
     (i32.lt_u
      (local.get $1)
      (i32.const 128)
     )
     (block
      (i32.store8
       (local.get $0)
       (local.get $1)
      )
      (br $do-once
       (i32.const 1)
      )
     )
    )
    (if
     (i32.eqz
      (i32.load
       (i32.load offset=188
        (call $___pthread_self_888)
       )
      )
     )
     (if
      (i32.eq
       (i32.and
        (local.get $1)
        (i32.const -128)
       )
       (i32.const 57216)
      )
      (block
       (i32.store8
        (local.get $0)
        (local.get $1)
       )
       (br $do-once
        (i32.const 1)
       )
      )
      (block
       (i32.store
        (call $___errno_location)
        (i32.const 84)
       )
       (br $do-once
        (i32.const -1)
       )
      )
     )
    )
    (if
     (i32.lt_u
      (local.get $1)
      (i32.const 2048)
     )
     (block
      (i32.store8
       (local.get $0)
       (i32.or
        (i32.shr_u
         (local.get $1)
         (i32.const 6)
        )
        (i32.const 192)
       )
      )
      (i32.store8 offset=1
       (local.get $0)
       (i32.or
        (i32.and
         (local.get $1)
         (i32.const 63)
        )
        (i32.const 128)
       )
      )
      (br $do-once
       (i32.const 2)
      )
     )
    )
    (if
     (i32.or
      (i32.eq
       (i32.and
        (local.get $1)
        (i32.const -8192)
       )
       (i32.const 57344)
      )
      (i32.lt_u
       (local.get $1)
       (i32.const 55296)
      )
     )
     (block
      (i32.store8
       (local.get $0)
       (i32.or
        (i32.shr_u
         (local.get $1)
         (i32.const 12)
        )
        (i32.const 224)
       )
      )
      (i32.store8 offset=1
       (local.get $0)
       (i32.or
        (i32.and
         (i32.shr_u
          (local.get $1)
          (i32.const 6)
         )
         (i32.const 63)
        )
        (i32.const 128)
       )
      )
      (i32.store8 offset=2
       (local.get $0)
       (i32.or
        (i32.and
         (local.get $1)
         (i32.const 63)
        )
        (i32.const 128)
       )
      )
      (br $do-once
       (i32.const 3)
      )
     )
    )
    (if (result i32)
     (i32.lt_u
      (i32.add
       (local.get $1)
       (i32.const -65536)
      )
      (i32.const 1048576)
     )
     (block (result i32)
      (i32.store8
       (local.get $0)
       (i32.or
        (i32.shr_u
         (local.get $1)
         (i32.const 18)
        )
        (i32.const 240)
       )
      )
      (i32.store8 offset=1
       (local.get $0)
       (i32.or
        (i32.and
         (i32.shr_u
          (local.get $1)
          (i32.const 12)
         )
         (i32.const 63)
        )
        (i32.const 128)
       )
      )
      (i32.store8 offset=2
       (local.get $0)
       (i32.or
        (i32.and
         (i32.shr_u
          (local.get $1)
          (i32.const 6)
         )
         (i32.const 63)
        )
        (i32.const 128)
       )
      )
      (i32.store8 offset=3
       (local.get $0)
       (i32.or
        (i32.and
         (local.get $1)
         (i32.const 63)
        )
        (i32.const 128)
       )
      )
      (i32.const 4)
     )
     (block (result i32)
      (i32.store
       (call $___errno_location)
       (i32.const 84)
      )
      (i32.const -1)
     )
    )
   )
   (i32.const 1)
  )
 )
 (func $___pthread_self_888 (; 83 ;) (; has Stack IR ;) (result i32)
  (call $_pthread_self)
 )
 (func $_printf (; 84 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local.set $2
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (i32.store
   (local.get $2)
   (local.get $1)
  )
  (local.set $0
   (call $_vfprintf
    (i32.load
     (i32.const 1600)
    )
    (local.get $0)
    (local.get $2)
   )
  )
  (global.set $STACKTOP
   (local.get $2)
  )
  (local.get $0)
 )
 (func $_puts (; 85 ;) (; has Stack IR ;) (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local.set $2
   (if (result i32)
    (i32.gt_s
     (i32.load offset=76
      (local.tee $0
       (i32.load
        (i32.const 1600)
       )
      )
     )
     (i32.const -1)
    )
    (call $___lockfile)
    (i32.const 0)
   )
  )
  (local.set $1
   (if (result i32)
    (i32.lt_s
     (call $_fputs
      (i32.const 2812)
      (local.get $0)
     )
     (i32.const 0)
    )
    (i32.const -1)
    (block $do-once (result i32)
     (if
      (i32.ne
       (i32.load8_s offset=75
        (local.get $0)
       )
       (i32.const 10)
      )
      (if
       (i32.lt_u
        (local.tee $1
         (i32.load
          (local.tee $3
           (i32.add
            (local.get $0)
            (i32.const 20)
           )
          )
         )
        )
        (i32.load offset=16
         (local.get $0)
        )
       )
       (block
        (i32.store
         (local.get $3)
         (i32.add
          (local.get $1)
          (i32.const 1)
         )
        )
        (i32.store8
         (local.get $1)
         (i32.const 10)
        )
        (br $do-once
         (i32.const 0)
        )
       )
      )
     )
     (i32.shr_s
      (call $___overflow
       (local.get $0)
      )
      (i32.const 31)
     )
    )
   )
  )
  (if
   (local.get $2)
   (call $_clearContexts)
  )
  (local.get $1)
 )
 (func $_malloc (; 86 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  (local $20 i32)
  (local $21 i32)
  (local $22 i32)
  (local.set $14
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (local.set $3
   (if (result i32)
    (i32.lt_u
     (local.get $0)
     (i32.const 245)
    )
    (block (result i32)
     (if
      (i32.and
       (local.tee $3
        (i32.shr_u
         (local.tee $7
          (i32.load
           (i32.const 4036)
          )
         )
         (local.tee $0
          (i32.shr_u
           (local.tee $2
            (select
             (i32.const 16)
             (i32.and
              (i32.add
               (local.get $0)
               (i32.const 11)
              )
              (i32.const -8)
             )
             (i32.lt_u
              (local.get $0)
              (i32.const 11)
             )
            )
           )
           (i32.const 3)
          )
         )
        )
       )
       (i32.const 3)
      )
      (block
       (local.set $0
        (i32.load
         (local.tee $6
          (i32.add
           (local.tee $3
            (i32.load
             (local.tee $4
              (i32.add
               (local.tee $2
                (i32.add
                 (i32.shl
                  (local.tee $1
                   (i32.add
                    (i32.xor
                     (i32.and
                      (local.get $3)
                      (i32.const 1)
                     )
                     (i32.const 1)
                    )
                    (local.get $0)
                   )
                  )
                  (i32.const 3)
                 )
                 (i32.const 4076)
                )
               )
               (i32.const 8)
              )
             )
            )
           )
           (i32.const 8)
          )
         )
        )
       )
       (if
        (i32.eq
         (local.get $0)
         (local.get $2)
        )
        (i32.store
         (i32.const 4036)
         (i32.and
          (i32.xor
           (i32.shl
            (i32.const 1)
            (local.get $1)
           )
           (i32.const -1)
          )
          (local.get $7)
         )
        )
        (block
         (if
          (i32.gt_u
           (i32.load
            (i32.const 4052)
           )
           (local.get $0)
          )
          (call $_abort)
         )
         (if
          (i32.eq
           (local.get $3)
           (i32.load
            (local.tee $5
             (i32.add
              (local.get $0)
              (i32.const 12)
             )
            )
           )
          )
          (block
           (i32.store
            (local.get $5)
            (local.get $2)
           )
           (i32.store
            (local.get $4)
            (local.get $0)
           )
          )
          (call $_abort)
         )
        )
       )
       (i32.store offset=4
        (local.get $3)
        (i32.or
         (local.tee $0
          (i32.shl
           (local.get $1)
           (i32.const 3)
          )
         )
         (i32.const 3)
        )
       )
       (i32.store
        (local.tee $0
         (i32.add
          (i32.add
           (local.get $0)
           (local.get $3)
          )
          (i32.const 4)
         )
        )
        (i32.or
         (i32.load
          (local.get $0)
         )
         (i32.const 1)
        )
       )
       (global.set $STACKTOP
        (local.get $14)
       )
       (return
        (local.get $6)
       )
      )
     )
     (if (result i32)
      (i32.gt_u
       (local.get $2)
       (local.tee $13
        (i32.load
         (i32.const 4044)
        )
       )
      )
      (block (result i32)
       (if
        (local.get $3)
        (block
         (local.set $3
          (i32.load
           (local.tee $10
            (i32.add
             (local.tee $0
              (i32.load
               (local.tee $9
                (i32.add
                 (local.tee $5
                  (i32.add
                   (i32.shl
                    (local.tee $1
                     (i32.add
                      (i32.or
                       (i32.or
                        (i32.or
                         (i32.or
                          (local.tee $3
                           (i32.and
                            (i32.shr_u
                             (local.tee $0
                              (i32.add
                               (i32.and
                                (local.tee $0
                                 (i32.and
                                  (i32.shl
                                   (local.get $3)
                                   (local.get $0)
                                  )
                                  (i32.or
                                   (local.tee $0
                                    (i32.shl
                                     (i32.const 2)
                                     (local.get $0)
                                    )
                                   )
                                   (i32.sub
                                    (i32.const 0)
                                    (local.get $0)
                                   )
                                  )
                                 )
                                )
                                (i32.sub
                                 (i32.const 0)
                                 (local.get $0)
                                )
                               )
                               (i32.const -1)
                              )
                             )
                             (i32.const 12)
                            )
                            (i32.const 16)
                           )
                          )
                          (local.tee $3
                           (i32.and
                            (i32.shr_u
                             (local.tee $0
                              (i32.shr_u
                               (local.get $0)
                               (local.get $3)
                              )
                             )
                             (i32.const 5)
                            )
                            (i32.const 8)
                           )
                          )
                         )
                         (local.tee $3
                          (i32.and
                           (i32.shr_u
                            (local.tee $0
                             (i32.shr_u
                              (local.get $0)
                              (local.get $3)
                             )
                            )
                            (i32.const 2)
                           )
                           (i32.const 4)
                          )
                         )
                        )
                        (local.tee $3
                         (i32.and
                          (i32.shr_u
                           (local.tee $0
                            (i32.shr_u
                             (local.get $0)
                             (local.get $3)
                            )
                           )
                           (i32.const 1)
                          )
                          (i32.const 2)
                         )
                        )
                       )
                       (local.tee $3
                        (i32.and
                         (i32.shr_u
                          (local.tee $0
                           (i32.shr_u
                            (local.get $0)
                            (local.get $3)
                           )
                          )
                          (i32.const 1)
                         )
                         (i32.const 1)
                        )
                       )
                      )
                      (i32.shr_u
                       (local.get $0)
                       (local.get $3)
                      )
                     )
                    )
                    (i32.const 3)
                   )
                   (i32.const 4076)
                  )
                 )
                 (i32.const 8)
                )
               )
              )
             )
             (i32.const 8)
            )
           )
          )
         )
         (if
          (i32.eq
           (local.get $3)
           (local.get $5)
          )
          (i32.store
           (i32.const 4036)
           (local.tee $4
            (i32.and
             (i32.xor
              (i32.shl
               (i32.const 1)
               (local.get $1)
              )
              (i32.const -1)
             )
             (local.get $7)
            )
           )
          )
          (block
           (if
            (i32.gt_u
             (i32.load
              (i32.const 4052)
             )
             (local.get $3)
            )
            (call $_abort)
           )
           (if
            (i32.eq
             (local.get $0)
             (i32.load
              (local.tee $11
               (i32.add
                (local.get $3)
                (i32.const 12)
               )
              )
             )
            )
            (block
             (i32.store
              (local.get $11)
              (local.get $5)
             )
             (i32.store
              (local.get $9)
              (local.get $3)
             )
             (local.set $4
              (local.get $7)
             )
            )
            (call $_abort)
           )
          )
         )
         (i32.store offset=4
          (local.get $0)
          (i32.or
           (local.get $2)
           (i32.const 3)
          )
         )
         (i32.store offset=4
          (local.tee $7
           (i32.add
            (local.get $0)
            (local.get $2)
           )
          )
          (i32.or
           (local.tee $5
            (i32.sub
             (local.tee $3
              (i32.shl
               (local.get $1)
               (i32.const 3)
              )
             )
             (local.get $2)
            )
           )
           (i32.const 1)
          )
         )
         (i32.store
          (i32.add
           (local.get $0)
           (local.get $3)
          )
          (local.get $5)
         )
         (if
          (local.get $13)
          (block
           (local.set $2
            (i32.load
             (i32.const 4056)
            )
           )
           (local.set $0
            (i32.add
             (i32.shl
              (local.tee $3
               (i32.shr_u
                (local.get $13)
                (i32.const 3)
               )
              )
              (i32.const 3)
             )
             (i32.const 4076)
            )
           )
           (if
            (i32.and
             (local.tee $3
              (i32.shl
               (i32.const 1)
               (local.get $3)
              )
             )
             (local.get $4)
            )
            (if
             (i32.gt_u
              (i32.load
               (i32.const 4052)
              )
              (local.tee $1
               (i32.load
                (local.tee $3
                 (i32.add
                  (local.get $0)
                  (i32.const 8)
                 )
                )
               )
              )
             )
             (call $_abort)
             (block
              (local.set $6
               (local.get $1)
              )
              (local.set $12
               (local.get $3)
              )
             )
            )
            (block
             (i32.store
              (i32.const 4036)
              (i32.or
               (local.get $3)
               (local.get $4)
              )
             )
             (local.set $6
              (local.get $0)
             )
             (local.set $12
              (i32.add
               (local.get $0)
               (i32.const 8)
              )
             )
            )
           )
           (i32.store
            (local.get $12)
            (local.get $2)
           )
           (i32.store offset=12
            (local.get $6)
            (local.get $2)
           )
           (i32.store offset=8
            (local.get $2)
            (local.get $6)
           )
           (i32.store offset=12
            (local.get $2)
            (local.get $0)
           )
          )
         )
         (i32.store
          (i32.const 4044)
          (local.get $5)
         )
         (i32.store
          (i32.const 4056)
          (local.get $7)
         )
         (global.set $STACKTOP
          (local.get $14)
         )
         (return
          (local.get $10)
         )
        )
       )
       (if (result i32)
        (local.tee $12
         (i32.load
          (i32.const 4040)
         )
        )
        (block
         (local.set $0
          (local.tee $4
           (i32.load
            (i32.add
             (i32.shl
              (i32.add
               (i32.or
                (i32.or
                 (i32.or
                  (i32.or
                   (local.tee $3
                    (i32.and
                     (i32.shr_u
                      (local.tee $0
                       (i32.add
                        (i32.and
                         (local.get $12)
                         (i32.sub
                          (i32.const 0)
                          (local.get $12)
                         )
                        )
                        (i32.const -1)
                       )
                      )
                      (i32.const 12)
                     )
                     (i32.const 16)
                    )
                   )
                   (local.tee $3
                    (i32.and
                     (i32.shr_u
                      (local.tee $0
                       (i32.shr_u
                        (local.get $0)
                        (local.get $3)
                       )
                      )
                      (i32.const 5)
                     )
                     (i32.const 8)
                    )
                   )
                  )
                  (local.tee $3
                   (i32.and
                    (i32.shr_u
                     (local.tee $0
                      (i32.shr_u
                       (local.get $0)
                       (local.get $3)
                      )
                     )
                     (i32.const 2)
                    )
                    (i32.const 4)
                   )
                  )
                 )
                 (local.tee $3
                  (i32.and
                   (i32.shr_u
                    (local.tee $0
                     (i32.shr_u
                      (local.get $0)
                      (local.get $3)
                     )
                    )
                    (i32.const 1)
                   )
                   (i32.const 2)
                  )
                 )
                )
                (local.tee $3
                 (i32.and
                  (i32.shr_u
                   (local.tee $0
                    (i32.shr_u
                     (local.get $0)
                     (local.get $3)
                    )
                   )
                   (i32.const 1)
                  )
                  (i32.const 1)
                 )
                )
               )
               (i32.shr_u
                (local.get $0)
                (local.get $3)
               )
              )
              (i32.const 2)
             )
             (i32.const 4340)
            )
           )
          )
         )
         (local.set $10
          (i32.sub
           (i32.and
            (i32.load offset=4
             (local.get $4)
            )
            (i32.const -8)
           )
           (local.get $2)
          )
         )
         (loop $while-in
          (block $while-out
           (if
            (local.tee $3
             (i32.load offset=16
              (local.get $0)
             )
            )
            (local.set $0
             (local.get $3)
            )
            (br_if $while-out
             (i32.eqz
              (local.tee $0
               (i32.load offset=20
                (local.get $0)
               )
              )
             )
            )
           )
           (local.set $4
            (select
             (local.get $0)
             (local.get $4)
             (local.tee $6
              (i32.lt_u
               (local.tee $3
                (i32.sub
                 (i32.and
                  (i32.load offset=4
                   (local.get $0)
                  )
                  (i32.const -8)
                 )
                 (local.get $2)
                )
               )
               (local.get $10)
              )
             )
            )
           )
           (local.set $10
            (select
             (local.get $3)
             (local.get $10)
             (local.get $6)
            )
           )
           (br $while-in)
          )
         )
         (if
          (i32.gt_u
           (local.tee $15
            (i32.load
             (i32.const 4052)
            )
           )
           (local.get $4)
          )
          (call $_abort)
         )
         (if
          (i32.le_u
           (local.tee $8
            (i32.add
             (local.get $2)
             (local.get $4)
            )
           )
           (local.get $4)
          )
          (call $_abort)
         )
         (local.set $11
          (i32.load offset=24
           (local.get $4)
          )
         )
         (if
          (i32.eq
           (local.get $4)
           (local.tee $0
            (i32.load offset=12
             (local.get $4)
            )
           )
          )
          (block $do-once4
           (if
            (i32.eqz
             (local.tee $0
              (i32.load
               (local.tee $3
                (i32.add
                 (local.get $4)
                 (i32.const 20)
                )
               )
              )
             )
            )
            (br_if $do-once4
             (i32.eqz
              (local.tee $0
               (i32.load
                (local.tee $3
                 (i32.add
                  (local.get $4)
                  (i32.const 16)
                 )
                )
               )
              )
             )
            )
           )
           (loop $while-in7
            (block $while-out6
             (if
              (i32.eqz
               (local.tee $9
                (i32.load
                 (local.tee $6
                  (i32.add
                   (local.get $0)
                   (i32.const 20)
                  )
                 )
                )
               )
              )
              (br_if $while-out6
               (i32.eqz
                (local.tee $9
                 (i32.load
                  (local.tee $6
                   (i32.add
                    (local.get $0)
                    (i32.const 16)
                   )
                  )
                 )
                )
               )
              )
             )
             (local.set $3
              (local.get $6)
             )
             (local.set $0
              (local.get $9)
             )
             (br $while-in7)
            )
           )
           (if
            (i32.gt_u
             (local.get $15)
             (local.get $3)
            )
            (call $_abort)
            (block
             (i32.store
              (local.get $3)
              (i32.const 0)
             )
             (local.set $1
              (local.get $0)
             )
            )
           )
          )
          (block
           (if
            (i32.gt_u
             (local.get $15)
             (local.tee $3
              (i32.load offset=8
               (local.get $4)
              )
             )
            )
            (call $_abort)
           )
           (if
            (i32.ne
             (i32.load
              (local.tee $6
               (i32.add
                (local.get $3)
                (i32.const 12)
               )
              )
             )
             (local.get $4)
            )
            (call $_abort)
           )
           (if
            (i32.eq
             (local.get $4)
             (i32.load
              (local.tee $9
               (i32.add
                (local.get $0)
                (i32.const 8)
               )
              )
             )
            )
            (block
             (i32.store
              (local.get $6)
              (local.get $0)
             )
             (i32.store
              (local.get $9)
              (local.get $3)
             )
             (local.set $1
              (local.get $0)
             )
            )
            (call $_abort)
           )
          )
         )
         (if
          (local.get $11)
          (block $label$break$L78
           (if
            (i32.eq
             (local.get $4)
             (i32.load
              (local.tee $3
               (i32.add
                (i32.shl
                 (local.tee $0
                  (i32.load offset=28
                   (local.get $4)
                  )
                 )
                 (i32.const 2)
                )
                (i32.const 4340)
               )
              )
             )
            )
            (block
             (i32.store
              (local.get $3)
              (local.get $1)
             )
             (if
              (i32.eqz
               (local.get $1)
              )
              (block
               (i32.store
                (i32.const 4040)
                (i32.and
                 (local.get $12)
                 (i32.xor
                  (i32.shl
                   (i32.const 1)
                   (local.get $0)
                  )
                  (i32.const -1)
                 )
                )
               )
               (br $label$break$L78)
              )
             )
            )
            (if
             (i32.gt_u
              (i32.load
               (i32.const 4052)
              )
              (local.get $11)
             )
             (call $_abort)
             (block
              (i32.store
               (select
                (local.tee $0
                 (i32.add
                  (local.get $11)
                  (i32.const 16)
                 )
                )
                (i32.add
                 (local.get $11)
                 (i32.const 20)
                )
                (i32.eq
                 (local.get $4)
                 (i32.load
                  (local.get $0)
                 )
                )
               )
               (local.get $1)
              )
              (br_if $label$break$L78
               (i32.eqz
                (local.get $1)
               )
              )
             )
            )
           )
           (if
            (i32.gt_u
             (local.tee $3
              (i32.load
               (i32.const 4052)
              )
             )
             (local.get $1)
            )
            (call $_abort)
           )
           (i32.store offset=24
            (local.get $1)
            (local.get $11)
           )
           (if
            (local.tee $0
             (i32.load offset=16
              (local.get $4)
             )
            )
            (if
             (i32.gt_u
              (local.get $3)
              (local.get $0)
             )
             (call $_abort)
             (block
              (i32.store offset=16
               (local.get $1)
               (local.get $0)
              )
              (i32.store offset=24
               (local.get $0)
               (local.get $1)
              )
             )
            )
           )
           (if
            (local.tee $0
             (i32.load offset=20
              (local.get $4)
             )
            )
            (if
             (i32.gt_u
              (i32.load
               (i32.const 4052)
              )
              (local.get $0)
             )
             (call $_abort)
             (block
              (i32.store offset=20
               (local.get $1)
               (local.get $0)
              )
              (i32.store offset=24
               (local.get $0)
               (local.get $1)
              )
             )
            )
           )
          )
         )
         (if
          (i32.lt_u
           (local.get $10)
           (i32.const 16)
          )
          (block
           (i32.store offset=4
            (local.get $4)
            (i32.or
             (local.tee $0
              (i32.add
               (local.get $2)
               (local.get $10)
              )
             )
             (i32.const 3)
            )
           )
           (i32.store
            (local.tee $0
             (i32.add
              (i32.add
               (local.get $0)
               (local.get $4)
              )
              (i32.const 4)
             )
            )
            (i32.or
             (i32.load
              (local.get $0)
             )
             (i32.const 1)
            )
           )
          )
          (block
           (i32.store offset=4
            (local.get $4)
            (i32.or
             (local.get $2)
             (i32.const 3)
            )
           )
           (i32.store offset=4
            (local.get $8)
            (i32.or
             (local.get $10)
             (i32.const 1)
            )
           )
           (i32.store
            (i32.add
             (local.get $8)
             (local.get $10)
            )
            (local.get $10)
           )
           (if
            (local.get $13)
            (block
             (local.set $2
              (i32.load
               (i32.const 4056)
              )
             )
             (local.set $0
              (i32.add
               (i32.shl
                (local.tee $3
                 (i32.shr_u
                  (local.get $13)
                  (i32.const 3)
                 )
                )
                (i32.const 3)
               )
               (i32.const 4076)
              )
             )
             (if
              (i32.and
               (local.tee $3
                (i32.shl
                 (i32.const 1)
                 (local.get $3)
                )
               )
               (local.get $7)
              )
              (if
               (i32.gt_u
                (i32.load
                 (i32.const 4052)
                )
                (local.tee $1
                 (i32.load
                  (local.tee $3
                   (i32.add
                    (local.get $0)
                    (i32.const 8)
                   )
                  )
                 )
                )
               )
               (call $_abort)
               (block
                (local.set $5
                 (local.get $1)
                )
                (local.set $16
                 (local.get $3)
                )
               )
              )
              (block
               (i32.store
                (i32.const 4036)
                (i32.or
                 (local.get $3)
                 (local.get $7)
                )
               )
               (local.set $5
                (local.get $0)
               )
               (local.set $16
                (i32.add
                 (local.get $0)
                 (i32.const 8)
                )
               )
              )
             )
             (i32.store
              (local.get $16)
              (local.get $2)
             )
             (i32.store offset=12
              (local.get $5)
              (local.get $2)
             )
             (i32.store offset=8
              (local.get $2)
              (local.get $5)
             )
             (i32.store offset=12
              (local.get $2)
              (local.get $0)
             )
            )
           )
           (i32.store
            (i32.const 4044)
            (local.get $10)
           )
           (i32.store
            (i32.const 4056)
            (local.get $8)
           )
          )
         )
         (global.set $STACKTOP
          (local.get $14)
         )
         (return
          (i32.add
           (local.get $4)
           (i32.const 8)
          )
         )
        )
        (local.get $2)
       )
      )
      (local.get $2)
     )
    )
    (if (result i32)
     (i32.gt_u
      (local.get $0)
      (i32.const -65)
     )
     (i32.const -1)
     (block $do-once (result i32)
      (local.set $4
       (i32.and
        (local.tee $0
         (i32.add
          (local.get $0)
          (i32.const 11)
         )
        )
        (i32.const -8)
       )
      )
      (if (result i32)
       (local.tee $6
        (i32.load
         (i32.const 4040)
        )
       )
       (block (result i32)
        (local.set $18
         (if (result i32)
          (local.tee $0
           (i32.shr_u
            (local.get $0)
            (i32.const 8)
           )
          )
          (if (result i32)
           (i32.gt_u
            (local.get $4)
            (i32.const 16777215)
           )
           (i32.const 31)
           (block (result i32)
            (local.set $0
             (i32.and
              (i32.shr_u
               (i32.add
                (local.tee $2
                 (i32.shl
                  (local.get $0)
                  (local.tee $1
                   (i32.and
                    (i32.shr_u
                     (i32.add
                      (local.get $0)
                      (i32.const 1048320)
                     )
                     (i32.const 16)
                    )
                    (i32.const 8)
                   )
                  )
                 )
                )
                (i32.const 520192)
               )
               (i32.const 16)
              )
              (i32.const 4)
             )
            )
            (i32.or
             (i32.shl
              (local.tee $0
               (i32.add
                (i32.sub
                 (i32.const 14)
                 (i32.or
                  (i32.or
                   (local.get $0)
                   (local.get $1)
                  )
                  (local.tee $1
                   (i32.and
                    (i32.shr_u
                     (i32.add
                      (local.tee $0
                       (i32.shl
                        (local.get $2)
                        (local.get $0)
                       )
                      )
                      (i32.const 245760)
                     )
                     (i32.const 16)
                    )
                    (i32.const 2)
                   )
                  )
                 )
                )
                (i32.shr_u
                 (i32.shl
                  (local.get $0)
                  (local.get $1)
                 )
                 (i32.const 15)
                )
               )
              )
              (i32.const 1)
             )
             (i32.and
              (i32.shr_u
               (local.get $4)
               (i32.add
                (local.get $0)
                (i32.const 7)
               )
              )
              (i32.const 1)
             )
            )
           )
          )
          (i32.const 0)
         )
        )
        (local.set $2
         (i32.sub
          (i32.const 0)
          (local.get $4)
         )
        )
        (block $__rjto$1
         (block $__rjti$1
          (local.set $0
           (if (result i32)
            (local.tee $0
             (i32.load
              (i32.add
               (i32.shl
                (local.get $18)
                (i32.const 2)
               )
               (i32.const 4340)
              )
             )
            )
            (block (result i32)
             (local.set $1
              (i32.const 0)
             )
             (local.set $12
              (i32.shl
               (local.get $4)
               (select
                (i32.const 0)
                (i32.sub
                 (i32.const 25)
                 (i32.shr_u
                  (local.get $18)
                  (i32.const 1)
                 )
                )
                (i32.eq
                 (local.get $18)
                 (i32.const 31)
                )
               )
              )
             )
             (loop $while-in15 (result i32)
              (if
               (i32.lt_u
                (local.tee $16
                 (i32.sub
                  (i32.and
                   (i32.load offset=4
                    (local.get $0)
                   )
                   (i32.const -8)
                  )
                  (local.get $4)
                 )
                )
                (local.get $2)
               )
               (local.set $1
                (if (result i32)
                 (local.get $16)
                 (block (result i32)
                  (local.set $2
                   (local.get $16)
                  )
                  (local.get $0)
                 )
                 (block
                  (local.set $2
                   (i32.const 0)
                  )
                  (local.set $1
                   (local.get $0)
                  )
                  (br $__rjti$1)
                 )
                )
               )
              )
              (local.set $5
               (select
                (local.get $5)
                (local.tee $5
                 (i32.load offset=20
                  (local.get $0)
                 )
                )
                (i32.or
                 (i32.eqz
                  (local.get $5)
                 )
                 (i32.eq
                  (local.get $5)
                  (local.tee $0
                   (i32.load
                    (i32.add
                     (i32.add
                      (local.get $0)
                      (i32.const 16)
                     )
                     (i32.shl
                      (i32.shr_u
                       (local.get $12)
                       (i32.const 31)
                      )
                      (i32.const 2)
                     )
                    )
                   )
                  )
                 )
                )
               )
              )
              (local.set $12
               (i32.shl
                (local.get $12)
                (i32.const 1)
               )
              )
              (br_if $while-in15
               (local.get $0)
              )
              (local.get $1)
             )
            )
            (i32.const 0)
           )
          )
          (br_if $__rjti$1
           (local.tee $1
            (if (result i32)
             (i32.or
              (local.get $0)
              (local.get $5)
             )
             (local.get $5)
             (block (result i32)
              (drop
               (br_if $do-once
                (local.get $4)
                (i32.eqz
                 (local.tee $1
                  (i32.and
                   (local.get $6)
                   (i32.or
                    (local.tee $0
                     (i32.shl
                      (i32.const 2)
                      (local.get $18)
                     )
                    )
                    (i32.sub
                     (i32.const 0)
                     (local.get $0)
                    )
                   )
                  )
                 )
                )
               )
              )
              (local.set $0
               (i32.const 0)
              )
              (i32.load
               (i32.add
                (i32.shl
                 (i32.add
                  (i32.or
                   (i32.or
                    (i32.or
                     (i32.or
                      (local.tee $5
                       (i32.and
                        (i32.shr_u
                         (local.tee $1
                          (i32.add
                           (i32.and
                            (local.get $1)
                            (i32.sub
                             (i32.const 0)
                             (local.get $1)
                            )
                           )
                           (i32.const -1)
                          )
                         )
                         (i32.const 12)
                        )
                        (i32.const 16)
                       )
                      )
                      (local.tee $5
                       (i32.and
                        (i32.shr_u
                         (local.tee $1
                          (i32.shr_u
                           (local.get $1)
                           (local.get $5)
                          )
                         )
                         (i32.const 5)
                        )
                        (i32.const 8)
                       )
                      )
                     )
                     (local.tee $5
                      (i32.and
                       (i32.shr_u
                        (local.tee $1
                         (i32.shr_u
                          (local.get $1)
                          (local.get $5)
                         )
                        )
                        (i32.const 2)
                       )
                       (i32.const 4)
                      )
                     )
                    )
                    (local.tee $5
                     (i32.and
                      (i32.shr_u
                       (local.tee $1
                        (i32.shr_u
                         (local.get $1)
                         (local.get $5)
                        )
                       )
                       (i32.const 1)
                      )
                      (i32.const 2)
                     )
                    )
                   )
                   (local.tee $5
                    (i32.and
                     (i32.shr_u
                      (local.tee $1
                       (i32.shr_u
                        (local.get $1)
                        (local.get $5)
                       )
                      )
                      (i32.const 1)
                     )
                     (i32.const 1)
                    )
                   )
                  )
                  (i32.shr_u
                   (local.get $1)
                   (local.get $5)
                  )
                 )
                 (i32.const 2)
                )
                (i32.const 4340)
               )
              )
             )
            )
           )
          )
          (local.set $5
           (local.get $0)
          )
          (br $__rjto$1)
         )
         (local.set $5
          (local.get $0)
         )
         (local.set $0
          (local.get $2)
         )
         (local.set $2
          (loop $while-in17 (result i32)
           (local.set $12
            (i32.load offset=4
             (local.get $1)
            )
           )
           (if
            (i32.eqz
             (local.tee $2
              (i32.load offset=16
               (local.get $1)
              )
             )
            )
            (local.set $2
             (i32.load offset=20
              (local.get $1)
             )
            )
           )
           (local.set $12
            (i32.lt_u
             (local.tee $16
              (i32.sub
               (i32.and
                (local.get $12)
                (i32.const -8)
               )
               (local.get $4)
              )
             )
             (local.get $0)
            )
           )
           (local.set $0
            (select
             (local.get $16)
             (local.get $0)
             (local.get $12)
            )
           )
           (local.set $5
            (select
             (local.get $1)
             (local.get $5)
             (local.get $12)
            )
           )
           (if (result i32)
            (local.get $2)
            (block
             (local.set $1
              (local.get $2)
             )
             (br $while-in17)
            )
            (local.get $0)
           )
          )
         )
        )
        (if (result i32)
         (local.get $5)
         (if (result i32)
          (i32.lt_u
           (local.get $2)
           (i32.sub
            (i32.load
             (i32.const 4044)
            )
            (local.get $4)
           )
          )
          (block
           (if
            (i32.gt_u
             (local.tee $17
              (i32.load
               (i32.const 4052)
              )
             )
             (local.get $5)
            )
            (call $_abort)
           )
           (if
            (i32.le_u
             (local.tee $8
              (i32.add
               (local.get $4)
               (local.get $5)
              )
             )
             (local.get $5)
            )
            (call $_abort)
           )
           (local.set $15
            (i32.load offset=24
             (local.get $5)
            )
           )
           (if
            (i32.eq
             (local.get $5)
             (local.tee $0
              (i32.load offset=12
               (local.get $5)
              )
             )
            )
            (block $do-once18
             (if
              (i32.eqz
               (local.tee $0
                (i32.load
                 (local.tee $1
                  (i32.add
                   (local.get $5)
                   (i32.const 20)
                  )
                 )
                )
               )
              )
              (br_if $do-once18
               (i32.eqz
                (local.tee $0
                 (i32.load
                  (local.tee $1
                   (i32.add
                    (local.get $5)
                    (i32.const 16)
                   )
                  )
                 )
                )
               )
              )
             )
             (loop $while-in21
              (block $while-out20
               (if
                (i32.eqz
                 (local.tee $11
                  (i32.load
                   (local.tee $9
                    (i32.add
                     (local.get $0)
                     (i32.const 20)
                    )
                   )
                  )
                 )
                )
                (br_if $while-out20
                 (i32.eqz
                  (local.tee $11
                   (i32.load
                    (local.tee $9
                     (i32.add
                      (local.get $0)
                      (i32.const 16)
                     )
                    )
                   )
                  )
                 )
                )
               )
               (local.set $1
                (local.get $9)
               )
               (local.set $0
                (local.get $11)
               )
               (br $while-in21)
              )
             )
             (if
              (i32.gt_u
               (local.get $17)
               (local.get $1)
              )
              (call $_abort)
              (block
               (i32.store
                (local.get $1)
                (i32.const 0)
               )
               (local.set $7
                (local.get $0)
               )
              )
             )
            )
            (block
             (if
              (i32.gt_u
               (local.get $17)
               (local.tee $1
                (i32.load offset=8
                 (local.get $5)
                )
               )
              )
              (call $_abort)
             )
             (if
              (i32.ne
               (i32.load
                (local.tee $9
                 (i32.add
                  (local.get $1)
                  (i32.const 12)
                 )
                )
               )
               (local.get $5)
              )
              (call $_abort)
             )
             (if
              (i32.eq
               (local.get $5)
               (i32.load
                (local.tee $11
                 (i32.add
                  (local.get $0)
                  (i32.const 8)
                 )
                )
               )
              )
              (block
               (i32.store
                (local.get $9)
                (local.get $0)
               )
               (i32.store
                (local.get $11)
                (local.get $1)
               )
               (local.set $7
                (local.get $0)
               )
              )
              (call $_abort)
             )
            )
           )
           (if
            (local.get $15)
            (block $label$break$L176
             (if
              (i32.eq
               (local.get $5)
               (i32.load
                (local.tee $1
                 (i32.add
                  (i32.shl
                   (local.tee $0
                    (i32.load offset=28
                     (local.get $5)
                    )
                   )
                   (i32.const 2)
                  )
                  (i32.const 4340)
                 )
                )
               )
              )
              (block
               (i32.store
                (local.get $1)
                (local.get $7)
               )
               (if
                (i32.eqz
                 (local.get $7)
                )
                (block
                 (i32.store
                  (i32.const 4040)
                  (local.tee $3
                   (i32.and
                    (local.get $6)
                    (i32.xor
                     (i32.shl
                      (i32.const 1)
                      (local.get $0)
                     )
                     (i32.const -1)
                    )
                   )
                  )
                 )
                 (br $label$break$L176)
                )
               )
              )
              (if
               (i32.gt_u
                (i32.load
                 (i32.const 4052)
                )
                (local.get $15)
               )
               (call $_abort)
               (block
                (i32.store
                 (select
                  (local.tee $0
                   (i32.add
                    (local.get $15)
                    (i32.const 16)
                   )
                  )
                  (i32.add
                   (local.get $15)
                   (i32.const 20)
                  )
                  (i32.eq
                   (local.get $5)
                   (i32.load
                    (local.get $0)
                   )
                  )
                 )
                 (local.get $7)
                )
                (if
                 (i32.eqz
                  (local.get $7)
                 )
                 (block
                  (local.set $3
                   (local.get $6)
                  )
                  (br $label$break$L176)
                 )
                )
               )
              )
             )
             (if
              (i32.gt_u
               (local.tee $1
                (i32.load
                 (i32.const 4052)
                )
               )
               (local.get $7)
              )
              (call $_abort)
             )
             (i32.store offset=24
              (local.get $7)
              (local.get $15)
             )
             (if
              (local.tee $0
               (i32.load offset=16
                (local.get $5)
               )
              )
              (if
               (i32.gt_u
                (local.get $1)
                (local.get $0)
               )
               (call $_abort)
               (block
                (i32.store offset=16
                 (local.get $7)
                 (local.get $0)
                )
                (i32.store offset=24
                 (local.get $0)
                 (local.get $7)
                )
               )
              )
             )
             (if
              (local.tee $0
               (i32.load offset=20
                (local.get $5)
               )
              )
              (if
               (i32.gt_u
                (i32.load
                 (i32.const 4052)
                )
                (local.get $0)
               )
               (call $_abort)
               (block
                (i32.store offset=20
                 (local.get $7)
                 (local.get $0)
                )
                (i32.store offset=24
                 (local.get $0)
                 (local.get $7)
                )
                (local.set $3
                 (local.get $6)
                )
               )
              )
              (local.set $3
               (local.get $6)
              )
             )
            )
            (local.set $3
             (local.get $6)
            )
           )
           (if
            (i32.lt_u
             (local.get $2)
             (i32.const 16)
            )
            (block
             (i32.store offset=4
              (local.get $5)
              (i32.or
               (local.tee $0
                (i32.add
                 (local.get $2)
                 (local.get $4)
                )
               )
               (i32.const 3)
              )
             )
             (i32.store
              (local.tee $0
               (i32.add
                (i32.add
                 (local.get $0)
                 (local.get $5)
                )
                (i32.const 4)
               )
              )
              (i32.or
               (i32.load
                (local.get $0)
               )
               (i32.const 1)
              )
             )
            )
            (block $label$break$L200
             (i32.store offset=4
              (local.get $5)
              (i32.or
               (local.get $4)
               (i32.const 3)
              )
             )
             (i32.store offset=4
              (local.get $8)
              (i32.or
               (local.get $2)
               (i32.const 1)
              )
             )
             (i32.store
              (i32.add
               (local.get $2)
               (local.get $8)
              )
              (local.get $2)
             )
             (local.set $1
              (i32.shr_u
               (local.get $2)
               (i32.const 3)
              )
             )
             (if
              (i32.lt_u
               (local.get $2)
               (i32.const 256)
              )
              (block
               (local.set $0
                (i32.add
                 (i32.shl
                  (local.get $1)
                  (i32.const 3)
                 )
                 (i32.const 4076)
                )
               )
               (if
                (i32.and
                 (local.tee $3
                  (i32.load
                   (i32.const 4036)
                  )
                 )
                 (local.tee $1
                  (i32.shl
                   (i32.const 1)
                   (local.get $1)
                  )
                 )
                )
                (if
                 (i32.gt_u
                  (i32.load
                   (i32.const 4052)
                  )
                  (local.tee $1
                   (i32.load
                    (local.tee $3
                     (i32.add
                      (local.get $0)
                      (i32.const 8)
                     )
                    )
                   )
                  )
                 )
                 (call $_abort)
                 (block
                  (local.set $13
                   (local.get $1)
                  )
                  (local.set $19
                   (local.get $3)
                  )
                 )
                )
                (block
                 (i32.store
                  (i32.const 4036)
                  (i32.or
                   (local.get $1)
                   (local.get $3)
                  )
                 )
                 (local.set $13
                  (local.get $0)
                 )
                 (local.set $19
                  (i32.add
                   (local.get $0)
                   (i32.const 8)
                  )
                 )
                )
               )
               (i32.store
                (local.get $19)
                (local.get $8)
               )
               (i32.store offset=12
                (local.get $13)
                (local.get $8)
               )
               (i32.store offset=8
                (local.get $8)
                (local.get $13)
               )
               (i32.store offset=12
                (local.get $8)
                (local.get $0)
               )
               (br $label$break$L200)
              )
             )
             (local.set $0
              (i32.add
               (i32.shl
                (local.tee $1
                 (if (result i32)
                  (local.tee $0
                   (i32.shr_u
                    (local.get $2)
                    (i32.const 8)
                   )
                  )
                  (if (result i32)
                   (i32.gt_u
                    (local.get $2)
                    (i32.const 16777215)
                   )
                   (i32.const 31)
                   (block (result i32)
                    (local.set $0
                     (i32.and
                      (i32.shr_u
                       (i32.add
                        (local.tee $4
                         (i32.shl
                          (local.get $0)
                          (local.tee $1
                           (i32.and
                            (i32.shr_u
                             (i32.add
                              (local.get $0)
                              (i32.const 1048320)
                             )
                             (i32.const 16)
                            )
                            (i32.const 8)
                           )
                          )
                         )
                        )
                        (i32.const 520192)
                       )
                       (i32.const 16)
                      )
                      (i32.const 4)
                     )
                    )
                    (i32.or
                     (i32.shl
                      (local.tee $0
                       (i32.add
                        (i32.sub
                         (i32.const 14)
                         (i32.or
                          (i32.or
                           (local.get $0)
                           (local.get $1)
                          )
                          (local.tee $1
                           (i32.and
                            (i32.shr_u
                             (i32.add
                              (local.tee $0
                               (i32.shl
                                (local.get $4)
                                (local.get $0)
                               )
                              )
                              (i32.const 245760)
                             )
                             (i32.const 16)
                            )
                            (i32.const 2)
                           )
                          )
                         )
                        )
                        (i32.shr_u
                         (i32.shl
                          (local.get $0)
                          (local.get $1)
                         )
                         (i32.const 15)
                        )
                       )
                      )
                      (i32.const 1)
                     )
                     (i32.and
                      (i32.shr_u
                       (local.get $2)
                       (i32.add
                        (local.get $0)
                        (i32.const 7)
                       )
                      )
                      (i32.const 1)
                     )
                    )
                   )
                  )
                  (i32.const 0)
                 )
                )
                (i32.const 2)
               )
               (i32.const 4340)
              )
             )
             (i32.store offset=28
              (local.get $8)
              (local.get $1)
             )
             (i32.store offset=4
              (local.tee $4
               (i32.add
                (local.get $8)
                (i32.const 16)
               )
              )
              (i32.const 0)
             )
             (i32.store
              (local.get $4)
              (i32.const 0)
             )
             (if
              (i32.eqz
               (i32.and
                (local.tee $4
                 (i32.shl
                  (i32.const 1)
                  (local.get $1)
                 )
                )
                (local.get $3)
               )
              )
              (block
               (i32.store
                (i32.const 4040)
                (i32.or
                 (local.get $3)
                 (local.get $4)
                )
               )
               (i32.store
                (local.get $0)
                (local.get $8)
               )
               (i32.store offset=24
                (local.get $8)
                (local.get $0)
               )
               (i32.store offset=12
                (local.get $8)
                (local.get $8)
               )
               (i32.store offset=8
                (local.get $8)
                (local.get $8)
               )
               (br $label$break$L200)
              )
             )
             (if
              (i32.eq
               (local.get $2)
               (i32.and
                (i32.load offset=4
                 (local.tee $0
                  (i32.load
                   (local.get $0)
                  )
                 )
                )
                (i32.const -8)
               )
              )
              (local.set $10
               (local.get $0)
              )
              (block $label$break$L218
               (local.set $1
                (i32.shl
                 (local.get $2)
                 (select
                  (i32.const 0)
                  (i32.sub
                   (i32.const 25)
                   (i32.shr_u
                    (local.get $1)
                    (i32.const 1)
                   )
                  )
                  (i32.eq
                   (local.get $1)
                   (i32.const 31)
                  )
                 )
                )
               )
               (loop $while-in30
                (if
                 (local.tee $3
                  (i32.load
                   (local.tee $4
                    (i32.add
                     (i32.add
                      (local.get $0)
                      (i32.const 16)
                     )
                     (i32.shl
                      (i32.shr_u
                       (local.get $1)
                       (i32.const 31)
                      )
                      (i32.const 2)
                     )
                    )
                   )
                  )
                 )
                 (block
                  (local.set $1
                   (i32.shl
                    (local.get $1)
                    (i32.const 1)
                   )
                  )
                  (if
                   (i32.eq
                    (local.get $2)
                    (i32.and
                     (i32.load offset=4
                      (local.get $3)
                     )
                     (i32.const -8)
                    )
                   )
                   (block
                    (local.set $10
                     (local.get $3)
                    )
                    (br $label$break$L218)
                   )
                   (block
                    (local.set $0
                     (local.get $3)
                    )
                    (br $while-in30)
                   )
                  )
                 )
                )
               )
               (if
                (i32.gt_u
                 (i32.load
                  (i32.const 4052)
                 )
                 (local.get $4)
                )
                (call $_abort)
                (block
                 (i32.store
                  (local.get $4)
                  (local.get $8)
                 )
                 (i32.store offset=24
                  (local.get $8)
                  (local.get $0)
                 )
                 (i32.store offset=12
                  (local.get $8)
                  (local.get $8)
                 )
                 (i32.store offset=8
                  (local.get $8)
                  (local.get $8)
                 )
                 (br $label$break$L200)
                )
               )
              )
             )
             (if
              (i32.and
               (i32.le_u
                (local.tee $0
                 (i32.load
                  (i32.const 4052)
                 )
                )
                (local.get $10)
               )
               (i32.le_u
                (local.get $0)
                (local.tee $0
                 (i32.load
                  (local.tee $3
                   (i32.add
                    (local.get $10)
                    (i32.const 8)
                   )
                  )
                 )
                )
               )
              )
              (block
               (i32.store offset=12
                (local.get $0)
                (local.get $8)
               )
               (i32.store
                (local.get $3)
                (local.get $8)
               )
               (i32.store offset=8
                (local.get $8)
                (local.get $0)
               )
               (i32.store offset=12
                (local.get $8)
                (local.get $10)
               )
               (i32.store offset=24
                (local.get $8)
                (i32.const 0)
               )
              )
              (call $_abort)
             )
            )
           )
           (global.set $STACKTOP
            (local.get $14)
           )
           (return
            (i32.add
             (local.get $5)
             (i32.const 8)
            )
           )
          )
          (local.get $4)
         )
         (local.get $4)
        )
       )
       (local.get $4)
      )
     )
    )
   )
  )
  (block $folding-inner1
   (if
    (i32.ge_u
     (local.tee $1
      (i32.load
       (i32.const 4044)
      )
     )
     (local.get $3)
    )
    (block
     (local.set $0
      (i32.load
       (i32.const 4056)
      )
     )
     (if
      (i32.gt_u
       (local.tee $2
        (i32.sub
         (local.get $1)
         (local.get $3)
        )
       )
       (i32.const 15)
      )
      (block
       (i32.store
        (i32.const 4056)
        (local.tee $4
         (i32.add
          (local.get $0)
          (local.get $3)
         )
        )
       )
       (i32.store
        (i32.const 4044)
        (local.get $2)
       )
       (i32.store offset=4
        (local.get $4)
        (i32.or
         (local.get $2)
         (i32.const 1)
        )
       )
       (i32.store
        (i32.add
         (local.get $0)
         (local.get $1)
        )
        (local.get $2)
       )
       (i32.store offset=4
        (local.get $0)
        (i32.or
         (local.get $3)
         (i32.const 3)
        )
       )
      )
      (block
       (i32.store
        (i32.const 4044)
        (i32.const 0)
       )
       (i32.store
        (i32.const 4056)
        (i32.const 0)
       )
       (i32.store offset=4
        (local.get $0)
        (i32.or
         (local.get $1)
         (i32.const 3)
        )
       )
       (i32.store
        (local.tee $3
         (i32.add
          (i32.add
           (local.get $0)
           (local.get $1)
          )
          (i32.const 4)
         )
        )
        (i32.or
         (i32.load
          (local.get $3)
         )
         (i32.const 1)
        )
       )
      )
     )
     (br $folding-inner1)
    )
   )
   (block $folding-inner0
    (if
     (i32.gt_u
      (local.tee $1
       (i32.load
        (i32.const 4048)
       )
      )
      (local.get $3)
     )
     (block
      (i32.store
       (i32.const 4048)
       (local.tee $1
        (i32.sub
         (local.get $1)
         (local.get $3)
        )
       )
      )
      (br $folding-inner0)
     )
    )
    (if
     (i32.le_u
      (local.tee $4
       (i32.and
        (local.tee $5
         (i32.add
          (local.tee $6
           (i32.add
            (local.get $3)
            (i32.const 47)
           )
          )
          (local.tee $0
           (if (result i32)
            (i32.load
             (i32.const 4508)
            )
            (i32.load
             (i32.const 4516)
            )
            (block (result i32)
             (i32.store
              (i32.const 4516)
              (i32.const 4096)
             )
             (i32.store
              (i32.const 4512)
              (i32.const 4096)
             )
             (i32.store
              (i32.const 4520)
              (i32.const -1)
             )
             (i32.store
              (i32.const 4524)
              (i32.const -1)
             )
             (i32.store
              (i32.const 4528)
              (i32.const 0)
             )
             (i32.store
              (i32.const 4480)
              (i32.const 0)
             )
             (i32.store
              (i32.const 4508)
              (i32.xor
               (i32.and
                (local.get $14)
                (i32.const -16)
               )
               (i32.const 1431655768)
              )
             )
             (i32.const 4096)
            )
           )
          )
         )
        )
        (local.tee $7
         (i32.sub
          (i32.const 0)
          (local.get $0)
         )
        )
       )
      )
      (local.get $3)
     )
     (block
      (global.set $STACKTOP
       (local.get $14)
      )
      (return
       (i32.const 0)
      )
     )
    )
    (if
     (local.tee $0
      (i32.load
       (i32.const 4476)
      )
     )
     (if
      (i32.or
       (i32.le_u
        (local.tee $10
         (i32.add
          (local.get $4)
          (local.tee $2
           (i32.load
            (i32.const 4468)
           )
          )
         )
        )
        (local.get $2)
       )
       (i32.gt_u
        (local.get $10)
        (local.get $0)
       )
      )
      (block
       (global.set $STACKTOP
        (local.get $14)
       )
       (return
        (i32.const 0)
       )
      )
     )
    )
    (local.set $10
     (i32.add
      (local.get $3)
      (i32.const 48)
     )
    )
    (block $__rjto$7
     (block $__rjti$7
      (if
       (i32.and
        (i32.load
         (i32.const 4480)
        )
        (i32.const 4)
       )
       (local.set $1
        (i32.const 0)
       )
       (block
        (block $do-once37
         (block $__rjti$3
          (block $__rjti$2
           (br_if $__rjti$2
            (i32.eqz
             (local.tee $0
              (i32.load
               (i32.const 4060)
              )
             )
            )
           )
           (local.set $2
            (i32.const 4484)
           )
           (loop $while-in34
            (block $while-out33
             (if
              (i32.le_u
               (local.tee $13
                (i32.load
                 (local.get $2)
                )
               )
               (local.get $0)
              )
              (br_if $while-out33
               (i32.gt_u
                (i32.add
                 (local.get $13)
                 (i32.load offset=4
                  (local.get $2)
                 )
                )
                (local.get $0)
               )
              )
             )
             (br_if $while-in34
              (local.tee $2
               (i32.load offset=8
                (local.get $2)
               )
              )
             )
             (br $__rjti$2)
            )
           )
           (if
            (i32.lt_u
             (local.tee $1
              (i32.and
               (local.get $7)
               (i32.sub
                (local.get $5)
                (local.get $1)
               )
              )
             )
             (i32.const 2147483647)
            )
            (block
             (local.set $5
              (i32.add
               (local.get $2)
               (i32.const 4)
              )
             )
             (br_if $__rjti$3
              (i32.ne
               (local.tee $0
                (call $_sbrk
                 (local.get $1)
                )
               )
               (i32.add
                (i32.load
                 (local.get $2)
                )
                (i32.load
                 (local.get $5)
                )
               )
              )
             )
             (br_if $__rjti$7
              (i32.ne
               (local.get $0)
               (i32.const -1)
              )
             )
            )
            (local.set $1
             (i32.const 0)
            )
           )
           (br $do-once37)
          )
          (local.set $1
           (if (result i32)
            (i32.eq
             (local.tee $0
              (call $_sbrk
               (i32.const 0)
              )
             )
             (i32.const -1)
            )
            (i32.const 0)
            (block (result i32)
             (local.set $2
              (i32.add
               (local.tee $5
                (i32.load
                 (i32.const 4468)
                )
               )
               (local.tee $1
                (i32.add
                 (local.get $4)
                 (select
                  (i32.sub
                   (i32.and
                    (i32.add
                     (local.get $0)
                     (local.tee $2
                      (i32.add
                       (local.tee $1
                        (i32.load
                         (i32.const 4512)
                        )
                       )
                       (i32.const -1)
                      )
                     )
                    )
                    (i32.sub
                     (i32.const 0)
                     (local.get $1)
                    )
                   )
                   (local.get $0)
                  )
                  (i32.const 0)
                  (i32.and
                   (local.get $0)
                   (local.get $2)
                  )
                 )
                )
               )
              )
             )
             (if (result i32)
              (i32.and
               (i32.lt_u
                (local.get $1)
                (i32.const 2147483647)
               )
               (i32.gt_u
                (local.get $1)
                (local.get $3)
               )
              )
              (block
               (if
                (local.tee $7
                 (i32.load
                  (i32.const 4476)
                 )
                )
                (if
                 (i32.or
                  (i32.le_u
                   (local.get $2)
                   (local.get $5)
                  )
                  (i32.gt_u
                   (local.get $2)
                   (local.get $7)
                  )
                 )
                 (block
                  (local.set $1
                   (i32.const 0)
                  )
                  (br $do-once37)
                 )
                )
               )
               (br_if $__rjti$7
                (i32.eq
                 (local.get $0)
                 (local.tee $2
                  (call $_sbrk
                   (local.get $1)
                  )
                 )
                )
               )
               (local.set $0
                (local.get $2)
               )
               (br $__rjti$3)
              )
              (i32.const 0)
             )
            )
           )
          )
          (br $do-once37)
         )
         (if
          (i32.eqz
           (i32.and
            (i32.and
             (i32.ne
              (local.get $0)
              (i32.const -1)
             )
             (i32.lt_u
              (local.get $1)
              (i32.const 2147483647)
             )
            )
            (i32.gt_u
             (local.get $10)
             (local.get $1)
            )
           )
          )
          (if
           (i32.eq
            (local.get $0)
            (i32.const -1)
           )
           (block
            (local.set $1
             (i32.const 0)
            )
            (br $do-once37)
           )
           (br $__rjti$7)
          )
         )
         (br_if $__rjti$7
          (i32.ge_u
           (local.tee $2
            (i32.and
             (i32.add
              (local.tee $2
               (i32.load
                (i32.const 4516)
               )
              )
              (i32.sub
               (local.get $6)
               (local.get $1)
              )
             )
             (i32.sub
              (i32.const 0)
              (local.get $2)
             )
            )
           )
           (i32.const 2147483647)
          )
         )
         (local.set $6
          (i32.sub
           (i32.const 0)
           (local.get $1)
          )
         )
         (local.set $1
          (if (result i32)
           (i32.eq
            (call $_sbrk
             (local.get $2)
            )
            (i32.const -1)
           )
           (block (result i32)
            (drop
             (call $_sbrk
              (local.get $6)
             )
            )
            (i32.const 0)
           )
           (block
            (local.set $1
             (i32.add
              (local.get $1)
              (local.get $2)
             )
            )
            (br $__rjti$7)
           )
          )
         )
        )
        (i32.store
         (i32.const 4480)
         (i32.or
          (i32.load
           (i32.const 4480)
          )
          (i32.const 4)
         )
        )
       )
      )
      (if
       (i32.lt_u
        (local.get $4)
        (i32.const 2147483647)
       )
       (block
        (local.set $0
         (call $_sbrk
          (local.get $4)
         )
        )
        (local.set $4
         (i32.gt_u
          (local.tee $6
           (i32.sub
            (local.tee $2
             (call $_sbrk
              (i32.const 0)
             )
            )
            (local.get $0)
           )
          )
          (i32.add
           (local.get $3)
           (i32.const 40)
          )
         )
        )
        (local.set $1
         (select
          (local.get $6)
          (local.get $1)
          (local.get $4)
         )
        )
        (br_if $__rjti$7
         (i32.eqz
          (i32.or
           (i32.or
            (i32.xor
             (local.get $4)
             (i32.const 1)
            )
            (i32.eq
             (local.get $0)
             (i32.const -1)
            )
           )
           (i32.xor
            (i32.and
             (i32.and
              (i32.ne
               (local.get $0)
               (i32.const -1)
              )
              (i32.ne
               (local.get $2)
               (i32.const -1)
              )
             )
             (i32.lt_u
              (local.get $0)
              (local.get $2)
             )
            )
            (i32.const 1)
           )
          )
         )
        )
       )
      )
      (br $__rjto$7)
     )
     (i32.store
      (i32.const 4468)
      (local.tee $2
       (i32.add
        (local.get $1)
        (i32.load
         (i32.const 4468)
        )
       )
      )
     )
     (if
      (i32.gt_u
       (local.get $2)
       (i32.load
        (i32.const 4472)
       )
      )
      (i32.store
       (i32.const 4472)
       (local.get $2)
      )
     )
     (if
      (local.tee $6
       (i32.load
        (i32.const 4060)
       )
      )
      (block $label$break$L294
       (local.set $2
        (i32.const 4484)
       )
       (block $__rjto$4
        (block $__rjti$4
         (loop $while-in41
          (br_if $__rjti$4
           (i32.eq
            (local.get $0)
            (i32.add
             (local.tee $4
              (i32.load
               (local.get $2)
              )
             )
             (local.tee $5
              (i32.load offset=4
               (local.get $2)
              )
             )
            )
           )
          )
          (br_if $while-in41
           (local.tee $2
            (i32.load offset=8
             (local.get $2)
            )
           )
          )
         )
         (br $__rjto$4)
        )
        (local.set $7
         (i32.add
          (local.get $2)
          (i32.const 4)
         )
        )
        (if
         (i32.eqz
          (i32.and
           (i32.load offset=12
            (local.get $2)
           )
           (i32.const 8)
          )
         )
         (if
          (i32.and
           (i32.le_u
            (local.get $4)
            (local.get $6)
           )
           (i32.gt_u
            (local.get $0)
            (local.get $6)
           )
          )
          (block
           (i32.store
            (local.get $7)
            (i32.add
             (local.get $1)
             (local.get $5)
            )
           )
           (local.set $0
            (i32.add
             (local.get $6)
             (local.tee $2
              (select
               (i32.and
                (i32.sub
                 (i32.const 0)
                 (local.tee $0
                  (i32.add
                   (local.get $6)
                   (i32.const 8)
                  )
                 )
                )
                (i32.const 7)
               )
               (i32.const 0)
               (i32.and
                (local.get $0)
                (i32.const 7)
               )
              )
             )
            )
           )
           (local.set $1
            (i32.sub
             (local.tee $4
              (i32.add
               (local.get $1)
               (i32.load
                (i32.const 4048)
               )
              )
             )
             (local.get $2)
            )
           )
           (i32.store
            (i32.const 4060)
            (local.get $0)
           )
           (i32.store
            (i32.const 4048)
            (local.get $1)
           )
           (i32.store offset=4
            (local.get $0)
            (i32.or
             (local.get $1)
             (i32.const 1)
            )
           )
           (i32.store offset=4
            (i32.add
             (local.get $4)
             (local.get $6)
            )
            (i32.const 40)
           )
           (i32.store
            (i32.const 4064)
            (i32.load
             (i32.const 4524)
            )
           )
           (br $label$break$L294)
          )
         )
        )
       )
       (if
        (i32.lt_u
         (local.get $0)
         (local.tee $2
          (i32.load
           (i32.const 4052)
          )
         )
        )
        (block
         (i32.store
          (i32.const 4052)
          (local.get $0)
         )
         (local.set $2
          (local.get $0)
         )
        )
       )
       (local.set $5
        (i32.add
         (local.get $0)
         (local.get $1)
        )
       )
       (local.set $4
        (i32.const 4484)
       )
       (block $__rjto$5
        (block $__rjti$5
         (loop $while-in43
          (br_if $__rjti$5
           (i32.eq
            (local.get $5)
            (i32.load
             (local.get $4)
            )
           )
          )
          (br_if $while-in43
           (local.tee $4
            (i32.load offset=8
             (local.get $4)
            )
           )
          )
         )
         (br $__rjto$5)
        )
        (if
         (i32.eqz
          (i32.and
           (i32.load offset=12
            (local.get $4)
           )
           (i32.const 8)
          )
         )
         (block
          (i32.store
           (local.get $4)
           (local.get $0)
          )
          (i32.store
           (local.tee $4
            (i32.add
             (local.get $4)
             (i32.const 4)
            )
           )
           (i32.add
            (local.get $1)
            (i32.load
             (local.get $4)
            )
           )
          )
          (local.set $7
           (i32.add
            (local.get $3)
            (local.tee $8
             (i32.add
              (local.get $0)
              (select
               (i32.and
                (i32.sub
                 (i32.const 0)
                 (local.tee $0
                  (i32.add
                   (local.get $0)
                   (i32.const 8)
                  )
                 )
                )
                (i32.const 7)
               )
               (i32.const 0)
               (i32.and
                (local.get $0)
                (i32.const 7)
               )
              )
             )
            )
           )
          )
          (local.set $4
           (i32.sub
            (i32.sub
             (local.tee $1
              (i32.add
               (local.get $5)
               (select
                (i32.and
                 (i32.sub
                  (i32.const 0)
                  (local.tee $0
                   (i32.add
                    (local.get $5)
                    (i32.const 8)
                   )
                  )
                 )
                 (i32.const 7)
                )
                (i32.const 0)
                (i32.and
                 (local.get $0)
                 (i32.const 7)
                )
               )
              )
             )
             (local.get $8)
            )
            (local.get $3)
           )
          )
          (i32.store offset=4
           (local.get $8)
           (i32.or
            (local.get $3)
            (i32.const 3)
           )
          )
          (if
           (i32.eq
            (local.get $1)
            (local.get $6)
           )
           (block
            (i32.store
             (i32.const 4048)
             (local.tee $0
              (i32.add
               (local.get $4)
               (i32.load
                (i32.const 4048)
               )
              )
             )
            )
            (i32.store
             (i32.const 4060)
             (local.get $7)
            )
            (i32.store offset=4
             (local.get $7)
             (i32.or
              (local.get $0)
              (i32.const 1)
             )
            )
           )
           (block $label$break$L317
            (if
             (i32.eq
              (local.get $1)
              (i32.load
               (i32.const 4056)
              )
             )
             (block
              (i32.store
               (i32.const 4044)
               (local.tee $0
                (i32.add
                 (local.get $4)
                 (i32.load
                  (i32.const 4044)
                 )
                )
               )
              )
              (i32.store
               (i32.const 4056)
               (local.get $7)
              )
              (i32.store offset=4
               (local.get $7)
               (i32.or
                (local.get $0)
                (i32.const 1)
               )
              )
              (i32.store
               (i32.add
                (local.get $0)
                (local.get $7)
               )
               (local.get $0)
              )
              (br $label$break$L317)
             )
            )
            (local.set $2
             (if (result i32)
              (i32.eq
               (i32.and
                (local.tee $0
                 (i32.load offset=4
                  (local.get $1)
                 )
                )
                (i32.const 3)
               )
               (i32.const 1)
              )
              (block (result i32)
               (local.set $13
                (i32.and
                 (local.get $0)
                 (i32.const -8)
                )
               )
               (local.set $5
                (i32.shr_u
                 (local.get $0)
                 (i32.const 3)
                )
               )
               (block $label$break$L325
                (if
                 (i32.lt_u
                  (local.get $0)
                  (i32.const 256)
                 )
                 (block
                  (local.set $3
                   (i32.load offset=12
                    (local.get $1)
                   )
                  )
                  (if
                   (i32.ne
                    (local.tee $6
                     (i32.load offset=8
                      (local.get $1)
                     )
                    )
                    (local.tee $0
                     (i32.add
                      (i32.shl
                       (local.get $5)
                       (i32.const 3)
                      )
                      (i32.const 4076)
                     )
                    )
                   )
                   (block $do-once46
                    (if
                     (i32.gt_u
                      (local.get $2)
                      (local.get $6)
                     )
                     (call $_abort)
                    )
                    (br_if $do-once46
                     (i32.eq
                      (local.get $1)
                      (i32.load offset=12
                       (local.get $6)
                      )
                     )
                    )
                    (call $_abort)
                   )
                  )
                  (if
                   (i32.eq
                    (local.get $3)
                    (local.get $6)
                   )
                   (block
                    (i32.store
                     (i32.const 4036)
                     (i32.and
                      (i32.load
                       (i32.const 4036)
                      )
                      (i32.xor
                       (i32.shl
                        (i32.const 1)
                        (local.get $5)
                       )
                       (i32.const -1)
                      )
                     )
                    )
                    (br $label$break$L325)
                   )
                  )
                  (if
                   (i32.eq
                    (local.get $0)
                    (local.get $3)
                   )
                   (local.set $20
                    (i32.add
                     (local.get $3)
                     (i32.const 8)
                    )
                   )
                   (block $do-once48
                    (if
                     (i32.gt_u
                      (local.get $2)
                      (local.get $3)
                     )
                     (call $_abort)
                    )
                    (if
                     (i32.eq
                      (local.get $1)
                      (i32.load
                       (local.tee $0
                        (i32.add
                         (local.get $3)
                         (i32.const 8)
                        )
                       )
                      )
                     )
                     (block
                      (local.set $20
                       (local.get $0)
                      )
                      (br $do-once48)
                     )
                    )
                    (call $_abort)
                   )
                  )
                  (i32.store offset=12
                   (local.get $6)
                   (local.get $3)
                  )
                  (i32.store
                   (local.get $20)
                   (local.get $6)
                  )
                 )
                 (block
                  (local.set $10
                   (i32.load offset=24
                    (local.get $1)
                   )
                  )
                  (if
                   (i32.eq
                    (local.get $1)
                    (local.tee $0
                     (i32.load offset=12
                      (local.get $1)
                     )
                    )
                   )
                   (block $do-once50
                    (if
                     (local.tee $0
                      (i32.load
                       (local.tee $6
                        (i32.add
                         (local.tee $3
                          (i32.add
                           (local.get $1)
                           (i32.const 16)
                          )
                         )
                         (i32.const 4)
                        )
                       )
                      )
                     )
                     (local.set $3
                      (local.get $6)
                     )
                     (br_if $do-once50
                      (i32.eqz
                       (local.tee $0
                        (i32.load
                         (local.get $3)
                        )
                       )
                      )
                     )
                    )
                    (loop $while-in53
                     (block $while-out52
                      (if
                       (i32.eqz
                        (local.tee $5
                         (i32.load
                          (local.tee $6
                           (i32.add
                            (local.get $0)
                            (i32.const 20)
                           )
                          )
                         )
                        )
                       )
                       (br_if $while-out52
                        (i32.eqz
                         (local.tee $5
                          (i32.load
                           (local.tee $6
                            (i32.add
                             (local.get $0)
                             (i32.const 16)
                            )
                           )
                          )
                         )
                        )
                       )
                      )
                      (local.set $3
                       (local.get $6)
                      )
                      (local.set $0
                       (local.get $5)
                      )
                      (br $while-in53)
                     )
                    )
                    (if
                     (i32.gt_u
                      (local.get $2)
                      (local.get $3)
                     )
                     (call $_abort)
                     (block
                      (i32.store
                       (local.get $3)
                       (i32.const 0)
                      )
                      (local.set $9
                       (local.get $0)
                      )
                     )
                    )
                   )
                   (block
                    (if
                     (i32.gt_u
                      (local.get $2)
                      (local.tee $3
                       (i32.load offset=8
                        (local.get $1)
                       )
                      )
                     )
                     (call $_abort)
                    )
                    (if
                     (i32.ne
                      (i32.load
                       (local.tee $2
                        (i32.add
                         (local.get $3)
                         (i32.const 12)
                        )
                       )
                      )
                      (local.get $1)
                     )
                     (call $_abort)
                    )
                    (if
                     (i32.eq
                      (local.get $1)
                      (i32.load
                       (local.tee $6
                        (i32.add
                         (local.get $0)
                         (i32.const 8)
                        )
                       )
                      )
                     )
                     (block
                      (i32.store
                       (local.get $2)
                       (local.get $0)
                      )
                      (i32.store
                       (local.get $6)
                       (local.get $3)
                      )
                      (local.set $9
                       (local.get $0)
                      )
                     )
                     (call $_abort)
                    )
                   )
                  )
                  (br_if $label$break$L325
                   (i32.eqz
                    (local.get $10)
                   )
                  )
                  (if
                   (i32.eq
                    (local.get $1)
                    (i32.load
                     (local.tee $3
                      (i32.add
                       (i32.shl
                        (local.tee $0
                         (i32.load offset=28
                          (local.get $1)
                         )
                        )
                        (i32.const 2)
                       )
                       (i32.const 4340)
                      )
                     )
                    )
                   )
                   (block $do-once54
                    (i32.store
                     (local.get $3)
                     (local.get $9)
                    )
                    (br_if $do-once54
                     (local.get $9)
                    )
                    (i32.store
                     (i32.const 4040)
                     (i32.and
                      (i32.load
                       (i32.const 4040)
                      )
                      (i32.xor
                       (i32.shl
                        (i32.const 1)
                        (local.get $0)
                       )
                       (i32.const -1)
                      )
                     )
                    )
                    (br $label$break$L325)
                   )
                   (if
                    (i32.gt_u
                     (i32.load
                      (i32.const 4052)
                     )
                     (local.get $10)
                    )
                    (call $_abort)
                    (block
                     (i32.store
                      (select
                       (local.tee $0
                        (i32.add
                         (local.get $10)
                         (i32.const 16)
                        )
                       )
                       (i32.add
                        (local.get $10)
                        (i32.const 20)
                       )
                       (i32.eq
                        (local.get $1)
                        (i32.load
                         (local.get $0)
                        )
                       )
                      )
                      (local.get $9)
                     )
                     (br_if $label$break$L325
                      (i32.eqz
                       (local.get $9)
                      )
                     )
                    )
                   )
                  )
                  (if
                   (i32.gt_u
                    (local.tee $3
                     (i32.load
                      (i32.const 4052)
                     )
                    )
                    (local.get $9)
                   )
                   (call $_abort)
                  )
                  (i32.store offset=24
                   (local.get $9)
                   (local.get $10)
                  )
                  (if
                   (local.tee $0
                    (i32.load
                     (local.tee $2
                      (i32.add
                       (local.get $1)
                       (i32.const 16)
                      )
                     )
                    )
                   )
                   (if
                    (i32.gt_u
                     (local.get $3)
                     (local.get $0)
                    )
                    (call $_abort)
                    (block
                     (i32.store offset=16
                      (local.get $9)
                      (local.get $0)
                     )
                     (i32.store offset=24
                      (local.get $0)
                      (local.get $9)
                     )
                    )
                   )
                  )
                  (br_if $label$break$L325
                   (i32.eqz
                    (local.tee $0
                     (i32.load offset=4
                      (local.get $2)
                     )
                    )
                   )
                  )
                  (if
                   (i32.gt_u
                    (i32.load
                     (i32.const 4052)
                    )
                    (local.get $0)
                   )
                   (call $_abort)
                   (block
                    (i32.store offset=20
                     (local.get $9)
                     (local.get $0)
                    )
                    (i32.store offset=24
                     (local.get $0)
                     (local.get $9)
                    )
                   )
                  )
                 )
                )
               )
               (local.set $1
                (i32.add
                 (local.get $1)
                 (local.get $13)
                )
               )
               (i32.add
                (local.get $4)
                (local.get $13)
               )
              )
              (local.get $4)
             )
            )
            (i32.store
             (local.tee $0
              (i32.add
               (local.get $1)
               (i32.const 4)
              )
             )
             (i32.and
              (i32.load
               (local.get $0)
              )
              (i32.const -2)
             )
            )
            (i32.store offset=4
             (local.get $7)
             (i32.or
              (local.get $2)
              (i32.const 1)
             )
            )
            (i32.store
             (i32.add
              (local.get $2)
              (local.get $7)
             )
             (local.get $2)
            )
            (local.set $3
             (i32.shr_u
              (local.get $2)
              (i32.const 3)
             )
            )
            (if
             (i32.lt_u
              (local.get $2)
              (i32.const 256)
             )
             (block
              (local.set $0
               (i32.add
                (i32.shl
                 (local.get $3)
                 (i32.const 3)
                )
                (i32.const 4076)
               )
              )
              (if
               (i32.and
                (local.tee $1
                 (i32.load
                  (i32.const 4036)
                 )
                )
                (local.tee $3
                 (i32.shl
                  (i32.const 1)
                  (local.get $3)
                 )
                )
               )
               (block $do-once58
                (if
                 (i32.le_u
                  (i32.load
                   (i32.const 4052)
                  )
                  (local.tee $1
                   (i32.load
                    (local.tee $3
                     (i32.add
                      (local.get $0)
                      (i32.const 8)
                     )
                    )
                   )
                  )
                 )
                 (block
                  (local.set $15
                   (local.get $1)
                  )
                  (local.set $21
                   (local.get $3)
                  )
                  (br $do-once58)
                 )
                )
                (call $_abort)
               )
               (block
                (i32.store
                 (i32.const 4036)
                 (i32.or
                  (local.get $1)
                  (local.get $3)
                 )
                )
                (local.set $15
                 (local.get $0)
                )
                (local.set $21
                 (i32.add
                  (local.get $0)
                  (i32.const 8)
                 )
                )
               )
              )
              (i32.store
               (local.get $21)
               (local.get $7)
              )
              (i32.store offset=12
               (local.get $15)
               (local.get $7)
              )
              (i32.store offset=8
               (local.get $7)
               (local.get $15)
              )
              (i32.store offset=12
               (local.get $7)
               (local.get $0)
              )
              (br $label$break$L317)
             )
            )
            (local.set $0
             (i32.add
              (i32.shl
               (local.tee $3
                (if (result i32)
                 (local.tee $0
                  (i32.shr_u
                   (local.get $2)
                   (i32.const 8)
                  )
                 )
                 (if (result i32)
                  (i32.gt_u
                   (local.get $2)
                   (i32.const 16777215)
                  )
                  (i32.const 31)
                  (block (result i32)
                   (local.set $0
                    (i32.and
                     (i32.shr_u
                      (i32.add
                       (local.tee $1
                        (i32.shl
                         (local.get $0)
                         (local.tee $3
                          (i32.and
                           (i32.shr_u
                            (i32.add
                             (local.get $0)
                             (i32.const 1048320)
                            )
                            (i32.const 16)
                           )
                           (i32.const 8)
                          )
                         )
                        )
                       )
                       (i32.const 520192)
                      )
                      (i32.const 16)
                     )
                     (i32.const 4)
                    )
                   )
                   (i32.or
                    (i32.shl
                     (local.tee $0
                      (i32.add
                       (i32.sub
                        (i32.const 14)
                        (i32.or
                         (i32.or
                          (local.get $0)
                          (local.get $3)
                         )
                         (local.tee $3
                          (i32.and
                           (i32.shr_u
                            (i32.add
                             (local.tee $0
                              (i32.shl
                               (local.get $1)
                               (local.get $0)
                              )
                             )
                             (i32.const 245760)
                            )
                            (i32.const 16)
                           )
                           (i32.const 2)
                          )
                         )
                        )
                       )
                       (i32.shr_u
                        (i32.shl
                         (local.get $0)
                         (local.get $3)
                        )
                        (i32.const 15)
                       )
                      )
                     )
                     (i32.const 1)
                    )
                    (i32.and
                     (i32.shr_u
                      (local.get $2)
                      (i32.add
                       (local.get $0)
                       (i32.const 7)
                      )
                     )
                     (i32.const 1)
                    )
                   )
                  )
                 )
                 (i32.const 0)
                )
               )
               (i32.const 2)
              )
              (i32.const 4340)
             )
            )
            (i32.store offset=28
             (local.get $7)
             (local.get $3)
            )
            (i32.store offset=4
             (local.tee $1
              (i32.add
               (local.get $7)
               (i32.const 16)
              )
             )
             (i32.const 0)
            )
            (i32.store
             (local.get $1)
             (i32.const 0)
            )
            (if
             (i32.eqz
              (i32.and
               (local.tee $1
                (i32.load
                 (i32.const 4040)
                )
               )
               (local.tee $4
                (i32.shl
                 (i32.const 1)
                 (local.get $3)
                )
               )
              )
             )
             (block
              (i32.store
               (i32.const 4040)
               (i32.or
                (local.get $1)
                (local.get $4)
               )
              )
              (i32.store
               (local.get $0)
               (local.get $7)
              )
              (i32.store offset=24
               (local.get $7)
               (local.get $0)
              )
              (i32.store offset=12
               (local.get $7)
               (local.get $7)
              )
              (i32.store offset=8
               (local.get $7)
               (local.get $7)
              )
              (br $label$break$L317)
             )
            )
            (if
             (i32.eq
              (local.get $2)
              (i32.and
               (i32.load offset=4
                (local.tee $0
                 (i32.load
                  (local.get $0)
                 )
                )
               )
               (i32.const -8)
              )
             )
             (local.set $11
              (local.get $0)
             )
             (block $label$break$L410
              (local.set $1
               (i32.shl
                (local.get $2)
                (select
                 (i32.const 0)
                 (i32.sub
                  (i32.const 25)
                  (i32.shr_u
                   (local.get $3)
                   (i32.const 1)
                  )
                 )
                 (i32.eq
                  (local.get $3)
                  (i32.const 31)
                 )
                )
               )
              )
              (loop $while-in64
               (if
                (local.tee $3
                 (i32.load
                  (local.tee $4
                   (i32.add
                    (i32.add
                     (local.get $0)
                     (i32.const 16)
                    )
                    (i32.shl
                     (i32.shr_u
                      (local.get $1)
                      (i32.const 31)
                     )
                     (i32.const 2)
                    )
                   )
                  )
                 )
                )
                (block
                 (local.set $1
                  (i32.shl
                   (local.get $1)
                   (i32.const 1)
                  )
                 )
                 (if
                  (i32.eq
                   (local.get $2)
                   (i32.and
                    (i32.load offset=4
                     (local.get $3)
                    )
                    (i32.const -8)
                   )
                  )
                  (block
                   (local.set $11
                    (local.get $3)
                   )
                   (br $label$break$L410)
                  )
                  (block
                   (local.set $0
                    (local.get $3)
                   )
                   (br $while-in64)
                  )
                 )
                )
               )
              )
              (if
               (i32.gt_u
                (i32.load
                 (i32.const 4052)
                )
                (local.get $4)
               )
               (call $_abort)
               (block
                (i32.store
                 (local.get $4)
                 (local.get $7)
                )
                (i32.store offset=24
                 (local.get $7)
                 (local.get $0)
                )
                (i32.store offset=12
                 (local.get $7)
                 (local.get $7)
                )
                (i32.store offset=8
                 (local.get $7)
                 (local.get $7)
                )
                (br $label$break$L317)
               )
              )
             )
            )
            (if
             (i32.and
              (i32.le_u
               (local.tee $0
                (i32.load
                 (i32.const 4052)
                )
               )
               (local.get $11)
              )
              (i32.le_u
               (local.get $0)
               (local.tee $0
                (i32.load
                 (local.tee $3
                  (i32.add
                   (local.get $11)
                   (i32.const 8)
                  )
                 )
                )
               )
              )
             )
             (block
              (i32.store offset=12
               (local.get $0)
               (local.get $7)
              )
              (i32.store
               (local.get $3)
               (local.get $7)
              )
              (i32.store offset=8
               (local.get $7)
               (local.get $0)
              )
              (i32.store offset=12
               (local.get $7)
               (local.get $11)
              )
              (i32.store offset=24
               (local.get $7)
               (i32.const 0)
              )
             )
             (call $_abort)
            )
           )
          )
          (global.set $STACKTOP
           (local.get $14)
          )
          (return
           (i32.add
            (local.get $8)
            (i32.const 8)
           )
          )
         )
        )
       )
       (local.set $2
        (i32.const 4484)
       )
       (loop $while-in66
        (block $while-out65
         (if
          (i32.le_u
           (local.tee $4
            (i32.load
             (local.get $2)
            )
           )
           (local.get $6)
          )
          (br_if $while-out65
           (i32.gt_u
            (local.tee $5
             (i32.add
              (local.get $4)
              (i32.load offset=4
               (local.get $2)
              )
             )
            )
            (local.get $6)
           )
          )
         )
         (local.set $2
          (i32.load offset=8
           (local.get $2)
          )
         )
         (br $while-in66)
        )
       )
       (local.set $2
        (i32.add
         (local.tee $4
          (i32.add
           (local.get $5)
           (i32.const -47)
          )
         )
         (i32.const 8)
        )
       )
       (local.set $4
        (i32.add
         (local.tee $2
          (select
           (local.get $6)
           (local.tee $2
            (i32.add
             (local.get $4)
             (select
              (i32.and
               (i32.sub
                (i32.const 0)
                (local.get $2)
               )
               (i32.const 7)
              )
              (i32.const 0)
              (i32.and
               (local.get $2)
               (i32.const 7)
              )
             )
            )
           )
           (i32.lt_u
            (local.get $2)
            (local.tee $9
             (i32.add
              (local.get $6)
              (i32.const 16)
             )
            )
           )
          )
         )
         (i32.const 8)
        )
       )
       (i32.store
        (i32.const 4060)
        (local.tee $10
         (i32.add
          (local.get $0)
          (local.tee $7
           (select
            (i32.and
             (i32.sub
              (i32.const 0)
              (local.tee $7
               (i32.add
                (local.get $0)
                (i32.const 8)
               )
              )
             )
             (i32.const 7)
            )
            (i32.const 0)
            (i32.and
             (local.get $7)
             (i32.const 7)
            )
           )
          )
         )
        )
       )
       (i32.store
        (i32.const 4048)
        (local.tee $7
         (i32.sub
          (local.tee $11
           (i32.add
            (local.get $1)
            (i32.const -40)
           )
          )
          (local.get $7)
         )
        )
       )
       (i32.store offset=4
        (local.get $10)
        (i32.or
         (local.get $7)
         (i32.const 1)
        )
       )
       (i32.store offset=4
        (i32.add
         (local.get $0)
         (local.get $11)
        )
        (i32.const 40)
       )
       (i32.store
        (i32.const 4064)
        (i32.load
         (i32.const 4524)
        )
       )
       (i32.store
        (local.tee $7
         (i32.add
          (local.get $2)
          (i32.const 4)
         )
        )
        (i32.const 27)
       )
       (i64.store align=4
        (local.get $4)
        (i64.load align=4
         (i32.const 4484)
        )
       )
       (i64.store offset=8 align=4
        (local.get $4)
        (i64.load align=4
         (i32.const 4492)
        )
       )
       (i32.store
        (i32.const 4484)
        (local.get $0)
       )
       (i32.store
        (i32.const 4488)
        (local.get $1)
       )
       (i32.store
        (i32.const 4496)
        (i32.const 0)
       )
       (i32.store
        (i32.const 4492)
        (local.get $4)
       )
       (local.set $0
        (i32.add
         (local.get $2)
         (i32.const 24)
        )
       )
       (loop $while-in68
        (i32.store
         (local.tee $1
          (i32.add
           (local.get $0)
           (i32.const 4)
          )
         )
         (i32.const 7)
        )
        (if
         (i32.lt_u
          (i32.add
           (local.get $0)
           (i32.const 8)
          )
          (local.get $5)
         )
         (block
          (local.set $0
           (local.get $1)
          )
          (br $while-in68)
         )
        )
       )
       (if
        (i32.ne
         (local.get $2)
         (local.get $6)
        )
        (block
         (i32.store
          (local.get $7)
          (i32.and
           (i32.load
            (local.get $7)
           )
           (i32.const -2)
          )
         )
         (i32.store offset=4
          (local.get $6)
          (i32.or
           (local.tee $4
            (i32.sub
             (local.get $2)
             (local.get $6)
            )
           )
           (i32.const 1)
          )
         )
         (i32.store
          (local.get $2)
          (local.get $4)
         )
         (local.set $1
          (i32.shr_u
           (local.get $4)
           (i32.const 3)
          )
         )
         (if
          (i32.lt_u
           (local.get $4)
           (i32.const 256)
          )
          (block
           (local.set $0
            (i32.add
             (i32.shl
              (local.get $1)
              (i32.const 3)
             )
             (i32.const 4076)
            )
           )
           (if
            (i32.and
             (local.tee $2
              (i32.load
               (i32.const 4036)
              )
             )
             (local.tee $1
              (i32.shl
               (i32.const 1)
               (local.get $1)
              )
             )
            )
            (if
             (i32.gt_u
              (i32.load
               (i32.const 4052)
              )
              (local.tee $2
               (i32.load
                (local.tee $1
                 (i32.add
                  (local.get $0)
                  (i32.const 8)
                 )
                )
               )
              )
             )
             (call $_abort)
             (block
              (local.set $17
               (local.get $2)
              )
              (local.set $22
               (local.get $1)
              )
             )
            )
            (block
             (i32.store
              (i32.const 4036)
              (i32.or
               (local.get $1)
               (local.get $2)
              )
             )
             (local.set $17
              (local.get $0)
             )
             (local.set $22
              (i32.add
               (local.get $0)
               (i32.const 8)
              )
             )
            )
           )
           (i32.store
            (local.get $22)
            (local.get $6)
           )
           (i32.store offset=12
            (local.get $17)
            (local.get $6)
           )
           (i32.store offset=8
            (local.get $6)
            (local.get $17)
           )
           (i32.store offset=12
            (local.get $6)
            (local.get $0)
           )
           (br $label$break$L294)
          )
         )
         (local.set $0
          (i32.add
           (i32.shl
            (local.tee $1
             (if (result i32)
              (local.tee $0
               (i32.shr_u
                (local.get $4)
                (i32.const 8)
               )
              )
              (if (result i32)
               (i32.gt_u
                (local.get $4)
                (i32.const 16777215)
               )
               (i32.const 31)
               (block (result i32)
                (local.set $0
                 (i32.and
                  (i32.shr_u
                   (i32.add
                    (local.tee $2
                     (i32.shl
                      (local.get $0)
                      (local.tee $1
                       (i32.and
                        (i32.shr_u
                         (i32.add
                          (local.get $0)
                          (i32.const 1048320)
                         )
                         (i32.const 16)
                        )
                        (i32.const 8)
                       )
                      )
                     )
                    )
                    (i32.const 520192)
                   )
                   (i32.const 16)
                  )
                  (i32.const 4)
                 )
                )
                (i32.or
                 (i32.shl
                  (local.tee $0
                   (i32.add
                    (i32.sub
                     (i32.const 14)
                     (i32.or
                      (local.tee $5
                       (i32.and
                        (i32.shr_u
                         (i32.add
                          (local.tee $2
                           (i32.shl
                            (local.get $2)
                            (local.get $0)
                           )
                          )
                          (i32.const 245760)
                         )
                         (i32.const 16)
                        )
                        (i32.const 2)
                       )
                      )
                      (i32.or
                       (local.get $0)
                       (local.get $1)
                      )
                     )
                    )
                    (i32.shr_u
                     (i32.shl
                      (local.get $2)
                      (local.get $5)
                     )
                     (i32.const 15)
                    )
                   )
                  )
                  (i32.const 1)
                 )
                 (i32.and
                  (i32.shr_u
                   (local.get $4)
                   (i32.add
                    (local.get $0)
                    (i32.const 7)
                   )
                  )
                  (i32.const 1)
                 )
                )
               )
              )
              (i32.const 0)
             )
            )
            (i32.const 2)
           )
           (i32.const 4340)
          )
         )
         (i32.store offset=28
          (local.get $6)
          (local.get $1)
         )
         (i32.store offset=20
          (local.get $6)
          (i32.const 0)
         )
         (i32.store
          (local.get $9)
          (i32.const 0)
         )
         (if
          (i32.eqz
           (i32.and
            (local.tee $2
             (i32.load
              (i32.const 4040)
             )
            )
            (local.tee $5
             (i32.shl
              (i32.const 1)
              (local.get $1)
             )
            )
           )
          )
          (block
           (i32.store
            (i32.const 4040)
            (i32.or
             (local.get $2)
             (local.get $5)
            )
           )
           (i32.store
            (local.get $0)
            (local.get $6)
           )
           (i32.store offset=24
            (local.get $6)
            (local.get $0)
           )
           (i32.store offset=12
            (local.get $6)
            (local.get $6)
           )
           (i32.store offset=8
            (local.get $6)
            (local.get $6)
           )
           (br $label$break$L294)
          )
         )
         (if
          (i32.eq
           (i32.and
            (i32.load offset=4
             (local.tee $0
              (i32.load
               (local.get $0)
              )
             )
            )
            (i32.const -8)
           )
           (local.get $4)
          )
          (local.set $8
           (local.get $0)
          )
          (block $label$break$L451
           (local.set $2
            (i32.shl
             (local.get $4)
             (select
              (i32.const 0)
              (i32.sub
               (i32.const 25)
               (i32.shr_u
                (local.get $1)
                (i32.const 1)
               )
              )
              (i32.eq
               (local.get $1)
               (i32.const 31)
              )
             )
            )
           )
           (loop $while-in71
            (if
             (local.tee $1
              (i32.load
               (local.tee $5
                (i32.add
                 (i32.add
                  (local.get $0)
                  (i32.const 16)
                 )
                 (i32.shl
                  (i32.shr_u
                   (local.get $2)
                   (i32.const 31)
                  )
                  (i32.const 2)
                 )
                )
               )
              )
             )
             (block
              (local.set $2
               (i32.shl
                (local.get $2)
                (i32.const 1)
               )
              )
              (if
               (i32.eq
                (i32.and
                 (i32.load offset=4
                  (local.get $1)
                 )
                 (i32.const -8)
                )
                (local.get $4)
               )
               (block
                (local.set $8
                 (local.get $1)
                )
                (br $label$break$L451)
               )
               (block
                (local.set $0
                 (local.get $1)
                )
                (br $while-in71)
               )
              )
             )
            )
           )
           (if
            (i32.gt_u
             (i32.load
              (i32.const 4052)
             )
             (local.get $5)
            )
            (call $_abort)
            (block
             (i32.store
              (local.get $5)
              (local.get $6)
             )
             (i32.store offset=24
              (local.get $6)
              (local.get $0)
             )
             (i32.store offset=12
              (local.get $6)
              (local.get $6)
             )
             (i32.store offset=8
              (local.get $6)
              (local.get $6)
             )
             (br $label$break$L294)
            )
           )
          )
         )
         (if
          (i32.and
           (i32.le_u
            (local.tee $0
             (i32.load
              (i32.const 4052)
             )
            )
            (local.get $8)
           )
           (i32.le_u
            (local.get $0)
            (local.tee $0
             (i32.load
              (local.tee $1
               (i32.add
                (local.get $8)
                (i32.const 8)
               )
              )
             )
            )
           )
          )
          (block
           (i32.store offset=12
            (local.get $0)
            (local.get $6)
           )
           (i32.store
            (local.get $1)
            (local.get $6)
           )
           (i32.store offset=8
            (local.get $6)
            (local.get $0)
           )
           (i32.store offset=12
            (local.get $6)
            (local.get $8)
           )
           (i32.store offset=24
            (local.get $6)
            (i32.const 0)
           )
          )
          (call $_abort)
         )
        )
       )
      )
      (block
       (if
        (i32.or
         (i32.eqz
          (local.tee $2
           (i32.load
            (i32.const 4052)
           )
          )
         )
         (i32.lt_u
          (local.get $0)
          (local.get $2)
         )
        )
        (i32.store
         (i32.const 4052)
         (local.get $0)
        )
       )
       (i32.store
        (i32.const 4484)
        (local.get $0)
       )
       (i32.store
        (i32.const 4488)
        (local.get $1)
       )
       (i32.store
        (i32.const 4496)
        (i32.const 0)
       )
       (i32.store
        (i32.const 4072)
        (i32.load
         (i32.const 4508)
        )
       )
       (i32.store
        (i32.const 4068)
        (i32.const -1)
       )
       (i32.store
        (i32.const 4088)
        (i32.const 4076)
       )
       (i32.store
        (i32.const 4084)
        (i32.const 4076)
       )
       (i32.store
        (i32.const 4096)
        (i32.const 4084)
       )
       (i32.store
        (i32.const 4092)
        (i32.const 4084)
       )
       (i32.store
        (i32.const 4104)
        (i32.const 4092)
       )
       (i32.store
        (i32.const 4100)
        (i32.const 4092)
       )
       (i32.store
        (i32.const 4112)
        (i32.const 4100)
       )
       (i32.store
        (i32.const 4108)
        (i32.const 4100)
       )
       (i32.store
        (i32.const 4120)
        (i32.const 4108)
       )
       (i32.store
        (i32.const 4116)
        (i32.const 4108)
       )
       (i32.store
        (i32.const 4128)
        (i32.const 4116)
       )
       (i32.store
        (i32.const 4124)
        (i32.const 4116)
       )
       (i32.store
        (i32.const 4136)
        (i32.const 4124)
       )
       (i32.store
        (i32.const 4132)
        (i32.const 4124)
       )
       (i32.store
        (i32.const 4144)
        (i32.const 4132)
       )
       (i32.store
        (i32.const 4140)
        (i32.const 4132)
       )
       (i32.store
        (i32.const 4152)
        (i32.const 4140)
       )
       (i32.store
        (i32.const 4148)
        (i32.const 4140)
       )
       (i32.store
        (i32.const 4160)
        (i32.const 4148)
       )
       (i32.store
        (i32.const 4156)
        (i32.const 4148)
       )
       (i32.store
        (i32.const 4168)
        (i32.const 4156)
       )
       (i32.store
        (i32.const 4164)
        (i32.const 4156)
       )
       (i32.store
        (i32.const 4176)
        (i32.const 4164)
       )
       (i32.store
        (i32.const 4172)
        (i32.const 4164)
       )
       (i32.store
        (i32.const 4184)
        (i32.const 4172)
       )
       (i32.store
        (i32.const 4180)
        (i32.const 4172)
       )
       (i32.store
        (i32.const 4192)
        (i32.const 4180)
       )
       (i32.store
        (i32.const 4188)
        (i32.const 4180)
       )
       (i32.store
        (i32.const 4200)
        (i32.const 4188)
       )
       (i32.store
        (i32.const 4196)
        (i32.const 4188)
       )
       (i32.store
        (i32.const 4208)
        (i32.const 4196)
       )
       (i32.store
        (i32.const 4204)
        (i32.const 4196)
       )
       (i32.store
        (i32.const 4216)
        (i32.const 4204)
       )
       (i32.store
        (i32.const 4212)
        (i32.const 4204)
       )
       (i32.store
        (i32.const 4224)
        (i32.const 4212)
       )
       (i32.store
        (i32.const 4220)
        (i32.const 4212)
       )
       (i32.store
        (i32.const 4232)
        (i32.const 4220)
       )
       (i32.store
        (i32.const 4228)
        (i32.const 4220)
       )
       (i32.store
        (i32.const 4240)
        (i32.const 4228)
       )
       (i32.store
        (i32.const 4236)
        (i32.const 4228)
       )
       (i32.store
        (i32.const 4248)
        (i32.const 4236)
       )
       (i32.store
        (i32.const 4244)
        (i32.const 4236)
       )
       (i32.store
        (i32.const 4256)
        (i32.const 4244)
       )
       (i32.store
        (i32.const 4252)
        (i32.const 4244)
       )
       (i32.store
        (i32.const 4264)
        (i32.const 4252)
       )
       (i32.store
        (i32.const 4260)
        (i32.const 4252)
       )
       (i32.store
        (i32.const 4272)
        (i32.const 4260)
       )
       (i32.store
        (i32.const 4268)
        (i32.const 4260)
       )
       (i32.store
        (i32.const 4280)
        (i32.const 4268)
       )
       (i32.store
        (i32.const 4276)
        (i32.const 4268)
       )
       (i32.store
        (i32.const 4288)
        (i32.const 4276)
       )
       (i32.store
        (i32.const 4284)
        (i32.const 4276)
       )
       (i32.store
        (i32.const 4296)
        (i32.const 4284)
       )
       (i32.store
        (i32.const 4292)
        (i32.const 4284)
       )
       (i32.store
        (i32.const 4304)
        (i32.const 4292)
       )
       (i32.store
        (i32.const 4300)
        (i32.const 4292)
       )
       (i32.store
        (i32.const 4312)
        (i32.const 4300)
       )
       (i32.store
        (i32.const 4308)
        (i32.const 4300)
       )
       (i32.store
        (i32.const 4320)
        (i32.const 4308)
       )
       (i32.store
        (i32.const 4316)
        (i32.const 4308)
       )
       (i32.store
        (i32.const 4328)
        (i32.const 4316)
       )
       (i32.store
        (i32.const 4324)
        (i32.const 4316)
       )
       (i32.store
        (i32.const 4336)
        (i32.const 4324)
       )
       (i32.store
        (i32.const 4332)
        (i32.const 4324)
       )
       (i32.store
        (i32.const 4060)
        (local.tee $4
         (i32.add
          (local.get $0)
          (local.tee $2
           (select
            (i32.and
             (i32.sub
              (i32.const 0)
              (local.tee $2
               (i32.add
                (local.get $0)
                (i32.const 8)
               )
              )
             )
             (i32.const 7)
            )
            (i32.const 0)
            (i32.and
             (local.get $2)
             (i32.const 7)
            )
           )
          )
         )
        )
       )
       (i32.store
        (i32.const 4048)
        (local.tee $2
         (i32.sub
          (local.tee $1
           (i32.add
            (local.get $1)
            (i32.const -40)
           )
          )
          (local.get $2)
         )
        )
       )
       (i32.store offset=4
        (local.get $4)
        (i32.or
         (local.get $2)
         (i32.const 1)
        )
       )
       (i32.store offset=4
        (i32.add
         (local.get $0)
         (local.get $1)
        )
        (i32.const 40)
       )
       (i32.store
        (i32.const 4064)
        (i32.load
         (i32.const 4524)
        )
       )
      )
     )
     (if
      (i32.gt_u
       (local.tee $0
        (i32.load
         (i32.const 4048)
        )
       )
       (local.get $3)
      )
      (block
       (i32.store
        (i32.const 4048)
        (local.tee $1
         (i32.sub
          (local.get $0)
          (local.get $3)
         )
        )
       )
       (br $folding-inner0)
      )
     )
    )
    (i32.store
     (call $___errno_location)
     (i32.const 12)
    )
    (global.set $STACKTOP
     (local.get $14)
    )
    (return
     (i32.const 0)
    )
   )
   (i32.store
    (i32.const 4060)
    (local.tee $2
     (i32.add
      (local.get $3)
      (local.tee $0
       (i32.load
        (i32.const 4060)
       )
      )
     )
    )
   )
   (i32.store offset=4
    (local.get $2)
    (i32.or
     (local.get $1)
     (i32.const 1)
    )
   )
   (i32.store offset=4
    (local.get $0)
    (i32.or
     (local.get $3)
     (i32.const 3)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $14)
  )
  (i32.add
   (local.get $0)
   (i32.const 8)
  )
 )
 (func $_free (; 87 ;) (; has Stack IR ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (if
   (i32.eqz
    (local.get $0)
   )
   (return)
  )
  (if
   (i32.lt_u
    (local.tee $4
     (i32.add
      (local.get $0)
      (i32.const -8)
     )
    )
    (local.tee $12
     (i32.load
      (i32.const 4052)
     )
    )
   )
   (call $_abort)
  )
  (if
   (i32.eq
    (local.tee $11
     (i32.and
      (local.tee $0
       (i32.load
        (i32.add
         (local.get $0)
         (i32.const -4)
        )
       )
      )
      (i32.const 3)
     )
    )
    (i32.const 1)
   )
   (call $_abort)
  )
  (local.set $7
   (i32.add
    (local.get $4)
    (local.tee $2
     (i32.and
      (local.get $0)
      (i32.const -8)
     )
    )
   )
  )
  (if
   (i32.and
    (local.get $0)
    (i32.const 1)
   )
   (block
    (local.set $1
     (local.get $2)
    )
    (local.set $5
     (local.tee $3
      (local.get $4)
     )
    )
   )
   (block $label$break$L10
    (local.set $9
     (i32.load
      (local.get $4)
     )
    )
    (if
     (i32.eqz
      (local.get $11)
     )
     (return)
    )
    (if
     (i32.lt_u
      (local.tee $0
       (i32.sub
        (local.get $4)
        (local.get $9)
       )
      )
      (local.get $12)
     )
     (call $_abort)
    )
    (local.set $4
     (i32.add
      (local.get $2)
      (local.get $9)
     )
    )
    (if
     (i32.eq
      (local.get $0)
      (i32.load
       (i32.const 4056)
      )
     )
     (block
      (if
       (i32.ne
        (i32.and
         (local.tee $1
          (i32.load
           (local.tee $3
            (i32.add
             (local.get $7)
             (i32.const 4)
            )
           )
          )
         )
         (i32.const 3)
        )
        (i32.const 3)
       )
       (block
        (local.set $1
         (local.get $4)
        )
        (local.set $5
         (local.tee $3
          (local.get $0)
         )
        )
        (br $label$break$L10)
       )
      )
      (i32.store
       (i32.const 4044)
       (local.get $4)
      )
      (i32.store
       (local.get $3)
       (i32.and
        (local.get $1)
        (i32.const -2)
       )
      )
      (i32.store offset=4
       (local.get $0)
       (i32.or
        (local.get $4)
        (i32.const 1)
       )
      )
      (i32.store
       (i32.add
        (local.get $0)
        (local.get $4)
       )
       (local.get $4)
      )
      (return)
     )
    )
    (local.set $2
     (i32.shr_u
      (local.get $9)
      (i32.const 3)
     )
    )
    (if
     (i32.lt_u
      (local.get $9)
      (i32.const 256)
     )
     (block
      (local.set $1
       (i32.load offset=12
        (local.get $0)
       )
      )
      (if
       (i32.ne
        (local.tee $5
         (i32.load offset=8
          (local.get $0)
         )
        )
        (local.tee $3
         (i32.add
          (i32.shl
           (local.get $2)
           (i32.const 3)
          )
          (i32.const 4076)
         )
        )
       )
       (block
        (if
         (i32.gt_u
          (local.get $12)
          (local.get $5)
         )
         (call $_abort)
        )
        (if
         (i32.ne
          (i32.load offset=12
           (local.get $5)
          )
          (local.get $0)
         )
         (call $_abort)
        )
       )
      )
      (if
       (i32.eq
        (local.get $1)
        (local.get $5)
       )
       (block
        (i32.store
         (i32.const 4036)
         (i32.and
          (i32.load
           (i32.const 4036)
          )
          (i32.xor
           (i32.shl
            (i32.const 1)
            (local.get $2)
           )
           (i32.const -1)
          )
         )
        )
        (local.set $1
         (local.get $4)
        )
        (local.set $5
         (local.tee $3
          (local.get $0)
         )
        )
        (br $label$break$L10)
       )
      )
      (if
       (i32.eq
        (local.get $1)
        (local.get $3)
       )
       (local.set $6
        (i32.add
         (local.get $1)
         (i32.const 8)
        )
       )
       (block
        (if
         (i32.gt_u
          (local.get $12)
          (local.get $1)
         )
         (call $_abort)
        )
        (if
         (i32.eq
          (local.get $0)
          (i32.load
           (local.tee $3
            (i32.add
             (local.get $1)
             (i32.const 8)
            )
           )
          )
         )
         (local.set $6
          (local.get $3)
         )
         (call $_abort)
        )
       )
      )
      (i32.store offset=12
       (local.get $5)
       (local.get $1)
      )
      (i32.store
       (local.get $6)
       (local.get $5)
      )
      (local.set $1
       (local.get $4)
      )
      (local.set $5
       (local.tee $3
        (local.get $0)
       )
      )
      (br $label$break$L10)
     )
    )
    (local.set $13
     (i32.load offset=24
      (local.get $0)
     )
    )
    (if
     (i32.eq
      (local.get $0)
      (local.tee $2
       (i32.load offset=12
        (local.get $0)
       )
      )
     )
     (block $do-once
      (if
       (local.tee $2
        (i32.load
         (local.tee $9
          (i32.add
           (local.tee $6
            (i32.add
             (local.get $0)
             (i32.const 16)
            )
           )
           (i32.const 4)
          )
         )
        )
       )
       (local.set $6
        (local.get $9)
       )
       (br_if $do-once
        (i32.eqz
         (local.tee $2
          (i32.load
           (local.get $6)
          )
         )
        )
       )
      )
      (loop $while-in
       (block $while-out
        (if
         (i32.eqz
          (local.tee $11
           (i32.load
            (local.tee $9
             (i32.add
              (local.get $2)
              (i32.const 20)
             )
            )
           )
          )
         )
         (br_if $while-out
          (i32.eqz
           (local.tee $11
            (i32.load
             (local.tee $9
              (i32.add
               (local.get $2)
               (i32.const 16)
              )
             )
            )
           )
          )
         )
        )
        (local.set $6
         (local.get $9)
        )
        (local.set $2
         (local.get $11)
        )
        (br $while-in)
       )
      )
      (if
       (i32.gt_u
        (local.get $12)
        (local.get $6)
       )
       (call $_abort)
       (block
        (i32.store
         (local.get $6)
         (i32.const 0)
        )
        (local.set $8
         (local.get $2)
        )
       )
      )
     )
     (block
      (if
       (i32.gt_u
        (local.get $12)
        (local.tee $6
         (i32.load offset=8
          (local.get $0)
         )
        )
       )
       (call $_abort)
      )
      (if
       (i32.ne
        (i32.load
         (local.tee $9
          (i32.add
           (local.get $6)
           (i32.const 12)
          )
         )
        )
        (local.get $0)
       )
       (call $_abort)
      )
      (if
       (i32.eq
        (local.get $0)
        (i32.load
         (local.tee $11
          (i32.add
           (local.get $2)
           (i32.const 8)
          )
         )
        )
       )
       (block
        (i32.store
         (local.get $9)
         (local.get $2)
        )
        (i32.store
         (local.get $11)
         (local.get $6)
        )
        (local.set $8
         (local.get $2)
        )
       )
       (call $_abort)
      )
     )
    )
    (if
     (local.get $13)
     (block
      (if
       (i32.eq
        (local.get $0)
        (i32.load
         (local.tee $6
          (i32.add
           (i32.shl
            (local.tee $2
             (i32.load offset=28
              (local.get $0)
             )
            )
            (i32.const 2)
           )
           (i32.const 4340)
          )
         )
        )
       )
       (block
        (i32.store
         (local.get $6)
         (local.get $8)
        )
        (if
         (i32.eqz
          (local.get $8)
         )
         (block
          (i32.store
           (i32.const 4040)
           (i32.and
            (i32.load
             (i32.const 4040)
            )
            (i32.xor
             (i32.shl
              (i32.const 1)
              (local.get $2)
             )
             (i32.const -1)
            )
           )
          )
          (local.set $1
           (local.get $4)
          )
          (local.set $5
           (local.tee $3
            (local.get $0)
           )
          )
          (br $label$break$L10)
         )
        )
       )
       (if
        (i32.gt_u
         (i32.load
          (i32.const 4052)
         )
         (local.get $13)
        )
        (call $_abort)
        (block
         (i32.store
          (select
           (local.tee $2
            (i32.add
             (local.get $13)
             (i32.const 16)
            )
           )
           (i32.add
            (local.get $13)
            (i32.const 20)
           )
           (i32.eq
            (local.get $0)
            (i32.load
             (local.get $2)
            )
           )
          )
          (local.get $8)
         )
         (if
          (i32.eqz
           (local.get $8)
          )
          (block
           (local.set $1
            (local.get $4)
           )
           (local.set $5
            (local.tee $3
             (local.get $0)
            )
           )
           (br $label$break$L10)
          )
         )
        )
       )
      )
      (if
       (i32.gt_u
        (local.tee $6
         (i32.load
          (i32.const 4052)
         )
        )
        (local.get $8)
       )
       (call $_abort)
      )
      (i32.store offset=24
       (local.get $8)
       (local.get $13)
      )
      (if
       (local.tee $2
        (i32.load
         (local.tee $9
          (i32.add
           (local.get $0)
           (i32.const 16)
          )
         )
        )
       )
       (if
        (i32.gt_u
         (local.get $6)
         (local.get $2)
        )
        (call $_abort)
        (block
         (i32.store offset=16
          (local.get $8)
          (local.get $2)
         )
         (i32.store offset=24
          (local.get $2)
          (local.get $8)
         )
        )
       )
      )
      (if
       (local.tee $2
        (i32.load offset=4
         (local.get $9)
        )
       )
       (if
        (i32.gt_u
         (i32.load
          (i32.const 4052)
         )
         (local.get $2)
        )
        (call $_abort)
        (block
         (i32.store offset=20
          (local.get $8)
          (local.get $2)
         )
         (i32.store offset=24
          (local.get $2)
          (local.get $8)
         )
         (local.set $1
          (local.get $4)
         )
         (local.set $5
          (local.tee $3
           (local.get $0)
          )
         )
        )
       )
       (block
        (local.set $1
         (local.get $4)
        )
        (local.set $5
         (local.tee $3
          (local.get $0)
         )
        )
       )
      )
     )
     (block
      (local.set $1
       (local.get $4)
      )
      (local.set $5
       (local.tee $3
        (local.get $0)
       )
      )
     )
    )
   )
  )
  (if
   (i32.ge_u
    (local.get $5)
    (local.get $7)
   )
   (call $_abort)
  )
  (if
   (i32.eqz
    (i32.and
     (local.tee $0
      (i32.load
       (local.tee $4
        (i32.add
         (local.get $7)
         (i32.const 4)
        )
       )
      )
     )
     (i32.const 1)
    )
   )
   (call $_abort)
  )
  (local.set $1
   (i32.shr_u
    (local.tee $5
     (if (result i32)
      (i32.and
       (local.get $0)
       (i32.const 2)
      )
      (block (result i32)
       (i32.store
        (local.get $4)
        (i32.and
         (local.get $0)
         (i32.const -2)
        )
       )
       (i32.store offset=4
        (local.get $3)
        (i32.or
         (local.get $1)
         (i32.const 1)
        )
       )
       (i32.store
        (i32.add
         (local.get $1)
         (local.get $5)
        )
        (local.get $1)
       )
       (local.get $1)
      )
      (block (result i32)
       (if
        (i32.eq
         (local.get $7)
         (i32.load
          (i32.const 4060)
         )
        )
        (block
         (i32.store
          (i32.const 4048)
          (local.tee $0
           (i32.add
            (local.get $1)
            (i32.load
             (i32.const 4048)
            )
           )
          )
         )
         (i32.store
          (i32.const 4060)
          (local.get $3)
         )
         (i32.store offset=4
          (local.get $3)
          (i32.or
           (local.get $0)
           (i32.const 1)
          )
         )
         (if
          (i32.ne
           (i32.load
            (i32.const 4056)
           )
           (local.get $3)
          )
          (return)
         )
         (i32.store
          (i32.const 4056)
          (i32.const 0)
         )
         (i32.store
          (i32.const 4044)
          (i32.const 0)
         )
         (return)
        )
       )
       (if
        (i32.eq
         (local.get $7)
         (i32.load
          (i32.const 4056)
         )
        )
        (block
         (i32.store
          (i32.const 4044)
          (local.tee $0
           (i32.add
            (local.get $1)
            (i32.load
             (i32.const 4044)
            )
           )
          )
         )
         (i32.store
          (i32.const 4056)
          (local.get $5)
         )
         (i32.store offset=4
          (local.get $3)
          (i32.or
           (local.get $0)
           (i32.const 1)
          )
         )
         (i32.store
          (i32.add
           (local.get $0)
           (local.get $5)
          )
          (local.get $0)
         )
         (return)
        )
       )
       (local.set $4
        (i32.add
         (local.get $1)
         (i32.and
          (local.get $0)
          (i32.const -8)
         )
        )
       )
       (local.set $6
        (i32.shr_u
         (local.get $0)
         (i32.const 3)
        )
       )
       (block $label$break$L111
        (if
         (i32.lt_u
          (local.get $0)
          (i32.const 256)
         )
         (block
          (local.set $1
           (i32.load offset=12
            (local.get $7)
           )
          )
          (if
           (i32.ne
            (local.tee $2
             (i32.load offset=8
              (local.get $7)
             )
            )
            (local.tee $0
             (i32.add
              (i32.shl
               (local.get $6)
               (i32.const 3)
              )
              (i32.const 4076)
             )
            )
           )
           (block
            (if
             (i32.gt_u
              (i32.load
               (i32.const 4052)
              )
              (local.get $2)
             )
             (call $_abort)
            )
            (if
             (i32.ne
              (i32.load offset=12
               (local.get $2)
              )
              (local.get $7)
             )
             (call $_abort)
            )
           )
          )
          (if
           (i32.eq
            (local.get $1)
            (local.get $2)
           )
           (block
            (i32.store
             (i32.const 4036)
             (i32.and
              (i32.load
               (i32.const 4036)
              )
              (i32.xor
               (i32.shl
                (i32.const 1)
                (local.get $6)
               )
               (i32.const -1)
              )
             )
            )
            (br $label$break$L111)
           )
          )
          (if
           (i32.eq
            (local.get $0)
            (local.get $1)
           )
           (local.set $16
            (i32.add
             (local.get $1)
             (i32.const 8)
            )
           )
           (block
            (if
             (i32.gt_u
              (i32.load
               (i32.const 4052)
              )
              (local.get $1)
             )
             (call $_abort)
            )
            (if
             (i32.eq
              (local.get $7)
              (i32.load
               (local.tee $0
                (i32.add
                 (local.get $1)
                 (i32.const 8)
                )
               )
              )
             )
             (local.set $16
              (local.get $0)
             )
             (call $_abort)
            )
           )
          )
          (i32.store offset=12
           (local.get $2)
           (local.get $1)
          )
          (i32.store
           (local.get $16)
           (local.get $2)
          )
         )
         (block
          (local.set $8
           (i32.load offset=24
            (local.get $7)
           )
          )
          (if
           (i32.eq
            (local.get $7)
            (local.tee $0
             (i32.load offset=12
              (local.get $7)
             )
            )
           )
           (block $do-once6
            (if
             (local.tee $0
              (i32.load
               (local.tee $2
                (i32.add
                 (local.tee $1
                  (i32.add
                   (local.get $7)
                   (i32.const 16)
                  )
                 )
                 (i32.const 4)
                )
               )
              )
             )
             (local.set $1
              (local.get $2)
             )
             (br_if $do-once6
              (i32.eqz
               (local.tee $0
                (i32.load
                 (local.get $1)
                )
               )
              )
             )
            )
            (loop $while-in9
             (block $while-out8
              (if
               (i32.eqz
                (local.tee $6
                 (i32.load
                  (local.tee $2
                   (i32.add
                    (local.get $0)
                    (i32.const 20)
                   )
                  )
                 )
                )
               )
               (br_if $while-out8
                (i32.eqz
                 (local.tee $6
                  (i32.load
                   (local.tee $2
                    (i32.add
                     (local.get $0)
                     (i32.const 16)
                    )
                   )
                  )
                 )
                )
               )
              )
              (local.set $1
               (local.get $2)
              )
              (local.set $0
               (local.get $6)
              )
              (br $while-in9)
             )
            )
            (if
             (i32.gt_u
              (i32.load
               (i32.const 4052)
              )
              (local.get $1)
             )
             (call $_abort)
             (block
              (i32.store
               (local.get $1)
               (i32.const 0)
              )
              (local.set $10
               (local.get $0)
              )
             )
            )
           )
           (block
            (if
             (i32.gt_u
              (i32.load
               (i32.const 4052)
              )
              (local.tee $1
               (i32.load offset=8
                (local.get $7)
               )
              )
             )
             (call $_abort)
            )
            (if
             (i32.ne
              (i32.load
               (local.tee $2
                (i32.add
                 (local.get $1)
                 (i32.const 12)
                )
               )
              )
              (local.get $7)
             )
             (call $_abort)
            )
            (if
             (i32.eq
              (local.get $7)
              (i32.load
               (local.tee $6
                (i32.add
                 (local.get $0)
                 (i32.const 8)
                )
               )
              )
             )
             (block
              (i32.store
               (local.get $2)
               (local.get $0)
              )
              (i32.store
               (local.get $6)
               (local.get $1)
              )
              (local.set $10
               (local.get $0)
              )
             )
             (call $_abort)
            )
           )
          )
          (if
           (local.get $8)
           (block
            (if
             (i32.eq
              (local.get $7)
              (i32.load
               (local.tee $1
                (i32.add
                 (i32.shl
                  (local.tee $0
                   (i32.load offset=28
                    (local.get $7)
                   )
                  )
                  (i32.const 2)
                 )
                 (i32.const 4340)
                )
               )
              )
             )
             (block
              (i32.store
               (local.get $1)
               (local.get $10)
              )
              (if
               (i32.eqz
                (local.get $10)
               )
               (block
                (i32.store
                 (i32.const 4040)
                 (i32.and
                  (i32.load
                   (i32.const 4040)
                  )
                  (i32.xor
                   (i32.shl
                    (i32.const 1)
                    (local.get $0)
                   )
                   (i32.const -1)
                  )
                 )
                )
                (br $label$break$L111)
               )
              )
             )
             (if
              (i32.gt_u
               (i32.load
                (i32.const 4052)
               )
               (local.get $8)
              )
              (call $_abort)
              (block
               (i32.store
                (select
                 (local.tee $0
                  (i32.add
                   (local.get $8)
                   (i32.const 16)
                  )
                 )
                 (i32.add
                  (local.get $8)
                  (i32.const 20)
                 )
                 (i32.eq
                  (local.get $7)
                  (i32.load
                   (local.get $0)
                  )
                 )
                )
                (local.get $10)
               )
               (br_if $label$break$L111
                (i32.eqz
                 (local.get $10)
                )
               )
              )
             )
            )
            (if
             (i32.gt_u
              (local.tee $1
               (i32.load
                (i32.const 4052)
               )
              )
              (local.get $10)
             )
             (call $_abort)
            )
            (i32.store offset=24
             (local.get $10)
             (local.get $8)
            )
            (if
             (local.tee $0
              (i32.load
               (local.tee $2
                (i32.add
                 (local.get $7)
                 (i32.const 16)
                )
               )
              )
             )
             (if
              (i32.gt_u
               (local.get $1)
               (local.get $0)
              )
              (call $_abort)
              (block
               (i32.store offset=16
                (local.get $10)
                (local.get $0)
               )
               (i32.store offset=24
                (local.get $0)
                (local.get $10)
               )
              )
             )
            )
            (if
             (local.tee $0
              (i32.load offset=4
               (local.get $2)
              )
             )
             (if
              (i32.gt_u
               (i32.load
                (i32.const 4052)
               )
               (local.get $0)
              )
              (call $_abort)
              (block
               (i32.store offset=20
                (local.get $10)
                (local.get $0)
               )
               (i32.store offset=24
                (local.get $0)
                (local.get $10)
               )
              )
             )
            )
           )
          )
         )
        )
       )
       (i32.store offset=4
        (local.get $3)
        (i32.or
         (local.get $4)
         (i32.const 1)
        )
       )
       (i32.store
        (i32.add
         (local.get $4)
         (local.get $5)
        )
        (local.get $4)
       )
       (if (result i32)
        (i32.eq
         (local.get $3)
         (i32.load
          (i32.const 4056)
         )
        )
        (block
         (i32.store
          (i32.const 4044)
          (local.get $4)
         )
         (return)
        )
        (local.get $4)
       )
      )
     )
    )
    (i32.const 3)
   )
  )
  (if
   (i32.lt_u
    (local.get $5)
    (i32.const 256)
   )
   (block
    (local.set $0
     (i32.add
      (i32.shl
       (local.get $1)
       (i32.const 3)
      )
      (i32.const 4076)
     )
    )
    (if
     (i32.and
      (local.tee $5
       (i32.load
        (i32.const 4036)
       )
      )
      (local.tee $1
       (i32.shl
        (i32.const 1)
        (local.get $1)
       )
      )
     )
     (if
      (i32.gt_u
       (i32.load
        (i32.const 4052)
       )
       (local.tee $5
        (i32.load
         (local.tee $1
          (i32.add
           (local.get $0)
           (i32.const 8)
          )
         )
        )
       )
      )
      (call $_abort)
      (block
       (local.set $15
        (local.get $5)
       )
       (local.set $17
        (local.get $1)
       )
      )
     )
     (block
      (i32.store
       (i32.const 4036)
       (i32.or
        (local.get $1)
        (local.get $5)
       )
      )
      (local.set $15
       (local.get $0)
      )
      (local.set $17
       (i32.add
        (local.get $0)
        (i32.const 8)
       )
      )
     )
    )
    (i32.store
     (local.get $17)
     (local.get $3)
    )
    (i32.store offset=12
     (local.get $15)
     (local.get $3)
    )
    (i32.store offset=8
     (local.get $3)
     (local.get $15)
    )
    (i32.store offset=12
     (local.get $3)
     (local.get $0)
    )
    (return)
   )
  )
  (local.set $0
   (i32.add
    (i32.shl
     (local.tee $1
      (if (result i32)
       (local.tee $0
        (i32.shr_u
         (local.get $5)
         (i32.const 8)
        )
       )
       (if (result i32)
        (i32.gt_u
         (local.get $5)
         (i32.const 16777215)
        )
        (i32.const 31)
        (block (result i32)
         (local.set $0
          (i32.and
           (i32.shr_u
            (i32.add
             (local.tee $4
              (i32.shl
               (local.get $0)
               (local.tee $1
                (i32.and
                 (i32.shr_u
                  (i32.add
                   (local.get $0)
                   (i32.const 1048320)
                  )
                  (i32.const 16)
                 )
                 (i32.const 8)
                )
               )
              )
             )
             (i32.const 520192)
            )
            (i32.const 16)
           )
           (i32.const 4)
          )
         )
         (i32.or
          (i32.shl
           (local.tee $0
            (i32.add
             (i32.sub
              (i32.const 14)
              (i32.or
               (i32.or
                (local.get $0)
                (local.get $1)
               )
               (local.tee $1
                (i32.and
                 (i32.shr_u
                  (i32.add
                   (local.tee $0
                    (i32.shl
                     (local.get $4)
                     (local.get $0)
                    )
                   )
                   (i32.const 245760)
                  )
                  (i32.const 16)
                 )
                 (i32.const 2)
                )
               )
              )
             )
             (i32.shr_u
              (i32.shl
               (local.get $0)
               (local.get $1)
              )
              (i32.const 15)
             )
            )
           )
           (i32.const 1)
          )
          (i32.and
           (i32.shr_u
            (local.get $5)
            (i32.add
             (local.get $0)
             (i32.const 7)
            )
           )
           (i32.const 1)
          )
         )
        )
       )
       (i32.const 0)
      )
     )
     (i32.const 2)
    )
    (i32.const 4340)
   )
  )
  (i32.store offset=28
   (local.get $3)
   (local.get $1)
  )
  (i32.store offset=20
   (local.get $3)
   (i32.const 0)
  )
  (i32.store offset=16
   (local.get $3)
   (i32.const 0)
  )
  (if
   (i32.and
    (local.tee $4
     (i32.load
      (i32.const 4040)
     )
    )
    (local.tee $2
     (i32.shl
      (i32.const 1)
      (local.get $1)
     )
    )
   )
   (block $label$break$L197
    (if
     (i32.eq
      (local.get $5)
      (i32.and
       (i32.load offset=4
        (local.tee $0
         (i32.load
          (local.get $0)
         )
        )
       )
       (i32.const -8)
      )
     )
     (local.set $14
      (local.get $0)
     )
     (block $label$break$L200
      (local.set $4
       (i32.shl
        (local.get $5)
        (select
         (i32.const 0)
         (i32.sub
          (i32.const 25)
          (i32.shr_u
           (local.get $1)
           (i32.const 1)
          )
         )
         (i32.eq
          (local.get $1)
          (i32.const 31)
         )
        )
       )
      )
      (loop $while-in17
       (if
        (local.tee $1
         (i32.load
          (local.tee $2
           (i32.add
            (i32.add
             (local.get $0)
             (i32.const 16)
            )
            (i32.shl
             (i32.shr_u
              (local.get $4)
              (i32.const 31)
             )
             (i32.const 2)
            )
           )
          )
         )
        )
        (block
         (local.set $4
          (i32.shl
           (local.get $4)
           (i32.const 1)
          )
         )
         (if
          (i32.eq
           (local.get $5)
           (i32.and
            (i32.load offset=4
             (local.get $1)
            )
            (i32.const -8)
           )
          )
          (block
           (local.set $14
            (local.get $1)
           )
           (br $label$break$L200)
          )
          (block
           (local.set $0
            (local.get $1)
           )
           (br $while-in17)
          )
         )
        )
       )
      )
      (if
       (i32.gt_u
        (i32.load
         (i32.const 4052)
        )
        (local.get $2)
       )
       (call $_abort)
       (block
        (i32.store
         (local.get $2)
         (local.get $3)
        )
        (i32.store offset=24
         (local.get $3)
         (local.get $0)
        )
        (i32.store offset=12
         (local.get $3)
         (local.get $3)
        )
        (i32.store offset=8
         (local.get $3)
         (local.get $3)
        )
        (br $label$break$L197)
       )
      )
     )
    )
    (if
     (i32.and
      (i32.le_u
       (local.tee $0
        (i32.load
         (i32.const 4052)
        )
       )
       (local.get $14)
      )
      (i32.le_u
       (local.get $0)
       (local.tee $0
        (i32.load
         (local.tee $1
          (i32.add
           (local.get $14)
           (i32.const 8)
          )
         )
        )
       )
      )
     )
     (block
      (i32.store offset=12
       (local.get $0)
       (local.get $3)
      )
      (i32.store
       (local.get $1)
       (local.get $3)
      )
      (i32.store offset=8
       (local.get $3)
       (local.get $0)
      )
      (i32.store offset=12
       (local.get $3)
       (local.get $14)
      )
      (i32.store offset=24
       (local.get $3)
       (i32.const 0)
      )
     )
     (call $_abort)
    )
   )
   (block
    (i32.store
     (i32.const 4040)
     (i32.or
      (local.get $2)
      (local.get $4)
     )
    )
    (i32.store
     (local.get $0)
     (local.get $3)
    )
    (i32.store offset=24
     (local.get $3)
     (local.get $0)
    )
    (i32.store offset=12
     (local.get $3)
     (local.get $3)
    )
    (i32.store offset=8
     (local.get $3)
     (local.get $3)
    )
   )
  )
  (i32.store
   (i32.const 4068)
   (local.tee $0
    (i32.add
     (i32.load
      (i32.const 4068)
     )
     (i32.const -1)
    )
   )
  )
  (if
   (local.get $0)
   (return)
  )
  (local.set $0
   (i32.const 4492)
  )
  (loop $while-in19
   (local.set $0
    (i32.add
     (local.tee $3
      (i32.load
       (local.get $0)
      )
     )
     (i32.const 8)
    )
   )
   (br_if $while-in19
    (local.get $3)
   )
  )
  (i32.store
   (i32.const 4068)
   (i32.const -1)
  )
 )
 (func $_calloc (; 88 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.eqz
    (local.tee $0
     (call $_malloc
      (block (result i32)
       (if
        (local.get $0)
        (if
         (i32.gt_u
          (i32.or
           (local.tee $1
            (local.get $0)
           )
           (i32.const 1)
          )
          (i32.const 65535)
         )
         (local.set $1
          (select
           (local.get $1)
           (i32.const -1)
           (i32.eq
            (i32.div_u
             (local.get $1)
             (local.get $1)
            )
            (i32.const 1)
           )
          )
         )
        )
       )
       (local.get $1)
      )
     )
    )
   )
   (return
    (local.get $0)
   )
  )
  (if
   (i32.eqz
    (i32.and
     (i32.load
      (i32.add
       (local.get $0)
       (i32.const -4)
      )
     )
     (i32.const 3)
    )
   )
   (return
    (local.get $0)
   )
  )
  (drop
   (call $_memset
    (local.get $0)
    (i32.const 0)
    (local.get $1)
   )
  )
  (local.get $0)
 )
 (func $__Znwm (; 89 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local.set $1
   (select
    (local.get $0)
    (i32.const 1)
    (local.get $0)
   )
  )
  (loop $while-in
   (if
    (i32.eqz
     (local.tee $0
      (call $_malloc
       (local.get $1)
      )
     )
    )
    (if
     (call $__ZSt15get_new_handlerv)
     (block
      (call_indirect (type $FUNCSIG$v)
       (i32.const 6)
      )
      (br $while-in)
     )
     (local.set $0
      (i32.const 0)
     )
    )
   )
  )
  (local.get $0)
 )
 (func $__ZSt15get_new_handlerv (; 90 ;) (; has Stack IR ;) (result i32)
  (local $0 i32)
  (i32.store
   (i32.const 4532)
   (local.tee $0
    (i32.load
     (i32.const 4532)
    )
   )
  )
  (local.get $0)
 )
 (func $_memcpy (; 91 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (if
   (i32.ge_s
    (local.get $2)
    (i32.const 8192)
   )
   (block
    (drop
     (call $_emscripten_memcpy_big
      (local.get $0)
      (local.get $1)
      (local.get $2)
     )
    )
    (return
     (local.get $0)
    )
   )
  )
  (local.set $4
   (local.get $0)
  )
  (local.set $3
   (i32.add
    (local.get $0)
    (local.get $2)
   )
  )
  (if
   (i32.eq
    (i32.and
     (local.get $0)
     (i32.const 3)
    )
    (i32.and
     (local.get $1)
     (i32.const 3)
    )
   )
   (block
    (loop $while-in
     (if
      (i32.and
       (local.get $0)
       (i32.const 3)
      )
      (block
       (if
        (i32.eqz
         (local.get $2)
        )
        (return
         (local.get $4)
        )
       )
       (i32.store8
        (local.get $0)
        (i32.load8_s
         (local.get $1)
        )
       )
       (local.set $0
        (i32.add
         (local.get $0)
         (i32.const 1)
        )
       )
       (local.set $1
        (i32.add
         (local.get $1)
         (i32.const 1)
        )
       )
       (local.set $2
        (i32.sub
         (local.get $2)
         (i32.const 1)
        )
       )
       (br $while-in)
      )
     )
    )
    (local.set $5
     (i32.add
      (local.tee $2
       (i32.and
        (local.get $3)
        (i32.const -4)
       )
      )
      (i32.const -64)
     )
    )
    (loop $while-in1
     (if
      (i32.le_s
       (local.get $0)
       (local.get $5)
      )
      (block
       (i32.store
        (local.get $0)
        (i32.load
         (local.get $1)
        )
       )
       (i32.store offset=4
        (local.get $0)
        (i32.load offset=4
         (local.get $1)
        )
       )
       (i32.store offset=8
        (local.get $0)
        (i32.load offset=8
         (local.get $1)
        )
       )
       (i32.store offset=12
        (local.get $0)
        (i32.load offset=12
         (local.get $1)
        )
       )
       (i32.store offset=16
        (local.get $0)
        (i32.load offset=16
         (local.get $1)
        )
       )
       (i32.store offset=20
        (local.get $0)
        (i32.load offset=20
         (local.get $1)
        )
       )
       (i32.store offset=24
        (local.get $0)
        (i32.load offset=24
         (local.get $1)
        )
       )
       (i32.store offset=28
        (local.get $0)
        (i32.load offset=28
         (local.get $1)
        )
       )
       (i32.store offset=32
        (local.get $0)
        (i32.load offset=32
         (local.get $1)
        )
       )
       (i32.store offset=36
        (local.get $0)
        (i32.load offset=36
         (local.get $1)
        )
       )
       (i32.store offset=40
        (local.get $0)
        (i32.load offset=40
         (local.get $1)
        )
       )
       (i32.store offset=44
        (local.get $0)
        (i32.load offset=44
         (local.get $1)
        )
       )
       (i32.store offset=48
        (local.get $0)
        (i32.load offset=48
         (local.get $1)
        )
       )
       (i32.store offset=52
        (local.get $0)
        (i32.load offset=52
         (local.get $1)
        )
       )
       (i32.store offset=56
        (local.get $0)
        (i32.load offset=56
         (local.get $1)
        )
       )
       (i32.store offset=60
        (local.get $0)
        (i32.load offset=60
         (local.get $1)
        )
       )
       (local.set $0
        (i32.sub
         (local.get $0)
         (i32.const -64)
        )
       )
       (local.set $1
        (i32.sub
         (local.get $1)
         (i32.const -64)
        )
       )
       (br $while-in1)
      )
     )
    )
    (loop $while-in3
     (if
      (i32.lt_s
       (local.get $0)
       (local.get $2)
      )
      (block
       (i32.store
        (local.get $0)
        (i32.load
         (local.get $1)
        )
       )
       (local.set $0
        (i32.add
         (local.get $0)
         (i32.const 4)
        )
       )
       (local.set $1
        (i32.add
         (local.get $1)
         (i32.const 4)
        )
       )
       (br $while-in3)
      )
     )
    )
   )
   (block
    (local.set $2
     (i32.sub
      (local.get $3)
      (i32.const 4)
     )
    )
    (loop $while-in5
     (if
      (i32.lt_s
       (local.get $0)
       (local.get $2)
      )
      (block
       (i32.store8
        (local.get $0)
        (i32.load8_s
         (local.get $1)
        )
       )
       (i32.store8 offset=1
        (local.get $0)
        (i32.load8_s offset=1
         (local.get $1)
        )
       )
       (i32.store8 offset=2
        (local.get $0)
        (i32.load8_s offset=2
         (local.get $1)
        )
       )
       (i32.store8 offset=3
        (local.get $0)
        (i32.load8_s offset=3
         (local.get $1)
        )
       )
       (local.set $0
        (i32.add
         (local.get $0)
         (i32.const 4)
        )
       )
       (local.set $1
        (i32.add
         (local.get $1)
         (i32.const 4)
        )
       )
       (br $while-in5)
      )
     )
    )
   )
  )
  (loop $while-in7
   (if
    (i32.lt_s
     (local.get $0)
     (local.get $3)
    )
    (block
     (i32.store8
      (local.get $0)
      (i32.load8_s
       (local.get $1)
      )
     )
     (local.set $0
      (i32.add
       (local.get $0)
       (i32.const 1)
      )
     )
     (local.set $1
      (i32.add
       (local.get $1)
       (i32.const 1)
      )
     )
     (br $while-in7)
    )
   )
  )
  (local.get $4)
 )
 (func $_memset (; 92 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local.set $4
   (i32.add
    (local.get $0)
    (local.get $2)
   )
  )
  (local.set $1
   (i32.and
    (local.get $1)
    (i32.const 255)
   )
  )
  (if
   (i32.ge_s
    (local.get $2)
    (i32.const 67)
   )
   (block
    (loop $while-in
     (if
      (i32.and
       (local.get $0)
       (i32.const 3)
      )
      (block
       (i32.store8
        (local.get $0)
        (local.get $1)
       )
       (local.set $0
        (i32.add
         (local.get $0)
         (i32.const 1)
        )
       )
       (br $while-in)
      )
     )
    )
    (local.set $3
     (i32.or
      (i32.or
       (i32.or
        (i32.shl
         (local.get $1)
         (i32.const 8)
        )
        (local.get $1)
       )
       (i32.shl
        (local.get $1)
        (i32.const 16)
       )
      )
      (i32.shl
       (local.get $1)
       (i32.const 24)
      )
     )
    )
    (local.set $6
     (i32.add
      (local.tee $5
       (i32.and
        (local.get $4)
        (i32.const -4)
       )
      )
      (i32.const -64)
     )
    )
    (loop $while-in1
     (if
      (i32.le_s
       (local.get $0)
       (local.get $6)
      )
      (block
       (i32.store
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=4
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=8
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=12
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=16
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=20
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=24
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=28
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=32
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=36
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=40
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=44
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=48
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=52
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=56
        (local.get $0)
        (local.get $3)
       )
       (i32.store offset=60
        (local.get $0)
        (local.get $3)
       )
       (local.set $0
        (i32.sub
         (local.get $0)
         (i32.const -64)
        )
       )
       (br $while-in1)
      )
     )
    )
    (loop $while-in3
     (if
      (i32.lt_s
       (local.get $0)
       (local.get $5)
      )
      (block
       (i32.store
        (local.get $0)
        (local.get $3)
       )
       (local.set $0
        (i32.add
         (local.get $0)
         (i32.const 4)
        )
       )
       (br $while-in3)
      )
     )
    )
   )
  )
  (loop $while-in5
   (if
    (i32.lt_s
     (local.get $0)
     (local.get $4)
    )
    (block
     (i32.store8
      (local.get $0)
      (local.get $1)
     )
     (local.set $0
      (i32.add
       (local.get $0)
       (i32.const 1)
      )
     )
     (br $while-in5)
    )
   )
  )
  (i32.sub
   (local.get $4)
   (local.get $2)
  )
 )
 (func $_sbrk (; 93 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (if
   (i32.or
    (i32.and
     (i32.lt_s
      (local.tee $1
       (i32.add
        (local.get $0)
        (local.tee $2
         (i32.load
          (global.get $DYNAMICTOP_PTR)
         )
        )
       )
      )
      (local.get $2)
     )
     (i32.gt_s
      (local.get $0)
      (i32.const 0)
     )
    )
    (i32.lt_s
     (local.get $1)
     (i32.const 0)
    )
   )
   (block
    (drop
     (call $abortOnCannotGrowMemory
      (local.get $1)
     )
    )
    (call $___setErrNo
     (i32.const 12)
    )
    (return
     (i32.const -1)
    )
   )
  )
  (if
   (i32.le_s
    (local.get $1)
    (call $_emscripten_get_heap_size)
   )
   (i32.store
    (global.get $DYNAMICTOP_PTR)
    (local.get $1)
   )
   (if
    (i32.eqz
     (call $_emscripten_resize_heap
      (local.get $1)
     )
    )
    (block
     (call $___setErrNo
      (i32.const 12)
     )
     (return
      (i32.const -1)
     )
    )
   )
  )
  (local.get $2)
 )
 (func $dynCall_ii (; 94 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (call_indirect (type $FUNCSIG$ii)
   (local.get $1)
   (i32.and
    (local.get $0)
    (i32.const 1)
   )
  )
 )
 (func $dynCall_iiii (; 95 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (call_indirect (type $FUNCSIG$iiii)
   (local.get $1)
   (local.get $2)
   (local.get $3)
   (i32.add
    (i32.and
     (local.get $0)
     (i32.const 3)
    )
    (i32.const 2)
   )
  )
 )
 (func $dynCall_v (; 96 ;) (; has Stack IR ;) (param $0 i32)
  (call_indirect (type $FUNCSIG$v)
   (i32.const 6)
  )
 )
 (func $b0 (; 97 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (call $abort
   (i32.const 0)
  )
  (i32.const 0)
 )
 (func $b1 (; 98 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (call $abort
   (i32.const 1)
  )
  (i32.const 0)
 )
 (func $b2 (; 99 ;) (; has Stack IR ;)
  (call $abort
   (i32.const 2)
  )
 )
 (func $legalstub$_createContext (; 100 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 f64) (param $3 i32)
  (call $_createContext
   (local.get $0)
   (local.get $1)
   (f32.demote_f64
    (local.get $2)
   )
   (local.get $3)
  )
 )
)
