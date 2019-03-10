(module
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$v (func))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (type $FUNCSIG$viiii (func (param i32 i32 i32 i32)))
 (type $FUNCSIG$viiiiii (func (param i32 i32 i32 i32 i32 i32)))
 (type $FUNCSIG$viiiii (func (param i32 i32 i32 i32 i32)))
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$viii (func (param i32 i32 i32)))
 (type $FUNCSIG$vid (func (param i32 f64)))
 (import "env" "memory" (memory $memory 256))
 (data (i32.const 1026) "\80\bf\00\00\80?")
 (data (i32.const 1046) "\80\bf\00\00\80\bf")
 (data (i32.const 1062) "\80?\00\00\80?\00\00\80\bf\00\00\00\00\00\00\80?\00\00\80?\00\00\80?\00\00\80?\00\00\00\00\00\00\80?\00\00\00\00\11\00\n\00\11\11\11\00\00\00\00\05\00\00\00\00\00\00\t\00\00\00\00\0b")
 (data (i32.const 1136) "\11\00\0f\n\11\11\11\03\n\07\00\01\13\t\0b\0b\00\00\t\06\0b\00\00\0b\00\06\11\00\00\00\11\11\11")
 (data (i32.const 1185) "\0b")
 (data (i32.const 1194) "\11\00\n\n\11\11\11\00\n\00\00\02\00\t\0b\00\00\00\t\00\0b\00\00\0b")
 (data (i32.const 1243) "\0c")
 (data (i32.const 1255) "\0c\00\00\00\00\0c\00\00\00\00\t\0c\00\00\00\00\00\0c\00\00\0c")
 (data (i32.const 1301) "\0e")
 (data (i32.const 1313) "\0d\00\00\00\04\0d\00\00\00\00\t\0e\00\00\00\00\00\0e\00\00\0e")
 (data (i32.const 1359) "\10")
 (data (i32.const 1371) "\0f\00\00\00\00\0f\00\00\00\00\t\10\00\00\00\00\00\10\00\00\10\00\00\12\00\00\00\12\12\12")
 (data (i32.const 1426) "\12\00\00\00\12\12\12\00\00\00\00\00\00\t")
 (data (i32.const 1475) "\0b")
 (data (i32.const 1487) "\n\00\00\00\00\n\00\00\00\00\t\0b\00\00\00\00\00\0b\00\00\0b")
 (data (i32.const 1533) "\0c")
 (data (i32.const 1545) "\0c\00\00\00\00\0c\00\00\00\00\t\0c\00\00\00\00\00\0c\00\00\0c\00\000123456789ABCDEF\90\08\00\00\e2\15\00\00\b8\08\00\00B\16\00\00H\06\00\00\00\00\00\00\b8\08\00\00\ef\15\00\00X\06\00\00\00\00\00\00\90\08\00\00\10\16\00\00\b8\08\00\00\1d\16\00\008\06\00\00\00\00\00\00\b8\08\00\00H\17\00\00H\06\00\00\00\00\00\00\b8\08\00\00$\17\00\00p\06\00\00\00\00\00\00\94\06\00\00\05")
 (data (i32.const 1696) "\01")
 (data (i32.const 1720) "\01\00\00\00\02\00\00\00\e8\1d")
 (data (i32.const 1744) "\02")
 (data (i32.const 1759) "\ff\ff\ff\ff\ff")
 (data (i32.const 1808) "\14\07\00\00\05")
 (data (i32.const 1824) "\01")
 (data (i32.const 1848) "\03\00\00\00\02\00\00\00x\17\00\00\00\04")
 (data (i32.const 1872) "\01")
 (data (i32.const 1887) "\n\ff\ff\ff\ff")
 (data (i32.const 2124) "\c8\1b")
 (data (i32.const 2180) "\01\00\00\00\00\00\00\008\06\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\04\00\00\00\01\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00`\06\00\00\01\00\00\00\05\00\00\00\03\00\00\00\04\00\00\00\04\00\00\00\02\00\00\00\02\00\00\00\02\00\00\00\00\00\01\00\02\00\00\00\02\00\03\00attribute vec4 position;   \nattribute vec2 texCoord;   \nvarying vec2 v_texCoord;     \nvoid main()                  \n{                            \n   gl_Position = position; \n   v_texCoord = texCoord;  \n}                            \n\00precision mediump float;                            \nvarying vec2 v_texCoord;                            \nuniform sampler2D texture1;                        \nuniform sampler2D texture2;                        \nuniform float width;  \nuniform float height;  \nvoid main()                                         \n{        \n  vec4 pixel = texture2D(texture1, v_texCoord);              \n  vec4 n[9];\n  float w = 1.0 / width;\n  float h = 1.0 / height;\n  n[0] = texture2D(texture1, v_texCoord + vec2(0.0, 0.0) );\n  n[1] = texture2D(texture1, v_texCoord + vec2(w, 0.0) );\n  n[2] = texture2D(texture1, v_texCoord + vec2(2.0*w, 0.0) );\n  n[3] = texture2D(texture1, v_texCoord + vec2(0.0*w, h) );\n  n[4] = texture2D(texture1, v_texCoord + vec2(w, h) );\n  n[5] = texture2D(texture1, v_texCoord + vec2(2.0*w, h) );\n  n[6] = texture2D(texture1, v_texCoord + vec2(0.0, 2.0*h) );\n  n[7] = texture2D(texture1, v_texCoord + vec2(w, 2.0*h) );\n  n[8] = texture2D(texture1, v_texCoord + vec2(2.0*w, 2.0*h) );\n  vec4 sobel_x = n[2] + (2.0*n[5]) + n[8] - (n[0] + (2.0*n[3]) + n[6]);\n  vec4 sobel_y = n[0] + (2.0*n[1]) + n[2] - (n[6] + (2.0*n[7]) + n[8]);\n  float avg_x = (sobel_x.r + sobel_x.g + sobel_x.b) / 3.0;\n  float avg_y = (sobel_y.r + sobel_y.g + sobel_y.b) / 3.0;\n  sobel_x.r = avg_x;\n  sobel_x.g = avg_x;\n  sobel_x.b = avg_x;\n  sobel_y.r = avg_y;\n  sobel_y.g = avg_y;\n  sobel_y.b = avg_y;\n  vec3 sobel = vec3(sqrt((sobel_x.rgb * sobel_x.rgb) + (sobel_y.rgb * sobel_y.rgb)));\n  vec4 color1 = vec4( sobel, 1.0 ) * 0.5;   \n  pixel = texture2D(texture2, v_texCoord);              \n  n[0] = texture2D(texture2, v_texCoord + vec2(0.0, 0.0) );\n  n[1] = texture2D(texture2, v_texCoord + vec2(w, 0.0) );\n  n[2] = texture2D(texture2, v_texCoord + vec2(2.0*w, 0.0) );\n  n[3] = texture2D(texture2, v_texCoord + vec2(0.0*w, h) );\n  n[4] = texture2D(texture2, v_texCoord + vec2(w, h) );\n  n[5] = texture2D(texture2, v_texCoord + vec2(2.0*w, h) );\n  n[6] = texture2D(texture2, v_texCoord + vec2(0.0, 2.0*h) );\n  n[7] = texture2D(texture2, v_texCoord + vec2(w, 2.0*h) );\n  n[8] = texture2D(texture2, v_texCoord + vec2(2.0*w, 2.0*h) );\n  sobel_x = n[2] + (2.0*n[5]) + n[8] - (n[0] + (2.0*n[3]) + n[6]);\n  sobel_y = n[0] + (2.0*n[1]) + n[2] - (n[6] + (2.0*n[7]) + n[8]);\n  avg_x = (sobel_x.r + sobel_x.g + sobel_x.b) / 3.0;\n  avg_y = (sobel_y.r + sobel_y.g + sobel_y.b) / 3.0;\n  sobel_x.r = avg_x;\n  sobel_x.g = avg_x;\n  sobel_x.b = avg_x;\n  sobel_y.r = avg_y;\n  sobel_y.g = avg_y;\n  sobel_y.b = avg_y;\n  sobel = vec3(sqrt((sobel_x.rgb * sobel_x.rgb) + (sobel_y.rgb * sobel_y.rgb)));\n  vec4 color2 = vec4( sobel, 1.0 ) * 0.5;   \n  gl_FragColor = color1 + color2;   \n}                                                   \n\00position\00width\00height\00texture1\00texture2\00texCoord\00if (typeof window!=\"undefined\") { window.dispatchEvent(new CustomEvent(\"wasmLoaded\")) } else { global.onWASMLoaded && global.onWASMLoaded() }\00[WASM] Loaded\00-+   0X0x\00(null)\00-0X+0X 0X-0x+0x 0x\00inf\00INF\00nan\00NAN\00.\00terminating with %s exception of type %s: %s\00terminating with %s exception of type %s\00terminating with %s foreign exception\00terminating\00uncaught\00St9exception\00N10__cxxabiv116__shim_type_infoE\00St9type_info\00N10__cxxabiv120__si_class_type_infoE\00N10__cxxabiv117__class_type_infoE\00pthread_once failure in __cxa_get_globals_fast()\00cannot create pthread key for __cxa_get_globals()\00cannot zero out thread value for __cxa_get_globals()\00terminate_handler unexpectedly returned\00N10__cxxabiv119__pointer_type_infoE\00N10__cxxabiv117__pbase_type_infoE")
 (import "env" "table" (table $table 34 34 funcref))
 (elem (global.get $__table_base) $b0 $___stdio_close $b1 $___stdio_write $___stdio_seek $___stdout_write $__ZNK10__cxxabiv117__class_type_info9can_catchEPKNS_16__shim_type_infoERPv $b1 $b1 $b1 $b2 $__ZL25default_terminate_handlerv $__ZN10__cxxabiv112_GLOBAL__N_110construct_Ev $b2 $b3 $__ZN10__cxxabiv116__shim_type_infoD2Ev $__ZN10__cxxabiv117__class_type_infoD0Ev $__ZN10__cxxabiv116__shim_type_infoD2Ev $__ZN10__cxxabiv116__shim_type_infoD2Ev $__ZN10__cxxabiv117__class_type_infoD0Ev $__ZN10__cxxabiv112_GLOBAL__N_19destruct_EPv $b3 $b4 $__ZNK10__cxxabiv117__class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi $__ZNK10__cxxabiv120__si_class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi $b4 $b5 $__ZNK10__cxxabiv117__class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib $__ZNK10__cxxabiv120__si_class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib $b5 $b6 $__ZNK10__cxxabiv117__class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib $__ZNK10__cxxabiv120__si_class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib $b6)
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
 (import "env" "_emscripten_webgl_destroy_context" (func $_emscripten_webgl_destroy_context (param i32) (result i32)))
 (import "env" "_emscripten_webgl_make_context_current" (func $_emscripten_webgl_make_context_current (param i32) (result i32)))
 (import "env" "_glActiveTexture" (func $_glActiveTexture (param i32)))
 (import "env" "_glAttachShader" (func $_glAttachShader (param i32 i32)))
 (import "env" "_glBindAttribLocation" (func $_glBindAttribLocation (param i32 i32 i32)))
 (import "env" "_glBindBuffer" (func $_glBindBuffer (param i32 i32)))
 (import "env" "_glBindTexture" (func $_glBindTexture (param i32 i32)))
 (import "env" "_glBufferData" (func $_glBufferData (param i32 i32 i32 i32)))
 (import "env" "_glClear" (func $_glClear (param i32)))
 (import "env" "_glCompileShader" (func $_glCompileShader (param i32)))
 (import "env" "_glCreateProgram" (func $_glCreateProgram (result i32)))
 (import "env" "_glCreateShader" (func $_glCreateShader (param i32) (result i32)))
 (import "env" "_glDrawElements" (func $_glDrawElements (param i32 i32 i32 i32)))
 (import "env" "_glEnableVertexAttribArray" (func $_glEnableVertexAttribArray (param i32)))
 (import "env" "_glGenBuffers" (func $_glGenBuffers (param i32 i32)))
 (import "env" "_glGetAttribLocation" (func $_glGetAttribLocation (param i32 i32) (result i32)))
 (import "env" "_glGetShaderInfoLog" (func $_glGetShaderInfoLog (param i32 i32 i32 i32)))
 (import "env" "_glGetShaderiv" (func $_glGetShaderiv (param i32 i32 i32)))
 (import "env" "_glGetUniformLocation" (func $_glGetUniformLocation (param i32 i32) (result i32)))
 (import "env" "_glLinkProgram" (func $_glLinkProgram (param i32)))
 (import "env" "_glShaderSource" (func $_glShaderSource (param i32 i32 i32 i32)))
 (import "env" "_glUniform1f" (func $_glUniform1f (param i32 f64)))
 (import "env" "_glUniform1i" (func $_glUniform1i (param i32 i32)))
 (import "env" "_glUseProgram" (func $_glUseProgram (param i32)))
 (import "env" "_glValidateProgram" (func $_glValidateProgram (param i32)))
 (import "env" "_glVertexAttribPointer" (func $_glVertexAttribPointer (param i32 i32 i32 i32 i32 i32)))
 (import "env" "_glViewport" (func $_glViewport (param i32 i32 i32 i32)))
 (import "env" "_llvm_stackrestore" (func $_llvm_stackrestore (param i32)))
 (import "env" "_llvm_stacksave" (func $_llvm_stacksave (result i32)))
 (import "env" "abortOnCannotGrowMemory" (func $abortOnCannotGrowMemory (param i32) (result i32)))
 (global $DYNAMICTOP_PTR (mut i32) (global.get $DYNAMICTOP_PTR$asm2wasm$import))
 (global $STACKTOP (mut i32) (i32.const 8944))
 (global $STACK_MAX (mut i32) (i32.const 5251824))
 (export "__growWasmMemory" (func $__growWasmMemory))
 (export "__GLOBAL__sub_I_emscripten_cpp" (func $__GLOBAL__sub_I_emscripten_cpp))
 (export "___cxa_can_catch" (func $___cxa_can_catch))
 (export "___cxa_is_pointer_type" (func $___cxa_is_pointer_type))
 (export "___errno_location" (func $___errno_location))
 (export "_blendTexturesRun" (func $_blendTexturesRun))
 (export "_clearContexts" (func $_clearContexts))
 (export "_createContext" (func $_createContext))
 (export "_free" (func $_free))
 (export "_main" (func $_main))
 (export "_malloc" (func $_malloc))
 (export "_memcpy" (func $_memcpy))
 (export "_memset" (func $_memset))
 (export "_sbrk" (func $_sbrk))
 (export "dynCall_ii" (func $dynCall_ii))
 (export "dynCall_iiii" (func $dynCall_iiii))
 (export "dynCall_v" (func $dynCall_v))
 (export "dynCall_vi" (func $dynCall_vi))
 (export "dynCall_viiii" (func $dynCall_viiii))
 (export "dynCall_viiiii" (func $dynCall_viiiii))
 (export "dynCall_viiiiii" (func $dynCall_viiiiii))
 (export "establishStackSpace" (func $establishStackSpace))
 (export "stackAlloc" (func $stackAlloc))
 (export "stackRestore" (func $stackRestore))
 (export "stackSave" (func $stackSave))
 (func $__growWasmMemory (; 42 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (grow_memory
   (local.get $0)
  )
 )
 (func $stackAlloc (; 43 ;) (; has Stack IR ;) (param $0 i32) (result i32)
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
 (func $stackSave (; 44 ;) (; has Stack IR ;) (result i32)
  (global.get $STACKTOP)
 )
 (func $stackRestore (; 45 ;) (; has Stack IR ;) (param $0 i32)
  (global.set $STACKTOP
   (local.get $0)
  )
 )
 (func $establishStackSpace (; 46 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32)
  (global.set $STACKTOP
   (local.get $0)
  )
  (global.set $STACK_MAX
   (local.get $1)
  )
 )
 (func $__Z13CompileShaderjPNSt3__212basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE (; 47 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local.set $4
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (local.set $2
   (i32.add
    (local.get $4)
    (i32.const 8)
   )
  )
  (local.set $5
   (i32.add
    (local.get $4)
    (i32.const 4)
   )
  )
  (local.set $6
   (local.get $4)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1255:0
  (local.set $3
   (i32.add
    (local.get $1)
    (i32.const 11)
   )
  )
  (local.set $3
   (i32.load8_s
    (local.get $3)
   )
  )
  (local.set $1
   (if (result i32)
    (i32.lt_s
     (local.get $3)
     (i32.const 0)
    )
    (block (result i32)
     ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1337:0
     (local.set $3
      (i32.load
       (local.get $1)
      )
     )
     ;;@ ./dev/cpp/Context.cpp:89:0
     (i32.store
      (local.get $2)
      (local.get $3)
     )
     ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1317:0
     (local.set $1
      (i32.add
       (local.get $1)
       (i32.const 4)
      )
     )
     (i32.load
      (local.get $1)
     )
    )
    (block (result i32)
     ;;@ ./dev/cpp/Context.cpp:89:0
     (i32.store
      (local.get $2)
      (local.get $1)
     )
     ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1289:0
     (i32.and
      (local.get $3)
      (i32.const 255)
     )
    )
   )
  )
  ;;@ ./dev/cpp/Context.cpp:90:0
  (i32.store
   (local.get $5)
   (local.get $1)
  )
  ;;@ ./dev/cpp/Context.cpp:91:0
  (local.set $0
   (call $_glCreateShader
    (local.get $0)
   )
  )
  (if
   ;;@ ./dev/cpp/Context.cpp:93:0
   (i32.eqz
    (local.get $0)
   )
   (block
    (local.set $0
     (i32.const 0)
    )
    (global.set $STACKTOP
     (local.get $4)
    )
    ;;@ ./dev/cpp/Context.cpp:116:0
    (return
     (local.get $0)
    )
   )
  )
  ;;@ ./dev/cpp/Context.cpp:98:0
  (call $_glShaderSource
   (local.get $0)
   (i32.const 1)
   (local.get $2)
   (local.get $5)
  )
  ;;@ ./dev/cpp/Context.cpp:99:0
  (call $_glCompileShader
   (local.get $0)
  )
  ;;@ ./dev/cpp/Context.cpp:102:0
  (i32.store
   (local.get $6)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/Context.cpp:103:0
  (call $_glGetShaderiv
   (local.get $0)
   (i32.const 35716)
   (local.get $6)
  )
  ;;@ ./dev/cpp/Context.cpp:105:0
  (local.set $1
   (i32.load
    (local.get $6)
   )
  )
  (if
   (i32.gt_s
    (local.get $1)
    (i32.const 1)
   )
   (block
    ;;@ ./dev/cpp/Context.cpp:107:0
    (local.set $5
     (call $_llvm_stacksave)
    )
    (local.set $2
     (global.get $STACKTOP)
    )
    (global.set $STACKTOP
     (i32.add
      (global.get $STACKTOP)
      (i32.and
       (i32.add
        (local.get $1)
        (i32.const 15)
       )
       (i32.const -16)
      )
     )
    )
    ;;@ ./dev/cpp/Context.cpp:110:0
    (local.set $1
     (i32.load
      (local.get $6)
     )
    )
    (call $_glGetShaderInfoLog
     (local.get $0)
     (local.get $1)
     (i32.const 0)
     (local.get $2)
    )
    ;;@ ./dev/cpp/Context.cpp:112:0
    (call $_free
     (local.get $2)
    )
    ;;@ ./dev/cpp/Context.cpp:113:0
    (call $_llvm_stackrestore
     (local.get $5)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $4)
  )
  ;;@ ./dev/cpp/Context.cpp:116:0
  (local.get $0)
 )
 (func $__ZN7ContextC2EiiPcjj (; 48 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (local $6 i32)
  (local.set $6
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 48)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:127:0
  (i32.store
   (local.get $0)
   (local.get $1)
  )
  ;;@ ./dev/cpp/Context.cpp:128:0
  (local.set $1
   (i32.add
    (local.get $0)
    (i32.const 4)
   )
  )
  (i32.store
   (local.get $1)
   (local.get $2)
  )
  ;;@ ./dev/cpp/Context.cpp:129:0
  (local.set $1
   (i32.add
    (local.get $0)
    (i32.const 20)
   )
  )
  (i32.store
   (local.get $1)
   (local.get $4)
  )
  ;;@ ./dev/cpp/Context.cpp:130:0
  (local.set $1
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (i32.store
   (local.get $1)
   (local.get $5)
  )
  ;;@ ./dev/cpp/Context.cpp:134:0
  (local.set $1
   (i32.add
    (local.get $6)
    (i32.const 44)
   )
  )
  (i32.store
   (local.get $1)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/Context.cpp:135:0
  (local.set $1
   (i32.add
    (local.get $6)
    (i32.const 4)
   )
  )
  (i32.store
   (local.get $1)
   (i32.const 1)
  )
  ;;@ ./dev/cpp/Context.cpp:136:0
  (local.set $1
   (i32.add
    (local.get $6)
    (i32.const 8)
   )
  )
  (i32.store
   (local.get $1)
   (i32.const 1)
  )
  ;;@ ./dev/cpp/Context.cpp:137:0
  (local.set $1
   (i32.add
    (local.get $6)
    (i32.const 12)
   )
  )
  (i32.store
   (local.get $1)
   (i32.const 1)
  )
  ;;@ ./dev/cpp/Context.cpp:138:0
  (local.set $1
   (i32.add
    (local.get $6)
    (i32.const 32)
   )
  )
  (i32.store
   (local.get $1)
   (i32.const 1)
  )
  ;;@ ./dev/cpp/Context.cpp:139:0
  (local.set $1
   (i32.add
    (local.get $6)
    (i32.const 36)
   )
  )
  (i32.store
   (local.get $1)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/Context.cpp:141:0
  (local.set $2
   (call $_emscripten_webgl_create_context
    (local.get $3)
    (local.get $6)
   )
  )
  (local.set $1
   (i32.add
    (local.get $0)
    (i32.const 28)
   )
  )
  (i32.store
   (local.get $1)
   (local.get $2)
  )
  ;;@ ./dev/cpp/Context.cpp:142:0
  (drop
   (call $_emscripten_webgl_make_context_current
    (local.get $2)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:145:0
  (local.set $1
   (call $__Z13CompileShaderjPNSt3__212basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE
    (i32.const 35632)
    (i32.const 7052)
   )
  )
  (local.set $3
   (i32.add
    (local.get $0)
    (i32.const 16)
   )
  )
  (i32.store
   (local.get $3)
   (local.get $1)
  )
  ;;@ ./dev/cpp/Context.cpp:146:0
  (local.set $1
   (call $__Z13CompileShaderjPNSt3__212basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE
    (i32.const 35633)
    (i32.const 7040)
   )
  )
  (local.set $2
   (i32.add
    (local.get $0)
    (i32.const 12)
   )
  )
  (i32.store
   (local.get $2)
   (local.get $1)
  )
  ;;@ ./dev/cpp/Context.cpp:149:0
  (local.set $1
   (call $_glCreateProgram)
  )
  (local.set $4
   (i32.add
    (local.get $0)
    (i32.const 8)
   )
  )
  (i32.store
   (local.get $4)
   (local.get $1)
  )
  ;;@ ./dev/cpp/Context.cpp:151:0
  (local.set $0
   (i32.load
    (local.get $2)
   )
  )
  (call $_glAttachShader
   (local.get $1)
   (local.get $0)
  )
  ;;@ ./dev/cpp/Context.cpp:152:0
  (local.set $1
   (i32.load
    (local.get $4)
   )
  )
  (local.set $0
   (i32.load
    (local.get $3)
   )
  )
  (call $_glAttachShader
   (local.get $1)
   (local.get $0)
  )
  ;;@ ./dev/cpp/Context.cpp:154:0
  (local.set $0
   (i32.load
    (local.get $4)
   )
  )
  (call $_glBindAttribLocation
   (local.get $0)
   (i32.const 0)
   (i32.const 5198)
  )
  ;;@ ./dev/cpp/Context.cpp:156:0
  (local.set $0
   (i32.load
    (local.get $4)
   )
  )
  (call $_glLinkProgram
   (local.get $0)
  )
  ;;@ ./dev/cpp/Context.cpp:157:0
  (local.set $0
   (i32.load
    (local.get $4)
   )
  )
  (call $_glValidateProgram
   (local.get $0)
  )
  (global.set $STACKTOP
   (local.get $6)
  )
 )
 (func $__ZN7Context3runEv (; 49 ;) (; has Stack IR ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 f32)
  (local.set $2
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 112)
   )
  )
  (local.set $7
   (i32.add
    (local.get $2)
    (i32.const 84)
   )
  )
  (local.set $8
   (i32.add
    (local.get $2)
    (i32.const 80)
   )
  )
  (local.set $6
   (i32.add
    (local.get $2)
    (i32.const 88)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:166:0
  (local.set $1
   (i32.add
    (local.get $0)
    (i32.const 28)
   )
  )
  (local.set $1
   (i32.load
    (local.get $1)
   )
  )
  (drop
   (call $_emscripten_webgl_make_context_current
    (local.get $1)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:167:0
  (local.set $4
   (i32.add
    (local.get $0)
    (i32.const 8)
   )
  )
  (local.set $1
   (i32.load
    (local.get $4)
   )
  )
  (call $_glUseProgram
   (local.get $1)
  )
  ;;@ ./dev/cpp/Context.cpp:171:0
  (local.set $1
   (i32.load
    (local.get $4)
   )
  )
  (local.set $1
   (call $_glGetUniformLocation
    (local.get $1)
    (i32.const 5207)
   )
  )
  (local.set $5
   (f32.convert_i32_s
    (local.get $1)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:172:0
  (local.set $1
   (i32.load
    (local.get $4)
   )
  )
  (local.set $1
   (call $_glGetUniformLocation
    (local.get $1)
    (i32.const 5213)
   )
  )
  (local.set $11
   (f32.convert_i32_s
    (local.get $1)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:173:0
  (local.set $3
   (i32.trunc_f32_s
    (local.get $5)
   )
  )
  (local.set $1
   (i32.load
    (local.get $0)
   )
  )
  (local.set $5
   (f32.convert_i32_s
    (local.get $1)
   )
  )
  (call $_glUniform1f
   (local.get $3)
   (f64.promote_f32
    (local.get $5)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:174:0
  (local.set $3
   (i32.trunc_f32_s
    (local.get $11)
   )
  )
  (local.set $9
   (i32.add
    (local.get $0)
    (i32.const 4)
   )
  )
  (local.set $1
   (i32.load
    (local.get $9)
   )
  )
  (local.set $5
   (f32.convert_i32_s
    (local.get $1)
   )
  )
  (call $_glUniform1f
   (local.get $3)
   (f64.promote_f32
    (local.get $5)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:175:0
  (local.set $1
   (i32.add
    (local.get $0)
    (i32.const 20)
   )
  )
  (local.set $3
   (i32.load
    (local.get $1)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:119:0
  (local.set $1
   (i32.load
    (local.get $4)
   )
  )
  (local.set $1
   (call $_glGetUniformLocation
    (local.get $1)
    (i32.const 5220)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:120:0
  (call $_glUniform1i
   (local.get $1)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/Context.cpp:121:0
  (call $_glActiveTexture
   (i32.const 33984)
  )
  ;;@ ./dev/cpp/Context.cpp:122:0
  (call $_glBindTexture
   (i32.const 3553)
   (local.get $3)
  )
  ;;@ ./dev/cpp/Context.cpp:176:0
  (local.set $1
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (local.set $3
   (i32.load
    (local.get $1)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:119:0
  (local.set $1
   (i32.load
    (local.get $4)
   )
  )
  (local.set $1
   (call $_glGetUniformLocation
    (local.get $1)
    (i32.const 5229)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:120:0
  (call $_glUniform1i
   (local.get $1)
   (i32.const 1)
  )
  ;;@ ./dev/cpp/Context.cpp:121:0
  (call $_glActiveTexture
   (i32.const 33985)
  )
  ;;@ ./dev/cpp/Context.cpp:122:0
  (call $_glBindTexture
   (i32.const 3553)
   (local.get $3)
  )
  ;;@ ./dev/cpp/Context.cpp:182:0
  (local.set $1
   (i32.load
    (local.get $4)
   )
  )
  (local.set $10
   (call $_glGetAttribLocation
    (local.get $1)
    (i32.const 5198)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:183:0
  (local.set $1
   (i32.load
    (local.get $4)
   )
  )
  (local.set $3
   (call $_glGetAttribLocation
    (local.get $1)
    (i32.const 5238)
   )
  )
  (i64.store
   (local.get $2)
   (i64.load
    (i32.const 1024)
   )
  )
  (i64.store offset=8
   (local.get $2)
   (i64.load
    (i32.const 1032)
   )
  )
  (i64.store offset=16
   (local.get $2)
   (i64.load
    (i32.const 1040)
   )
  )
  (i64.store offset=24
   (local.get $2)
   (i64.load
    (i32.const 1048)
   )
  )
  (i64.store offset=32
   (local.get $2)
   (i64.load
    (i32.const 1056)
   )
  )
  (i64.store offset=40
   (local.get $2)
   (i64.load
    (i32.const 1064)
   )
  )
  (i64.store offset=48
   (local.get $2)
   (i64.load
    (i32.const 1072)
   )
  )
  (i64.store offset=56
   (local.get $2)
   (i64.load
    (i32.const 1080)
   )
  )
  (i64.store
   (i32.sub
    (local.get $2)
    (i32.const -64)
   )
   (i64.load
    (i32.const 1088)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:186:0
  (i64.store offset=72
   (local.get $2)
   (i64.load
    (i32.const 1096)
   )
  )
  (i64.store align=2
   (local.get $6)
   (i64.load align=2
    (i32.const 2264)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:188:0
  (i32.store offset=8 align=2
   (local.get $6)
   (i32.load align=2
    (i32.const 2272)
   )
  )
  ;;@ ./dev/cpp/Context.cpp:190:0
  (call $_glGenBuffers
   (i32.const 1)
   (local.get $7)
  )
  ;;@ ./dev/cpp/Context.cpp:191:0
  (local.set $1
   (i32.load
    (local.get $7)
   )
  )
  (call $_glBindBuffer
   (i32.const 34962)
   (local.get $1)
  )
  ;;@ ./dev/cpp/Context.cpp:192:0
  (call $_glBufferData
   (i32.const 34962)
   (i32.const 80)
   (local.get $2)
   (i32.const 35044)
  )
  ;;@ ./dev/cpp/Context.cpp:194:0
  (call $_glGenBuffers
   (i32.const 1)
   (local.get $8)
  )
  ;;@ ./dev/cpp/Context.cpp:195:0
  (local.set $1
   (i32.load
    (local.get $8)
   )
  )
  (call $_glBindBuffer
   (i32.const 34963)
   (local.get $1)
  )
  ;;@ ./dev/cpp/Context.cpp:196:0
  (call $_glBufferData
   (i32.const 34963)
   (i32.const 12)
   (local.get $6)
   (i32.const 35044)
  )
  ;;@ ./dev/cpp/Context.cpp:199:0
  (local.set $1
   (i32.load
    (local.get $0)
   )
  )
  (local.set $0
   (i32.load
    (local.get $9)
   )
  )
  (call $_glViewport
   (i32.const 0)
   (i32.const 0)
   (local.get $1)
   (local.get $0)
  )
  ;;@ ./dev/cpp/Context.cpp:200:0
  (call $_glClear
   (i32.const 16384)
  )
  ;;@ ./dev/cpp/Context.cpp:203:0
  (call $_glVertexAttribPointer
   (local.get $10)
   (i32.const 3)
   (i32.const 5126)
   (i32.const 0)
   (i32.const 20)
   (i32.const 0)
  )
  ;;@ ./dev/cpp/Context.cpp:204:0
  (call $_glVertexAttribPointer
   (local.get $3)
   (i32.const 2)
   (i32.const 5126)
   (i32.const 0)
   (i32.const 20)
   (i32.const 12)
  )
  ;;@ ./dev/cpp/Context.cpp:206:0
  (call $_glEnableVertexAttribArray
   (local.get $10)
  )
  ;;@ ./dev/cpp/Context.cpp:207:0
  (call $_glEnableVertexAttribArray
   (local.get $3)
  )
  ;;@ ./dev/cpp/Context.cpp:210:0
  (call $_glDrawElements
   (i32.const 4)
   (i32.const 6)
   (i32.const 5123)
   (i32.const 0)
  )
  (global.set $STACKTOP
   (local.get $2)
  )
 )
 (func $_main (; 50 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  ;;@ ./dev/cpp/emscripten.cpp:13:0
  (drop
   (call $_puts)
  )
  ;;@ ./dev/cpp/emscripten.cpp:15:0
  (drop
   (call $_emscripten_asm_const_i
    (i32.const 0)
   )
  )
  ;;@ ./dev/cpp/emscripten.cpp:23:0
  (i32.const 0)
 )
 (func $_clearContexts (; 51 ;) (; has Stack IR ;)
  (local $0 i32)
  (local $1 i32)
  ;;@ ./dev/cpp/emscripten.cpp:31:0
  (local.set $0
   (i32.load
    (i32.const 7064)
   )
  )
  (if
   (local.get $0)
   (block
    ;;@ ./dev/cpp/Context.cpp:161:0
    (local.set $1
     (i32.add
      (local.get $0)
      (i32.const 28)
     )
    )
    (local.set $1
     (i32.load
      (local.get $1)
     )
    )
    (drop
     (call $_emscripten_webgl_destroy_context
      (local.get $1)
     )
    )
    ;;@ ./dev/cpp/emscripten.cpp:31:0
    (call $__ZdlPv
     (local.get $0)
    )
   )
  )
  ;;@ ./dev/cpp/emscripten.cpp:32:0
  (local.set $0
   (i32.load
    (i32.const 7068)
   )
  )
  (if
   (i32.eqz
    (local.get $0)
   )
   ;;@ ./dev/cpp/emscripten.cpp:33:0
   (return)
  )
  ;;@ ./dev/cpp/Context.cpp:161:0
  (local.set $1
   (i32.add
    (local.get $0)
    (i32.const 28)
   )
  )
  (local.set $1
   (i32.load
    (local.get $1)
   )
  )
  (drop
   (call $_emscripten_webgl_destroy_context
    (local.get $1)
   )
  )
  ;;@ ./dev/cpp/emscripten.cpp:32:0
  (call $__ZdlPv
   (local.get $0)
  )
 )
 (func $_createContext (; 52 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (local $6 i32)
  ;;@ ./dev/cpp/emscripten.cpp:37:0
  (local.set $6
   (call $__Znwm
    (i32.const 32)
   )
  )
  (call $__ZN7ContextC2EiiPcjj
   (local.get $6)
   (local.get $0)
   (local.get $1)
   (local.get $2)
   (local.get $4)
   (local.get $5)
  )
  (local.set $0
   (i32.add
    (i32.shl
     (local.get $3)
     (i32.const 2)
    )
    (i32.const 7064)
   )
  )
  (i32.store
   (local.get $0)
   (local.get $6)
  )
  ;;@ ./dev/cpp/emscripten.cpp:38:0
  (call $_free
   (local.get $2)
  )
 )
 (func $_blendTexturesRun (; 53 ;) (; has Stack IR ;)
  (local $0 i32)
  ;;@ ./dev/cpp/emscripten.cpp:43:0
  (local.set $0
   (i32.load
    (i32.const 7064)
   )
  )
  (call $__ZN7Context3runEv
   (local.get $0)
  )
 )
 (func $__GLOBAL__sub_I_emscripten_cpp (; 54 ;) (; has Stack IR ;)
  (local $0 i32)
  (i64.store align=4
   (i32.const 7040)
   (i64.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/memory:2089:0
  (i32.store
   (i32.const 7048)
   (i32.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/new:228:0
  (local.set $0
   (call $__Znwm
    (i32.const 240)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1331:0
  (i32.store
   (i32.const 7040)
   (local.get $0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1324:0
  (i32.store
   (i32.const 7048)
   (i32.const -2147483408)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1314:0
  (i32.store
   (i32.const 7044)
   (i32.const 232)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:225:0
  (drop
   (call $_memcpy
    (local.get $0)
    (i32.const 2276)
    (i32.const 232)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1597:0
  (local.set $0
   (i32.add
    (local.get $0)
    (i32.const 232)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:208:0
  (i32.store8
   (local.get $0)
   (i32.const 0)
  )
  (i64.store align=4
   (i32.const 7052)
   (i64.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/memory:2089:0
  (i32.store
   (i32.const 7060)
   (i32.const 0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/new:228:0
  (local.set $0
   (call $__Znwm
    (i32.const 2704)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1331:0
  (i32.store
   (i32.const 7052)
   (local.get $0)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1324:0
  (i32.store
   (i32.const 7060)
   (i32.const -2147480944)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1314:0
  (i32.store
   (i32.const 7056)
   (i32.const 2688)
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:225:0
  (drop
   (call $_memcpy
    (local.get $0)
    (i32.const 2509)
    (i32.const 2688)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/string:1597:0
  (local.set $0
   (i32.add
    (local.get $0)
    (i32.const 2688)
   )
  )
  ;;@ /Users/shachar/emsdk/emscripten/1.38.28/system/include/libcxx/__string:208:0
  (i32.store8
   (local.get $0)
   (i32.const 0)
  )
 )
 (func $___stdio_close (; 55 ;) (; has Stack IR ;) (param $0 i32) (result i32)
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
 (func $___stdio_write (; 56 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $___stdio_seek (; 57 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local.set $4
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 32)
   )
  )
  (i32.store
   (local.tee $3
    (local.get $4)
   )
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
   (local.get $4)
  )
  (local.get $0)
 )
 (func $___syscall_ret (; 58 ;) (; has Stack IR ;) (param $0 i32) (result i32)
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
 (func $___errno_location (; 59 ;) (; has Stack IR ;) (result i32)
  (i32.const 7136)
 )
 (func $_dummy (; 60 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local.get $0)
 )
 (func $___stdout_write (; 61 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $4
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 32)
   )
  )
  (local.set $5
   (i32.add
    (local.tee $3
     (local.get $4)
    )
    (i32.const 16)
   )
  )
  (i32.store offset=36
   (local.get $0)
   (i32.const 1)
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
     (local.get $5)
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
   (local.get $4)
  )
  (local.get $0)
 )
 (func $_isdigit (; 62 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (i32.lt_u
   (i32.add
    (local.get $0)
    (i32.const -48)
   )
   (i32.const 10)
  )
 )
 (func $_pthread_self (; 63 ;) (; has Stack IR ;) (result i32)
  (i32.const 1936)
 )
 (func $_strlen (; 64 ;) (; has Stack IR ;) (param $0 i32) (result i32)
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
    (local.set $1
     (local.get $0)
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
 (func $_fputs (; 65 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $_fwrite (; 66 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
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
    (local.set $4
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
      (local.get $4)
     )
     (call $___unlockfile)
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
  (select
   (local.get $0)
   (local.get $1)
   (i32.ne
    (local.get $0)
    (local.get $3)
   )
  )
 )
 (func $___unlockfile (; 67 ;) (; has Stack IR ;)
  (nop)
 )
 (func $___lockfile (; 68 ;) (; has Stack IR ;) (result i32)
  (i32.const 1)
 )
 (func $___overflow (; 69 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local.set $3
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (i32.store8
   (local.tee $4
    (local.get $3)
   )
   (local.tee $7
    (i32.and
     (local.get $1)
     (i32.const 255)
    )
   )
  )
  (block $do-once
   (block $__rjti$0
    (br_if $__rjti$0
     (local.tee $5
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
    (local.set $1
     (if (result i32)
      (call $___towrite
       (local.get $0)
      )
      (i32.const -1)
      (block
       (local.set $5
        (i32.load
         (local.get $2)
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
     (local.get $5)
    )
    (if
     (i32.ne
      (local.tee $1
       (i32.and
        (local.get $1)
        (i32.const 255)
       )
      )
      (i32.load8_s offset=75
       (local.get $0)
      )
     )
     (block
      (i32.store
       (local.get $2)
       (i32.add
        (local.get $6)
        (i32.const 1)
       )
      )
      (i32.store8
       (local.get $6)
       (local.get $7)
      )
      (br $do-once)
     )
    )
   )
   (local.set $1
    (i32.load offset=36
     (local.get $0)
    )
   )
   (local.set $1
    (if (result i32)
     (i32.eq
      (call_indirect (type $FUNCSIG$iiii)
       (local.get $0)
       (local.get $4)
       (i32.const 1)
       (i32.add
        (i32.and
         (local.get $1)
         (i32.const 7)
        )
        (i32.const 2)
       )
      )
      (i32.const 1)
     )
     (i32.load8_u
      (local.get $4)
     )
     (i32.const -1)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $3)
  )
  (local.get $1)
 )
 (func $___towrite (; 70 ;) (; has Stack IR ;) (param $0 i32) (result i32)
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
 (func $___fwritex (; 71 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
         (i32.const 7)
        )
        (i32.const 2)
       )
      )
     )
     (br $label$break$L5)
    )
   )
   (local.set $2
    (if (result i32)
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
     (i32.const 0)
     (block $label$break$L10 (result i32)
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
         (br $label$break$L10
          (i32.const 0)
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
            (i32.const 7)
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
      (local.get $3)
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
     (local.get $2)
    )
   )
  )
  (local.get $2)
 )
 (func $_memchr (; 72 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $_vfprintf (; 73 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
  (local.set $4
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 224)
   )
  )
  (local.set $5
   (local.get $4)
  )
  (i64.store
   (local.tee $3
    (i32.add
     (local.get $4)
     (i32.const 160)
    )
   )
   (i64.const 0)
  )
  (i64.store offset=8
   (local.get $3)
   (i64.const 0)
  )
  (i64.store offset=16
   (local.get $3)
   (i64.const 0)
  )
  (i64.store offset=24
   (local.get $3)
   (i64.const 0)
  )
  (i64.store offset=32
   (local.get $3)
   (i64.const 0)
  )
  (i32.store
   (local.tee $6
    (i32.add
     (local.get $4)
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
      (local.get $6)
      (local.tee $2
       (i32.add
        (local.get $4)
        (i32.const 80)
       )
      )
      (local.get $3)
     )
     (i32.const 0)
    )
    (i32.const -1)
    (block (result i32)
     (local.set $12
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
     (local.set $7
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
        (local.get $7)
        (i32.const -33)
       )
      )
     )
     (if
      (i32.load
       (local.tee $8
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
        (local.get $6)
        (local.get $2)
        (local.get $3)
       )
      )
      (block
       (local.set $10
        (i32.load
         (local.tee $9
          (i32.add
           (local.get $0)
           (i32.const 44)
          )
         )
        )
       )
       (i32.store
        (local.get $9)
        (local.get $5)
       )
       (i32.store
        (local.tee $13
         (i32.add
          (local.get $0)
          (i32.const 28)
         )
        )
        (local.get $5)
       )
       (i32.store
        (local.tee $11
         (i32.add
          (local.get $0)
          (i32.const 20)
         )
        )
        (local.get $5)
       )
       (i32.store
        (local.get $8)
        (i32.const 80)
       )
       (i32.store
        (local.tee $14
         (i32.add
          (local.get $0)
          (i32.const 16)
         )
        )
        (i32.add
         (local.get $5)
         (i32.const 80)
        )
       )
       (local.set $1
        (call $_printf_core
         (local.get $0)
         (local.get $1)
         (local.get $6)
         (local.get $2)
         (local.get $3)
        )
       )
       (if
        (local.get $10)
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
             (i32.const 7)
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
            (local.get $11)
           )
          )
         )
         (i32.store
          (local.get $9)
          (local.get $10)
         )
         (i32.store
          (local.get $8)
          (i32.const 0)
         )
         (i32.store
          (local.get $14)
          (i32.const 0)
         )
         (i32.store
          (local.get $13)
          (i32.const 0)
         )
         (i32.store
          (local.get $11)
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
        (local.get $7)
        (i32.const 32)
       )
      )
     )
     (if
      (local.get $12)
      (call $___unlockfile)
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
   (local.get $4)
  )
  (local.get $0)
 )
 (func $_printf_core (; 74 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (result i32)
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
  (local $27 i32)
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
  (local.set $27
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
        (local.set $1
         (loop $while-in3 (result i32)
          (if
           (i32.ne
            (i32.load8_s offset=1
             (local.get $1)
            )
            (i32.const 37)
           )
           (block
            (local.set $1
             (local.get $9)
            )
            (br $label$break$L15)
           )
          )
          (local.set $9
           (i32.add
            (local.get $9)
            (i32.const 1)
           )
          )
          (i32.store
           (local.get $12)
           (local.tee $1
            (i32.add
             (local.get $1)
             (i32.const 2)
            )
           )
          )
          (br_if $while-in3
           (i32.eq
            (i32.load8_s
             (local.get $1)
            )
            (i32.const 37)
           )
          )
          (local.get $9)
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
               (i32.const 1039)
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
                      (i32.const 5403)
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
                       (i32.const 5403)
                      )
                      (br $__rjti$4)
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
                        (i32.const 5404)
                        (select
                         (i32.const 5405)
                         (i32.const 5403)
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
                      (br $__rjti$4)
                     )
                    )
                   )
                   (local.set $10
                    (i32.const 0)
                   )
                   (local.set $7
                    (i32.const 5403)
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
                   (i32.const 5403)
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
                 (local.set $26
                  (i32.eqz
                   (local.tee $19
                    (call $_memchr
                     (local.tee $14
                      (select
                       (local.tee $5
                        (i32.load
                         (local.get $11)
                        )
                       )
                       (i32.const 5413)
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
                  (i32.const 5403)
                 )
                 (local.set $13
                  (select
                   (local.get $1)
                   (i32.sub
                    (local.get $19)
                    (local.tee $6
                     (local.get $14)
                    )
                   )
                   (local.get $26)
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
                   (local.get $19)
                   (local.get $26)
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
                 (local.get $27)
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
              (i32.const 5403)
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
              (i32.const 5403)
              (i32.add
               (i32.shr_u
                (local.get $6)
                (i32.const 4)
               )
               (i32.const 5403)
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
 (func $_out_655 (; 75 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $_getint_656 (; 76 ;) (; has Stack IR ;) (param $0 i32) (result i32)
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
 (func $_pop_arg_658 (; 77 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32)
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
 (func $_fmt_x (; 78 ;) (; has Stack IR ;) (param $0 i64) (param $1 i32) (param $2 i32) (result i32)
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
        (i32.const 1568)
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
 (func $_fmt_o (; 79 ;) (; has Stack IR ;) (param $0 i64) (param $1 i32) (result i32)
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
 (func $_fmt_u (; 80 ;) (; has Stack IR ;) (param $0 i64) (param $1 i32) (result i32)
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
 (func $_pad_661 (; 81 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local.set $6
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 256)
   )
  )
  (local.set $5
   (local.get $6)
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
   (local.get $6)
  )
 )
 (func $_wctomb (; 82 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (if (result i32)
   (local.get $0)
   (call $_wcrtomb
    (local.get $0)
    (local.get $1)
   )
   (i32.const 0)
  )
 )
 (func $_fmt_fp (; 83 ;) (; has Stack IR ;) (param $0 i32) (param $1 f64) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (result i32)
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
  (local $21 i32)
  (local $22 i64)
  (local $23 i32)
  (local $24 i32)
  (local $25 i32)
  (local $26 i64)
  (local $27 i64)
  (local $28 i32)
  (local.set $23
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
    (local.get $23)
    (i32.const 32)
   )
  )
  (local.set $18
   (local.tee $13
    (local.get $23)
   )
  )
  (i32.store
   (local.tee $10
    (i32.add
     (local.get $13)
     (i32.const 536)
    )
   )
   (i32.const 0)
  )
  (local.set $15
   (i32.add
    (local.tee $12
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
     (local.tee $22
      (call $___DOUBLE_BITS_662
       (local.get $1)
      )
     )
     (i64.const 0)
    )
    (block (result i32)
     (local.set $22
      (call $___DOUBLE_BITS_662
       (local.tee $1
        (f64.neg
         (local.get $1)
        )
       )
      )
     )
     (local.set $19
      (i32.const 5420)
     )
     (i32.const 1)
    )
    (block (result i32)
     (local.set $19
      (select
       (i32.const 5423)
       (select
        (i32.const 5426)
        (i32.const 5421)
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
      (local.get $22)
      (i64.const 9218868437227405312)
     )
     (i64.const 9218868437227405312)
    )
    (block (result i32)
     (local.set $5
      (select
       (select
        (i32.const 5447)
        (i32.const 5451)
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
        (i32.const 5439)
        (i32.const 5443)
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
           (local.get $10)
          )
          (f64.const 2)
         )
        )
        (f64.const 0)
       )
      )
      (i32.store
       (local.get $10)
       (i32.add
        (i32.load
         (local.get $10)
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
         (local.tee $11
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
       (local.set $9
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
                (local.get $10)
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
           (local.get $12)
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
       (local.set $12
        (i32.lt_s
         (local.get $3)
         (i32.const 1)
        )
       )
       (local.set $10
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
          (local.get $11)
          (i32.load8_u
           (i32.add
            (local.tee $6
             (i32.trunc_f64_s
              (local.get $1)
             )
            )
            (i32.const 1568)
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
            (local.get $10)
            (i32.and
             (local.get $12)
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
          (local.set $12
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
         (local.set $12
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
          (local.get $12)
         )
        )
        (local.get $4)
       )
       (call $_out_655
        (local.get $0)
        (local.get $8)
        (local.get $9)
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
         (local.get $12)
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
        (local.get $10)
        (local.tee $8
         (i32.add
          (i32.load
           (local.get $10)
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
        (local.get $10)
       )
      )
     )
     (local.set $6
      (local.tee $12
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
        (local.get $12)
       )
       (loop $while-in7
        (local.set $11
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
            (local.get $11)
           )
          )
          (local.set $9
           (i32.const 0)
          )
          (loop $while-in9
           (local.set $22
            (i64.div_u
             (local.tee $27
              (i64.add
               (i64.extend_i32_u
                (local.get $9)
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
              (local.get $22)
              (i64.const 1000000000)
             )
            )
           )
           (local.set $9
            (i32.wrap_i64
             (local.get $22)
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
           (local.get $9)
           (i32.store
            (local.tee $7
             (i32.add
              (local.get $7)
              (i32.const -4)
             )
            )
            (local.get $9)
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
         (local.get $10)
         (local.tee $8
          (i32.sub
           (i32.load
            (local.get $10)
           )
           (local.get $11)
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
       (local.get $12)
      )
     )
     (local.set $11
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
           (local.get $11)
           (i32.const 25)
          )
          (i32.const 9)
         )
         (i32.const 1)
        )
       )
       (local.set $21
        (i32.eq
         (local.get $14)
         (i32.const 102)
        )
       )
       (local.set $3
        (local.get $6)
       )
       (loop $while-in14
        (local.set $9
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
             (local.get $12)
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
                   (local.get $9)
                  )
                  (i32.const -1)
                 )
                )
                (local.set $25
                 (i32.shr_u
                  (i32.const 1000000000)
                  (local.get $9)
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
                    (local.get $9)
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
                (if (result i32)
                 (local.get $8)
                 (block (result i32)
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
                  (local.get $7)
                 )
                 (block (result i32)
                  (local.set $6
                   (local.get $3)
                  )
                  (local.get $7)
                 )
                )
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
             (local.get $21)
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
         (local.get $10)
         (local.tee $6
          (i32.add
           (local.get $9)
           (i32.load
            (local.get $10)
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
     (local.set $17
      (local.get $12)
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
           (local.get $17)
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
           (local.get $11)
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
             (local.tee $24
              (i32.eq
               (local.get $14)
               (i32.const 103)
              )
             )
             (local.tee $25
              (i32.ne
               (local.get $11)
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
            (local.get $17)
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
        (local.set $21
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
               (local.get $12)
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
           (local.tee $28
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
               (local.get $21)
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
             (local.get $21)
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
              (local.get $28)
              (i32.eq
               (local.get $10)
               (local.tee $21
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
             (local.get $21)
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
              (local.tee $21
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
              (local.get $21)
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
                (local.get $17)
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
        (local.set $9
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
        (local.set $9
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
       (local.get $24)
       (block (result i32)
        (local.set $5
         (if (result i32)
          (i32.and
           (i32.gt_s
            (local.tee $3
             (i32.add
              (i32.and
               (i32.xor
                (local.get $25)
                (i32.const 1)
               )
               (i32.const 1)
              )
              (local.get $11)
             )
            )
            (local.get $9)
           )
           (i32.gt_s
            (local.get $9)
            (i32.const -5)
           )
          )
          (block (result i32)
           (local.set $10
            (i32.sub
             (i32.add
              (local.get $3)
              (i32.const -1)
             )
             (local.get $9)
            )
           )
           (i32.add
            (local.get $5)
            (i32.const -1)
           )
          )
          (block (result i32)
           (local.set $10
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
         (local.get $10)
         (block (result i32)
          (if
           (local.get $14)
           (if
            (local.tee $11
             (i32.load
              (i32.add
               (local.get $6)
               (i32.const -4)
              )
             )
            )
            (if
             (i32.rem_u
              (local.get $11)
              (i32.const 10)
             )
             (local.set $3
              (i32.const 0)
             )
             (block
              (local.set $3
               (i32.const 0)
              )
              (local.set $8
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
                  (local.get $11)
                  (local.tee $8
                   (i32.mul
                    (local.get $8)
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
          (local.set $8
           (i32.add
            (i32.mul
             (i32.shr_s
              (i32.sub
               (local.get $6)
               (local.get $17)
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
            (local.get $10)
            (local.tee $3
             (select
              (local.tee $3
               (i32.sub
                (local.get $8)
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
             (local.get $10)
             (local.get $3)
            )
           )
           (select
            (local.get $10)
            (local.tee $3
             (select
              (local.tee $3
               (i32.sub
                (i32.add
                 (local.get $8)
                 (local.get $9)
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
             (local.get $10)
             (local.get $3)
            )
           )
          )
         )
        )
       )
       (local.get $11)
      )
     )
     (local.set $8
      (i32.sub
       (i32.const 0)
       (local.get $9)
      )
     )
     (local.set $5
      (if (result i32)
       (local.tee $11
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
         (local.get $9)
         (i32.const 0)
         (i32.gt_s
          (local.get $9)
          (i32.const 0)
         )
        )
       )
       (block (result i32)
        (local.set $8
         (call $_fmt_u
          (i64.extend_i32_s
           (select
            (local.get $8)
            (local.get $9)
            (i32.lt_s
             (local.get $9)
             (i32.const 0)
            )
           )
          )
          (local.get $15)
         )
        )
        (if
         (i32.lt_s
          (i32.sub
           (local.tee $10
            (local.get $15)
           )
           (local.get $8)
          )
          (i32.const 2)
         )
         (loop $while-in33
          (i32.store8
           (local.tee $8
            (i32.add
             (local.get $8)
             (i32.const -1)
            )
           )
           (i32.const 48)
          )
          (br_if $while-in33
           (i32.lt_s
            (i32.sub
             (local.get $10)
             (local.get $8)
            )
            (i32.const 2)
           )
          )
         )
        )
        (i32.store8
         (i32.add
          (local.get $8)
          (i32.const -1)
         )
         (i32.add
          (i32.and
           (i32.shr_s
            (local.get $9)
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
           (local.get $8)
           (i32.const -2)
          )
         )
         (local.get $5)
        )
        (i32.sub
         (local.get $10)
         (local.get $8)
        )
       )
      )
     )
     (call $_pad_661
      (local.get $0)
      (i32.const 32)
      (local.get $2)
      (local.tee $9
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
          (local.tee $10
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
      (local.get $9)
      (i32.xor
       (local.get $4)
       (i32.const 65536)
      )
     )
     (if
      (local.get $11)
      (block
       (local.set $11
        (local.tee $8
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
        (local.tee $17
         (select
          (local.get $12)
          (local.get $7)
          (i32.gt_u
           (local.get $7)
           (local.get $12)
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
          (local.get $8)
         )
        )
        (if
         (i32.eq
          (local.get $7)
          (local.get $17)
         )
         (if
          (i32.eq
           (local.get $5)
           (local.get $8)
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
          (local.get $11)
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
          (local.get $12)
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
           (local.get $10)
           (i32.const 1)
          )
         )
        )
        (call $_out_655
         (local.get $0)
         (i32.const 5455)
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
              (local.get $8)
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
          (local.tee $17
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
         (local.set $20
          (i32.eqz
           (i32.and
            (local.get $4)
            (i32.const 8)
           )
          )
         )
         (local.set $19
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
         (local.set $10
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
              (local.get $10)
              (i32.const 48)
             )
             (local.set $3
              (local.get $10)
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
              (local.set $12
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
                (local.get $20)
                (i32.lt_s
                 (local.get $5)
                 (i32.const 1)
                )
               )
               (block
                (local.set $3
                 (local.get $12)
                )
                (br $do-once44)
               )
              )
              (call $_out_655
               (local.get $0)
               (i32.const 5455)
               (i32.const 1)
              )
              (local.set $3
               (local.get $12)
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
               (local.get $19)
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
              (local.get $17)
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
      (local.get $9)
      (i32.xor
       (local.get $4)
       (i32.const 8192)
      )
     )
     (local.get $9)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $23)
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
 (func $___DOUBLE_BITS_662 (; 84 ;) (; has Stack IR ;) (param $0 f64) (result i64)
  (i64.reinterpret_f64
   (local.get $0)
  )
 )
 (func $_frexpl (; 85 ;) (; has Stack IR ;) (param $0 f64) (param $1 i32) (result f64)
  (call $_frexp
   (local.get $0)
   (local.get $1)
  )
 )
 (func $_frexp (; 86 ;) (; has Stack IR ;) (param $0 f64) (param $1 i32) (result f64)
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
 (func $_wcrtomb (; 87 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
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
 (func $___pthread_self_888 (; 88 ;) (; has Stack IR ;) (result i32)
  (call $_pthread_self)
 )
 (func $_fputc (; 89 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (block $do-once
   (block $__rjti$1
    (br_if $__rjti$1
     (i32.lt_s
      (i32.load offset=76
       (local.get $0)
      )
      (i32.const 0)
     )
    )
    (br_if $__rjti$1
     (i32.eqz
      (call $___lockfile)
     )
    )
    (local.set $0
     (block $__rjto$0 (result i32)
      (block $__rjti$0
       (br_if $__rjti$0
        (i32.eq
         (i32.load8_s offset=75
          (local.get $0)
         )
         (i32.const 10)
        )
       )
       (br_if $__rjti$0
        (i32.ge_u
         (local.tee $1
          (i32.load
           (local.tee $2
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
       )
       (i32.store
        (local.get $2)
        (i32.add
         (local.get $1)
         (i32.const 1)
        )
       )
       (i32.store8
        (local.get $1)
        (i32.const 10)
       )
       (br $__rjto$0
        (i32.const 10)
       )
      )
      (call $___overflow
       (local.get $0)
       (i32.const 10)
      )
     )
    )
    (call $___unlockfile)
    (br $do-once)
   )
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
        (local.tee $2
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
       (local.get $2)
       (i32.add
        (local.get $1)
        (i32.const 1)
       )
      )
      (i32.store8
       (local.get $1)
       (i32.const 10)
      )
      (local.set $0
       (i32.const 10)
      )
      (br $do-once)
     )
    )
   )
   (local.set $0
    (call $___overflow
     (local.get $0)
     (i32.const 10)
    )
   )
  )
  (local.get $0)
 )
 (func $_puts (; 90 ;) (; has Stack IR ;) (result i32)
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
        (i32.const 1808)
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
      (i32.const 5389)
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
       (i32.const 10)
      )
      (i32.const 31)
     )
    )
   )
  )
  (if
   (local.get $2)
   (call $___unlockfile)
  )
  (local.get $1)
 )
 (func $_malloc (; 91 ;) (; has Stack IR ;) (param $0 i32) (result i32)
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
           (i32.const 7140)
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
                 (i32.const 7180)
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
         (i32.const 7140)
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
            (i32.const 7156)
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
         (i32.const 7148)
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
                   (i32.const 7180)
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
           (i32.const 7140)
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
              (i32.const 7156)
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
             (i32.const 7160)
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
             (i32.const 7180)
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
               (i32.const 7156)
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
              (i32.const 7140)
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
          (i32.const 7148)
          (local.get $5)
         )
         (i32.store
          (i32.const 7160)
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
          (i32.const 7144)
         )
        )
        (block
         (local.set $3
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
             (i32.const 7444)
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
            (i32.eqz
             (local.tee $0
              (i32.load offset=16
               (local.get $3)
              )
             )
            )
            (br_if $while-out
             (i32.eqz
              (local.tee $0
               (i32.load offset=20
                (local.get $3)
               )
              )
             )
            )
           )
           (local.set $3
            (local.get $0)
           )
           (local.set $4
            (select
             (local.get $0)
             (local.get $4)
             (local.tee $6
              (i32.lt_u
               (local.tee $0
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
             (local.get $0)
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
             (i32.const 7156)
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
             (local.set $0
              (if (result i32)
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
               (block (result i32)
                (local.set $3
                 (local.get $6)
                )
                (local.get $9)
               )
               (block (result i32)
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
                (local.set $3
                 (local.get $6)
                )
                (local.get $9)
               )
              )
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
                (i32.const 7444)
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
                (i32.const 7144)
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
               (i32.const 7156)
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
               (i32.const 7156)
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
               (i32.const 7156)
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
               (i32.const 7160)
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
               (i32.const 7180)
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
                 (i32.const 7156)
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
                (i32.const 7140)
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
            (i32.const 7148)
            (local.get $10)
           )
           (i32.store
            (i32.const 7160)
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
         (i32.const 7144)
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
               (i32.const 7444)
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
                  (local.set $1
                   (local.get $0)
                  )
                  (local.set $2
                   (i32.const 0)
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
          (if
           (i32.eqz
            (i32.or
             (local.get $0)
             (local.get $5)
            )
           )
           (block
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
            (local.set $5
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
               (i32.const 7444)
              )
             )
            )
           )
          )
          (local.set $5
           (if (result i32)
            (local.get $5)
            (block
             (local.set $1
              (local.get $0)
             )
             (local.set $0
              (local.get $5)
             )
             (br $__rjti$1)
            )
            (local.get $0)
           )
          )
          (br $__rjto$1)
         )
         (local.set $5
          (local.get $1)
         )
         (local.set $1
          (local.get $2)
         )
         (local.set $2
          (loop $while-in17 (result i32)
           (local.set $12
            (i32.load offset=4
             (local.get $0)
            )
           )
           (if
            (i32.eqz
             (local.tee $2
              (i32.load offset=16
               (local.get $0)
              )
             )
            )
            (local.set $2
             (i32.load offset=20
              (local.get $0)
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
             (local.get $1)
            )
           )
           (local.set $1
            (select
             (local.get $16)
             (local.get $1)
             (local.get $12)
            )
           )
           (local.set $5
            (select
             (local.get $0)
             (local.get $5)
             (local.get $12)
            )
           )
           (if (result i32)
            (local.get $2)
            (block
             (local.set $0
              (local.get $2)
             )
             (br $while-in17)
            )
            (local.get $1)
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
             (i32.const 7148)
            )
            (local.get $4)
           )
          )
          (block
           (if
            (i32.gt_u
             (local.tee $17
              (i32.load
               (i32.const 7156)
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
               (local.set $0
                (if (result i32)
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
                 (block (result i32)
                  (local.set $1
                   (local.get $9)
                  )
                  (local.get $11)
                 )
                 (block (result i32)
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
                  (local.set $1
                   (local.get $9)
                  )
                  (local.get $11)
                 )
                )
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
                  (i32.const 7444)
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
                  (i32.const 7144)
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
                 (i32.const 7156)
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
                 (i32.const 7156)
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
                 (i32.const 7156)
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
                 (i32.const 7180)
                )
               )
               (if
                (i32.and
                 (local.tee $3
                  (i32.load
                   (i32.const 7140)
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
                   (i32.const 7156)
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
                  (i32.const 7140)
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
               (i32.const 7444)
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
                (i32.const 7144)
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
                  (i32.const 7156)
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
                  (i32.const 7156)
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
  (if
   (i32.ge_u
    (local.tee $1
     (i32.load
      (i32.const 7148)
     )
    )
    (local.get $3)
   )
   (block
    (local.set $0
     (i32.load
      (i32.const 7160)
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
       (i32.const 7160)
       (local.tee $4
        (i32.add
         (local.get $0)
         (local.get $3)
        )
       )
      )
      (i32.store
       (i32.const 7148)
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
       (i32.const 7148)
       (i32.const 0)
      )
      (i32.store
       (i32.const 7160)
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
    (global.set $STACKTOP
     (local.get $14)
    )
    (return
     (i32.add
      (local.get $0)
      (i32.const 8)
     )
    )
   )
  )
  (if
   (i32.gt_u
    (local.tee $1
     (i32.load
      (i32.const 7152)
     )
    )
    (local.get $3)
   )
   (block
    (i32.store
     (i32.const 7152)
     (local.tee $1
      (i32.sub
       (local.get $1)
       (local.get $3)
      )
     )
    )
    (i32.store
     (i32.const 7164)
     (local.tee $2
      (i32.add
       (local.get $3)
       (local.tee $0
        (i32.load
         (i32.const 7164)
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
    (global.set $STACKTOP
     (local.get $14)
    )
    (return
     (i32.add
      (local.get $0)
      (i32.const 8)
     )
    )
   )
  )
  (local.set $0
   (local.get $14)
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
           (i32.const 7612)
          )
          (i32.load
           (i32.const 7620)
          )
          (block (result i32)
           (i32.store
            (i32.const 7620)
            (i32.const 4096)
           )
           (i32.store
            (i32.const 7616)
            (i32.const 4096)
           )
           (i32.store
            (i32.const 7624)
            (i32.const -1)
           )
           (i32.store
            (i32.const 7628)
            (i32.const -1)
           )
           (i32.store
            (i32.const 7632)
            (i32.const 0)
           )
           (i32.store
            (i32.const 7584)
            (i32.const 0)
           )
           (i32.store
            (i32.const 7612)
            (i32.xor
             (i32.and
              (local.get $0)
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
     (i32.const 7580)
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
          (i32.const 7572)
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
       (i32.const 7584)
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
             (i32.const 7164)
            )
           )
          )
         )
         (local.set $2
          (i32.const 7588)
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
               (i32.const 7572)
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
                       (i32.const 7616)
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
                (i32.const 7580)
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
              (i32.const 7620)
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
       (i32.const 7584)
       (i32.or
        (i32.load
         (i32.const 7584)
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
    (i32.const 7572)
    (local.tee $2
     (i32.add
      (local.get $1)
      (i32.load
       (i32.const 7572)
      )
     )
    )
   )
   (if
    (i32.gt_u
     (local.get $2)
     (i32.load
      (i32.const 7576)
     )
    )
    (i32.store
     (i32.const 7576)
     (local.get $2)
    )
   )
   (if
    (local.tee $6
     (i32.load
      (i32.const 7164)
     )
    )
    (block $label$break$L294
     (local.set $2
      (i32.const 7588)
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
              (i32.const 7152)
             )
            )
           )
           (local.get $2)
          )
         )
         (i32.store
          (i32.const 7164)
          (local.get $0)
         )
         (i32.store
          (i32.const 7152)
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
          (i32.const 7168)
          (i32.load
           (i32.const 7628)
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
         (i32.const 7156)
        )
       )
      )
      (block
       (i32.store
        (i32.const 7156)
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
      (i32.const 7588)
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
           (i32.const 7152)
           (local.tee $0
            (i32.add
             (local.get $4)
             (i32.load
              (i32.const 7152)
             )
            )
           )
          )
          (i32.store
           (i32.const 7164)
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
             (i32.const 7160)
            )
           )
           (block
            (i32.store
             (i32.const 7148)
             (local.tee $0
              (i32.add
               (local.get $4)
               (i32.load
                (i32.const 7148)
               )
              )
             )
            )
            (i32.store
             (i32.const 7160)
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
                    (i32.const 7180)
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
                   (i32.const 7140)
                   (i32.and
                    (i32.load
                     (i32.const 7140)
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
                    (local.set $0
                     (if (result i32)
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
                      (block (result i32)
                       (local.set $3
                        (local.get $6)
                       )
                       (local.get $5)
                      )
                      (block (result i32)
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
                       (local.set $3
                        (local.get $6)
                       )
                       (local.get $5)
                      )
                     )
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
                     (i32.const 7444)
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
                   (i32.const 7144)
                   (i32.and
                    (i32.load
                     (i32.const 7144)
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
                    (i32.const 7156)
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
                    (i32.const 7156)
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
                   (i32.const 7156)
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
              (i32.const 7180)
             )
            )
            (if
             (i32.and
              (local.tee $1
               (i32.load
                (i32.const 7140)
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
                 (i32.const 7156)
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
               (i32.const 7140)
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
            (i32.const 7444)
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
               (i32.const 7144)
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
             (i32.const 7144)
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
               (i32.const 7156)
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
               (i32.const 7156)
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
      (i32.const 7588)
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
      (i32.const 7164)
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
      (i32.const 7152)
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
      (i32.const 7168)
      (i32.load
       (i32.const 7628)
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
       (i32.const 7588)
      )
     )
     (i64.store offset=8 align=4
      (local.get $4)
      (i64.load align=4
       (i32.const 7596)
      )
     )
     (i32.store
      (i32.const 7588)
      (local.get $0)
     )
     (i32.store
      (i32.const 7592)
      (local.get $1)
     )
     (i32.store
      (i32.const 7600)
      (i32.const 0)
     )
     (i32.store
      (i32.const 7596)
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
           (i32.const 7180)
          )
         )
         (if
          (i32.and
           (local.tee $2
            (i32.load
             (i32.const 7140)
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
             (i32.const 7156)
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
            (i32.const 7140)
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
         (i32.const 7444)
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
            (i32.const 7144)
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
          (i32.const 7144)
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
            (i32.const 7156)
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
            (i32.const 7156)
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
          (i32.const 7156)
         )
        )
       )
       (i32.lt_u
        (local.get $0)
        (local.get $2)
       )
      )
      (i32.store
       (i32.const 7156)
       (local.get $0)
      )
     )
     (i32.store
      (i32.const 7588)
      (local.get $0)
     )
     (i32.store
      (i32.const 7592)
      (local.get $1)
     )
     (i32.store
      (i32.const 7600)
      (i32.const 0)
     )
     (i32.store
      (i32.const 7176)
      (i32.load
       (i32.const 7612)
      )
     )
     (i32.store
      (i32.const 7172)
      (i32.const -1)
     )
     (i32.store
      (i32.const 7192)
      (i32.const 7180)
     )
     (i32.store
      (i32.const 7188)
      (i32.const 7180)
     )
     (i32.store
      (i32.const 7200)
      (i32.const 7188)
     )
     (i32.store
      (i32.const 7196)
      (i32.const 7188)
     )
     (i32.store
      (i32.const 7208)
      (i32.const 7196)
     )
     (i32.store
      (i32.const 7204)
      (i32.const 7196)
     )
     (i32.store
      (i32.const 7216)
      (i32.const 7204)
     )
     (i32.store
      (i32.const 7212)
      (i32.const 7204)
     )
     (i32.store
      (i32.const 7224)
      (i32.const 7212)
     )
     (i32.store
      (i32.const 7220)
      (i32.const 7212)
     )
     (i32.store
      (i32.const 7232)
      (i32.const 7220)
     )
     (i32.store
      (i32.const 7228)
      (i32.const 7220)
     )
     (i32.store
      (i32.const 7240)
      (i32.const 7228)
     )
     (i32.store
      (i32.const 7236)
      (i32.const 7228)
     )
     (i32.store
      (i32.const 7248)
      (i32.const 7236)
     )
     (i32.store
      (i32.const 7244)
      (i32.const 7236)
     )
     (i32.store
      (i32.const 7256)
      (i32.const 7244)
     )
     (i32.store
      (i32.const 7252)
      (i32.const 7244)
     )
     (i32.store
      (i32.const 7264)
      (i32.const 7252)
     )
     (i32.store
      (i32.const 7260)
      (i32.const 7252)
     )
     (i32.store
      (i32.const 7272)
      (i32.const 7260)
     )
     (i32.store
      (i32.const 7268)
      (i32.const 7260)
     )
     (i32.store
      (i32.const 7280)
      (i32.const 7268)
     )
     (i32.store
      (i32.const 7276)
      (i32.const 7268)
     )
     (i32.store
      (i32.const 7288)
      (i32.const 7276)
     )
     (i32.store
      (i32.const 7284)
      (i32.const 7276)
     )
     (i32.store
      (i32.const 7296)
      (i32.const 7284)
     )
     (i32.store
      (i32.const 7292)
      (i32.const 7284)
     )
     (i32.store
      (i32.const 7304)
      (i32.const 7292)
     )
     (i32.store
      (i32.const 7300)
      (i32.const 7292)
     )
     (i32.store
      (i32.const 7312)
      (i32.const 7300)
     )
     (i32.store
      (i32.const 7308)
      (i32.const 7300)
     )
     (i32.store
      (i32.const 7320)
      (i32.const 7308)
     )
     (i32.store
      (i32.const 7316)
      (i32.const 7308)
     )
     (i32.store
      (i32.const 7328)
      (i32.const 7316)
     )
     (i32.store
      (i32.const 7324)
      (i32.const 7316)
     )
     (i32.store
      (i32.const 7336)
      (i32.const 7324)
     )
     (i32.store
      (i32.const 7332)
      (i32.const 7324)
     )
     (i32.store
      (i32.const 7344)
      (i32.const 7332)
     )
     (i32.store
      (i32.const 7340)
      (i32.const 7332)
     )
     (i32.store
      (i32.const 7352)
      (i32.const 7340)
     )
     (i32.store
      (i32.const 7348)
      (i32.const 7340)
     )
     (i32.store
      (i32.const 7360)
      (i32.const 7348)
     )
     (i32.store
      (i32.const 7356)
      (i32.const 7348)
     )
     (i32.store
      (i32.const 7368)
      (i32.const 7356)
     )
     (i32.store
      (i32.const 7364)
      (i32.const 7356)
     )
     (i32.store
      (i32.const 7376)
      (i32.const 7364)
     )
     (i32.store
      (i32.const 7372)
      (i32.const 7364)
     )
     (i32.store
      (i32.const 7384)
      (i32.const 7372)
     )
     (i32.store
      (i32.const 7380)
      (i32.const 7372)
     )
     (i32.store
      (i32.const 7392)
      (i32.const 7380)
     )
     (i32.store
      (i32.const 7388)
      (i32.const 7380)
     )
     (i32.store
      (i32.const 7400)
      (i32.const 7388)
     )
     (i32.store
      (i32.const 7396)
      (i32.const 7388)
     )
     (i32.store
      (i32.const 7408)
      (i32.const 7396)
     )
     (i32.store
      (i32.const 7404)
      (i32.const 7396)
     )
     (i32.store
      (i32.const 7416)
      (i32.const 7404)
     )
     (i32.store
      (i32.const 7412)
      (i32.const 7404)
     )
     (i32.store
      (i32.const 7424)
      (i32.const 7412)
     )
     (i32.store
      (i32.const 7420)
      (i32.const 7412)
     )
     (i32.store
      (i32.const 7432)
      (i32.const 7420)
     )
     (i32.store
      (i32.const 7428)
      (i32.const 7420)
     )
     (i32.store
      (i32.const 7440)
      (i32.const 7428)
     )
     (i32.store
      (i32.const 7436)
      (i32.const 7428)
     )
     (i32.store
      (i32.const 7164)
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
      (i32.const 7152)
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
      (i32.const 7168)
      (i32.load
       (i32.const 7628)
      )
     )
    )
   )
   (if
    (i32.gt_u
     (local.tee $0
      (i32.load
       (i32.const 7152)
      )
     )
     (local.get $3)
    )
    (block
     (i32.store
      (i32.const 7152)
      (local.tee $1
       (i32.sub
        (local.get $0)
        (local.get $3)
       )
      )
     )
     (i32.store
      (i32.const 7164)
      (local.tee $2
       (i32.add
        (local.get $3)
        (local.tee $0
         (i32.load
          (i32.const 7164)
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
     (global.set $STACKTOP
      (local.get $14)
     )
     (return
      (i32.add
       (local.get $0)
       (i32.const 8)
      )
     )
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
  (i32.const 0)
 )
 (func $_free (; 92 ;) (; has Stack IR ;) (param $0 i32)
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
      (i32.const 7156)
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
       (i32.const 7160)
      )
     )
     (block
      (if
       (i32.ne
        (i32.and
         (local.tee $3
          (i32.load
           (local.tee $1
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
        (local.set $3
         (local.get $0)
        )
        (local.set $1
         (local.get $4)
        )
        (local.set $5
         (local.get $0)
        )
        (br $label$break$L10)
       )
      )
      (i32.store
       (i32.const 7148)
       (local.get $4)
      )
      (i32.store
       (local.get $1)
       (i32.and
        (local.get $3)
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
      (local.set $3
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
        (local.tee $1
         (i32.add
          (i32.shl
           (local.get $2)
           (i32.const 3)
          )
          (i32.const 7180)
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
        (local.get $3)
        (local.get $5)
       )
       (block
        (i32.store
         (i32.const 7140)
         (i32.and
          (i32.load
           (i32.const 7140)
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
        (local.set $3
         (local.get $0)
        )
        (local.set $1
         (local.get $4)
        )
        (local.set $5
         (local.get $0)
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
         (local.get $3)
         (i32.const 8)
        )
       )
       (block
        (if
         (i32.gt_u
          (local.get $12)
          (local.get $3)
         )
         (call $_abort)
        )
        (if
         (i32.eq
          (local.get $0)
          (i32.load
           (local.tee $1
            (i32.add
             (local.get $3)
             (i32.const 8)
            )
           )
          )
         )
         (local.set $6
          (local.get $1)
         )
         (call $_abort)
        )
       )
      )
      (i32.store offset=12
       (local.get $5)
       (local.get $3)
      )
      (i32.store
       (local.get $6)
       (local.get $5)
      )
      (local.set $3
       (local.get $0)
      )
      (local.set $1
       (local.get $4)
      )
      (local.set $5
       (local.get $0)
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
        (local.set $2
         (if (result i32)
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
          (block (result i32)
           (local.set $6
            (local.get $9)
           )
           (local.get $11)
          )
          (block (result i32)
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
           (local.set $6
            (local.get $9)
           )
           (local.get $11)
          )
         )
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
           (i32.const 7444)
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
           (i32.const 7144)
           (i32.and
            (i32.load
             (i32.const 7144)
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
          (local.set $3
           (local.get $0)
          )
          (local.set $1
           (local.get $4)
          )
          (local.set $5
           (local.get $0)
          )
          (br $label$break$L10)
         )
        )
       )
       (if
        (i32.gt_u
         (i32.load
          (i32.const 7156)
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
           (local.set $3
            (local.get $0)
           )
           (local.set $1
            (local.get $4)
           )
           (local.set $5
            (local.get $0)
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
          (i32.const 7156)
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
          (i32.const 7156)
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
         (local.set $3
          (local.get $0)
         )
         (local.set $1
          (local.get $4)
         )
         (local.set $5
          (local.get $0)
         )
        )
       )
       (block
        (local.set $3
         (local.get $0)
        )
        (local.set $1
         (local.get $4)
        )
        (local.set $5
         (local.get $0)
        )
       )
      )
     )
     (block
      (local.set $3
       (local.get $0)
      )
      (local.set $1
       (local.get $4)
      )
      (local.set $5
       (local.get $0)
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
          (i32.const 7164)
         )
        )
        (block
         (i32.store
          (i32.const 7152)
          (local.tee $0
           (i32.add
            (local.get $1)
            (i32.load
             (i32.const 7152)
            )
           )
          )
         )
         (i32.store
          (i32.const 7164)
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
            (i32.const 7160)
           )
           (local.get $3)
          )
          (return)
         )
         (i32.store
          (i32.const 7160)
          (i32.const 0)
         )
         (i32.store
          (i32.const 7148)
          (i32.const 0)
         )
         (return)
        )
       )
       (if
        (i32.eq
         (local.get $7)
         (i32.load
          (i32.const 7160)
         )
        )
        (block
         (i32.store
          (i32.const 7148)
          (local.tee $0
           (i32.add
            (local.get $1)
            (i32.load
             (i32.const 7148)
            )
           )
          )
         )
         (i32.store
          (i32.const 7160)
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
              (i32.const 7180)
             )
            )
           )
           (block
            (if
             (i32.gt_u
              (i32.load
               (i32.const 7156)
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
             (i32.const 7140)
             (i32.and
              (i32.load
               (i32.const 7140)
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
               (i32.const 7156)
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
              (local.set $0
               (if (result i32)
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
                (block (result i32)
                 (local.set $1
                  (local.get $2)
                 )
                 (local.get $6)
                )
                (block (result i32)
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
                 (local.set $1
                  (local.get $2)
                 )
                 (local.get $6)
                )
               )
              )
              (br $while-in9)
             )
            )
            (if
             (i32.gt_u
              (i32.load
               (i32.const 7156)
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
               (i32.const 7156)
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
                 (i32.const 7444)
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
                 (i32.const 7144)
                 (i32.and
                  (i32.load
                   (i32.const 7144)
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
                (i32.const 7156)
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
                (i32.const 7156)
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
                (i32.const 7156)
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
          (i32.const 7160)
         )
        )
        (block
         (i32.store
          (i32.const 7148)
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
      (i32.const 7180)
     )
    )
    (if
     (i32.and
      (local.tee $5
       (i32.load
        (i32.const 7140)
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
        (i32.const 7156)
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
       (i32.const 7140)
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
    (i32.const 7444)
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
      (i32.const 7144)
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
         (i32.const 7156)
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
         (i32.const 7156)
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
     (i32.const 7144)
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
   (i32.const 7172)
   (local.tee $0
    (i32.add
     (i32.load
      (i32.const 7172)
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
   (i32.const 7596)
  )
  (loop $while-in19
   (local.set $0
    (i32.add
     (local.tee $1
      (i32.load
       (local.get $0)
      )
     )
     (i32.const 8)
    )
   )
   (br_if $while-in19
    (local.get $1)
   )
  )
  (i32.store
   (i32.const 7172)
   (i32.const -1)
  )
 )
 (func $_pthread_key_create (; 93 ;) (; has Stack IR ;) (result i32)
  (local $0 i32)
  (i32.store
   (local.tee $0
    (call $_malloc
     (i32.const 8)
    )
   )
   (i32.const 0)
  )
  (i32.store offset=4
   (local.get $0)
   (i32.const 38177486)
  )
  (i32.store
   (i32.const 7640)
   (local.get $0)
  )
  (i32.const 0)
 )
 (func $_pthread_getspecific (; 94 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (if
   (i32.ne
    (i32.load offset=4
     (local.get $0)
    )
    (i32.const 38177486)
   )
   (return
    (i32.const 0)
   )
  )
  (i32.load
   (local.get $0)
  )
 )
 (func $_pthread_setspecific (; 95 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (local $1 i32)
  (if
   (i32.ne
    (i32.load offset=4
     (local.tee $1
      (local.get $0)
     )
    )
    (i32.const 38177486)
   )
   (return
    (i32.const 22)
   )
  )
  (i32.store
   (local.get $1)
   (i32.const 0)
  )
  (i32.const 0)
 )
 (func $_pthread_once (; 96 ;) (; has Stack IR ;) (result i32)
  (if
   (i32.eq
    (i32.load
     (i32.const 7636)
    )
    (i32.const 324508639)
   )
   (return
    (i32.const 0)
   )
  )
  (call_indirect (type $FUNCSIG$v)
   (i32.const 12)
  )
  (i32.store
   (i32.const 7636)
   (i32.const 324508639)
  )
  (i32.const 0)
 )
 (func $__Znwm (; 97 ;) (; has Stack IR ;) (param $0 i32) (result i32)
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
     (local.tee $0
      (call $__ZSt15get_new_handlerv)
     )
     (block
      (call_indirect (type $FUNCSIG$v)
       (i32.add
        (i32.and
         (local.get $0)
         (i32.const 3)
        )
        (i32.const 10)
       )
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
 (func $__ZdlPv (; 98 ;) (; has Stack IR ;) (param $0 i32)
  (call $_free
   (local.get $0)
  )
 )
 (func $__ZL25default_terminate_handlerv (; 99 ;) (; has Stack IR ;)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i64)
  (local.set $0
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 48)
   )
  )
  (local.set $6
   (i32.add
    (local.get $0)
    (i32.const 32)
   )
  )
  (local.set $3
   (i32.add
    (local.get $0)
    (i32.const 24)
   )
  )
  (local.set $2
   (i32.add
    (local.get $0)
    (i32.const 16)
   )
  )
  (local.set $4
   (local.get $0)
  )
  (local.set $5
   (i32.add
    (local.get $0)
    (i32.const 36)
   )
  )
  (if
   (local.tee $0
    (call $___cxa_get_globals_fast)
   )
   (if
    (local.tee $1
     (i32.load
      (local.get $0)
     )
    )
    (block
     (if
      (i64.ne
       (i64.and
        (local.tee $7
         (i64.load offset=48
          (local.get $1)
         )
        )
        (i64.const -256)
       )
       (i64.const 4849336966747728640)
      )
      (block
       (i32.store
        (local.get $3)
        (i32.const 5593)
       )
       (call $_abort_message
        (i32.const 5543)
        (local.get $3)
       )
      )
     )
     (local.set $0
      (i32.add
       (local.get $1)
       (i32.const 80)
      )
     )
     (if
      (i64.eq
       (local.get $7)
       (i64.const 4849336966747728641)
      )
      (local.set $0
       (i32.load offset=44
        (local.get $1)
       )
      )
     )
     (i32.store
      (local.get $5)
      (local.get $0)
     )
     (local.set $0
      (i32.load offset=4
       (local.tee $1
        (i32.load
         (local.get $1)
        )
       )
      )
     )
     (local.set $3
      (i32.load offset=16
       (i32.load
        (i32.const 1584)
       )
      )
     )
     (if
      (call_indirect (type $FUNCSIG$iiii)
       (i32.const 1584)
       (local.get $1)
       (local.get $5)
       (i32.add
        (i32.and
         (local.get $3)
         (i32.const 7)
        )
        (i32.const 2)
       )
      )
      (block
       (local.set $2
        (i32.load offset=8
         (i32.load
          (local.tee $1
           (i32.load
            (local.get $5)
           )
          )
         )
        )
       )
       (local.set $1
        (call_indirect (type $FUNCSIG$ii)
         (local.get $1)
         (i32.and
          (local.get $2)
          (i32.const 1)
         )
        )
       )
       (i32.store
        (local.get $4)
        (i32.const 5593)
       )
       (i32.store offset=4
        (local.get $4)
        (local.get $0)
       )
       (i32.store offset=8
        (local.get $4)
        (local.get $1)
       )
       (call $_abort_message
        (i32.const 5457)
        (local.get $4)
       )
      )
      (block
       (i32.store
        (local.get $2)
        (i32.const 5593)
       )
       (i32.store offset=4
        (local.get $2)
        (local.get $0)
       )
       (call $_abort_message
        (i32.const 5502)
        (local.get $2)
       )
      )
     )
    )
   )
  )
  (call $_abort_message
   (i32.const 5581)
   (local.get $6)
  )
 )
 (func $___cxa_get_globals_fast (; 100 ;) (; has Stack IR ;) (result i32)
  (local $0 i32)
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
  (local.set $0
   (local.get $1)
  )
  (if
   (call $_pthread_once)
   (call $_abort_message
    (i32.const 5732)
    (local.get $0)
   )
   (block
    (local.set $0
     (call $_pthread_getspecific
      (i32.load
       (i32.const 7640)
      )
     )
    )
    (global.set $STACKTOP
     (local.get $1)
    )
    (return
     (local.get $0)
    )
   )
  )
  (i32.const 0)
 )
 (func $_abort_message (; 101 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32)
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
  (drop
   (call $_vfprintf
    (local.tee $1
     (i32.load
      (i32.const 1680)
     )
    )
    (local.get $0)
    (local.get $2)
   )
  )
  (drop
   (call $_fputc
    (local.get $1)
   )
  )
  (call $_abort)
 )
 (func $__ZN10__cxxabiv116__shim_type_infoD2Ev (; 102 ;) (; has Stack IR ;) (param $0 i32)
  (nop)
 )
 (func $__ZN10__cxxabiv117__class_type_infoD0Ev (; 103 ;) (; has Stack IR ;) (param $0 i32)
  (call $__ZN10__cxxabiv116__shim_type_infoD2Ev
   (local.get $0)
  )
  (call $__ZdlPv
   (local.get $0)
  )
 )
 (func $__ZNK10__cxxabiv117__class_type_info9can_catchEPKNS_16__shim_type_infoERPv (; 104 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $5
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.sub
    (global.get $STACKTOP)
    (i32.const -64)
   )
  )
  (local.set $3
   (local.get $5)
  )
  (local.set $0
   (if (result i32)
    (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
     (local.get $0)
     (local.get $1)
    )
    (i32.const 1)
    (if (result i32)
     (local.get $1)
     (if (result i32)
      (local.tee $1
       (call $___dynamic_cast
        (local.get $1)
        (i32.const 1592)
       )
      )
      (block (result i32)
       (i64.store align=4
        (local.tee $4
         (i32.add
          (local.get $3)
          (i32.const 4)
         )
        )
        (i64.const 0)
       )
       (i64.store offset=8 align=4
        (local.get $4)
        (i64.const 0)
       )
       (i64.store offset=16 align=4
        (local.get $4)
        (i64.const 0)
       )
       (i64.store offset=24 align=4
        (local.get $4)
        (i64.const 0)
       )
       (i64.store offset=32 align=4
        (local.get $4)
        (i64.const 0)
       )
       (i64.store offset=40 align=4
        (local.get $4)
        (i64.const 0)
       )
       (i32.store offset=48
        (local.get $4)
        (i32.const 0)
       )
       (i32.store
        (local.get $3)
        (local.get $1)
       )
       (i32.store offset=8
        (local.get $3)
        (local.get $0)
       )
       (i32.store offset=12
        (local.get $3)
        (i32.const -1)
       )
       (i32.store offset=48
        (local.get $3)
        (i32.const 1)
       )
       (local.set $0
        (i32.load offset=28
         (i32.load
          (local.get $1)
         )
        )
       )
       (call_indirect (type $FUNCSIG$viiii)
        (local.get $1)
        (local.get $3)
        (i32.load
         (local.get $2)
        )
        (i32.const 1)
        (i32.add
         (i32.and
          (local.get $0)
          (i32.const 3)
         )
         (i32.const 22)
        )
       )
       (if (result i32)
        (i32.eq
         (i32.load offset=24
          (local.get $3)
         )
         (i32.const 1)
        )
        (block (result i32)
         (i32.store
          (local.get $2)
          (i32.load offset=16
           (local.get $3)
          )
         )
         (i32.const 1)
        )
        (i32.const 0)
       )
      )
      (i32.const 0)
     )
     (i32.const 0)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $5)
  )
  (local.get $0)
 )
 (func $__ZNK10__cxxabiv117__class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib (; 105 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (if
   (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
    (local.get $0)
    (i32.load offset=8
     (local.get $1)
    )
   )
   (call $__ZNK10__cxxabiv117__class_type_info29process_static_type_above_dstEPNS_19__dynamic_cast_infoEPKvS4_i
    (local.get $1)
    (local.get $2)
    (local.get $3)
    (local.get $4)
   )
  )
 )
 (func $__ZNK10__cxxabiv117__class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib (; 106 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (if
   (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
    (local.get $0)
    (i32.load offset=8
     (local.get $1)
    )
   )
   (call $__ZNK10__cxxabiv117__class_type_info29process_static_type_below_dstEPNS_19__dynamic_cast_infoEPKvi
    (local.get $1)
    (local.get $2)
    (local.get $3)
   )
   (if
    (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
     (local.get $0)
     (i32.load
      (local.get $1)
     )
    )
    (block $do-once
     (if
      (i32.ne
       (i32.load offset=16
        (local.get $1)
       )
       (local.get $2)
      )
      (if
       (i32.ne
        (i32.load
         (local.tee $0
          (i32.add
           (local.get $1)
           (i32.const 20)
          )
         )
        )
        (local.get $2)
       )
       (block
        (i32.store offset=32
         (local.get $1)
         (local.get $3)
        )
        (i32.store
         (local.get $0)
         (local.get $2)
        )
        (i32.store
         (local.tee $0
          (i32.add
           (local.get $1)
           (i32.const 40)
          )
         )
         (i32.add
          (i32.load
           (local.get $0)
          )
          (i32.const 1)
         )
        )
        (if
         (i32.eq
          (i32.load offset=36
           (local.get $1)
          )
          (i32.const 1)
         )
         (if
          (i32.eq
           (i32.load offset=24
            (local.get $1)
           )
           (i32.const 2)
          )
          (i32.store8 offset=54
           (local.get $1)
           (i32.const 1)
          )
         )
        )
        (i32.store offset=44
         (local.get $1)
         (i32.const 4)
        )
        (br $do-once)
       )
      )
     )
     (if
      (i32.eq
       (local.get $3)
       (i32.const 1)
      )
      (i32.store offset=32
       (local.get $1)
       (i32.const 1)
      )
     )
    )
   )
  )
 )
 (func $__ZNK10__cxxabiv117__class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi (; 107 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (if
   (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
    (local.get $0)
    (i32.load offset=8
     (local.get $1)
    )
   )
   (call $__ZNK10__cxxabiv117__class_type_info24process_found_base_classEPNS_19__dynamic_cast_infoEPvi
    (local.get $1)
    (local.get $2)
    (local.get $3)
   )
  )
 )
 (func $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b (; 108 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (i32.eq
   (local.get $0)
   (local.get $1)
  )
 )
 (func $__ZNK10__cxxabiv117__class_type_info24process_found_base_classEPNS_19__dynamic_cast_infoEPvi (; 109 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (if
   (local.tee $4
    (i32.load
     (local.tee $3
      (i32.add
       (local.get $0)
       (i32.const 16)
      )
     )
    )
   )
   (block $do-once
    (if
     (i32.ne
      (local.get $1)
      (local.get $4)
     )
     (block
      (i32.store
       (local.tee $3
        (i32.add
         (local.get $0)
         (i32.const 36)
        )
       )
       (i32.add
        (i32.load
         (local.get $3)
        )
        (i32.const 1)
       )
      )
      (i32.store offset=24
       (local.get $0)
       (i32.const 2)
      )
      (i32.store8 offset=54
       (local.get $0)
       (i32.const 1)
      )
      (br $do-once)
     )
    )
    (if
     (i32.eq
      (i32.load
       (local.tee $3
        (i32.add
         (local.get $0)
         (i32.const 24)
        )
       )
      )
      (i32.const 2)
     )
     (i32.store
      (local.get $3)
      (local.get $2)
     )
    )
   )
   (block
    (i32.store
     (local.get $3)
     (local.get $1)
    )
    (i32.store offset=24
     (local.get $0)
     (local.get $2)
    )
    (i32.store offset=36
     (local.get $0)
     (i32.const 1)
    )
   )
  )
 )
 (func $__ZNK10__cxxabiv117__class_type_info29process_static_type_below_dstEPNS_19__dynamic_cast_infoEPKvi (; 110 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (if
   (i32.eq
    (local.get $1)
    (i32.load offset=4
     (local.get $0)
    )
   )
   (if
    (i32.ne
     (i32.load
      (local.tee $3
       (i32.add
        (local.get $0)
        (i32.const 28)
       )
      )
     )
     (i32.const 1)
    )
    (i32.store
     (local.get $3)
     (local.get $2)
    )
   )
  )
 )
 (func $__ZNK10__cxxabiv117__class_type_info29process_static_type_above_dstEPNS_19__dynamic_cast_infoEPKvS4_i (; 111 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (i32.store8 offset=53
   (local.get $0)
   (i32.const 1)
  )
  (if
   (i32.eq
    (local.get $2)
    (i32.load offset=4
     (local.get $0)
    )
   )
   (block $do-once
    (i32.store8 offset=52
     (local.get $0)
     (i32.const 1)
    )
    (if
     (i32.eqz
      (local.tee $2
       (i32.load
        (local.tee $4
         (i32.add
          (local.get $0)
          (i32.const 16)
         )
        )
       )
      )
     )
     (block
      (i32.store
       (local.get $4)
       (local.get $1)
      )
      (i32.store offset=24
       (local.get $0)
       (local.get $3)
      )
      (i32.store offset=36
       (local.get $0)
       (i32.const 1)
      )
      (br_if $do-once
       (i32.eqz
        (i32.and
         (i32.eq
          (i32.load offset=48
           (local.get $0)
          )
          (i32.const 1)
         )
         (i32.eq
          (local.get $3)
          (i32.const 1)
         )
        )
       )
      )
      (i32.store8 offset=54
       (local.get $0)
       (i32.const 1)
      )
      (br $do-once)
     )
    )
    (if
     (i32.ne
      (local.get $1)
      (local.get $2)
     )
     (block
      (i32.store
       (local.tee $4
        (i32.add
         (local.get $0)
         (i32.const 36)
        )
       )
       (i32.add
        (i32.load
         (local.get $4)
        )
        (i32.const 1)
       )
      )
      (i32.store8 offset=54
       (local.get $0)
       (i32.const 1)
      )
      (br $do-once)
     )
    )
    (if
     (i32.eq
      (local.tee $4
       (i32.load
        (local.tee $1
         (i32.add
          (local.get $0)
          (i32.const 24)
         )
        )
       )
      )
      (i32.const 2)
     )
     (i32.store
      (local.get $1)
      (local.get $3)
     )
     (local.set $3
      (local.get $4)
     )
    )
    (if
     (i32.and
      (i32.eq
       (i32.load offset=48
        (local.get $0)
       )
       (i32.const 1)
      )
      (i32.eq
       (local.get $3)
       (i32.const 1)
      )
     )
     (i32.store8 offset=54
      (local.get $0)
      (i32.const 1)
     )
    )
   )
  )
 )
 (func $___dynamic_cast (; 112 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local.set $6
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.sub
    (global.get $STACKTOP)
    (i32.const -64)
   )
  )
  (local.set $5
   (i32.add
    (local.get $0)
    (i32.load
     (i32.add
      (local.tee $2
       (i32.load
        (local.get $0)
       )
      )
      (i32.const -8)
     )
    )
   )
  )
  (local.set $4
   (i32.load
    (i32.add
     (local.get $2)
     (i32.const -4)
    )
   )
  )
  (i32.store
   (local.tee $2
    (local.get $6)
   )
   (local.get $1)
  )
  (i32.store offset=4
   (local.get $2)
   (local.get $0)
  )
  (i32.store offset=8
   (local.get $2)
   (i32.const 1608)
  )
  (i32.store offset=12
   (local.get $2)
   (i32.const 0)
  )
  (local.set $0
   (i32.add
    (local.get $2)
    (i32.const 20)
   )
  )
  (local.set $7
   (i32.add
    (local.get $2)
    (i32.const 24)
   )
  )
  (local.set $8
   (i32.add
    (local.get $2)
    (i32.const 28)
   )
  )
  (local.set $9
   (i32.add
    (local.get $2)
    (i32.const 32)
   )
  )
  (local.set $10
   (i32.add
    (local.get $2)
    (i32.const 40)
   )
  )
  (i64.store align=4
   (local.tee $3
    (i32.add
     (local.get $2)
     (i32.const 16)
    )
   )
   (i64.const 0)
  )
  (i64.store offset=8 align=4
   (local.get $3)
   (i64.const 0)
  )
  (i64.store offset=16 align=4
   (local.get $3)
   (i64.const 0)
  )
  (i64.store offset=24 align=4
   (local.get $3)
   (i64.const 0)
  )
  (i32.store offset=32
   (local.get $3)
   (i32.const 0)
  )
  (i32.store16 offset=36
   (local.get $3)
   (i32.const 0)
  )
  (i32.store8 offset=38
   (local.get $3)
   (i32.const 0)
  )
  (local.set $0
   (if (result i32)
    (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
     (local.get $4)
     (local.get $1)
    )
    (block (result i32)
     (i32.store offset=48
      (local.get $2)
      (i32.const 1)
     )
     (call_indirect (type $FUNCSIG$viiiiii)
      (local.get $4)
      (local.get $2)
      (local.get $5)
      (local.get $5)
      (i32.const 1)
      (i32.const 0)
      (i32.add
       (i32.and
        (i32.load offset=20
         (i32.load
          (local.get $4)
         )
        )
        (i32.const 3)
       )
       (i32.const 30)
      )
     )
     (select
      (local.get $5)
      (i32.const 0)
      (i32.eq
       (i32.load
        (local.get $7)
       )
       (i32.const 1)
      )
     )
    )
    (block $label$break$L1 (result i32)
     (call_indirect (type $FUNCSIG$viiiii)
      (local.get $4)
      (local.get $2)
      (local.get $5)
      (i32.const 1)
      (i32.const 0)
      (i32.add
       (i32.and
        (i32.load offset=24
         (i32.load
          (local.get $4)
         )
        )
        (i32.const 3)
       )
       (i32.const 26)
      )
     )
     (block $switch
      (block $switch-default
       (block $switch-case
        (br_table $switch-case $switch $switch-default
         (i32.load
          (i32.add
           (local.get $2)
           (i32.const 36)
          )
         )
        )
       )
       (br $label$break$L1
        (select
         (i32.load
          (local.get $0)
         )
         (i32.const 0)
         (i32.and
          (i32.and
           (i32.eq
            (i32.load
             (local.get $10)
            )
            (i32.const 1)
           )
           (i32.eq
            (i32.load
             (local.get $8)
            )
            (i32.const 1)
           )
          )
          (i32.eq
           (i32.load
            (local.get $9)
           )
           (i32.const 1)
          )
         )
        )
       )
      )
      (br $label$break$L1
       (i32.const 0)
      )
     )
     (if
      (i32.ne
       (i32.load
        (local.get $7)
       )
       (i32.const 1)
      )
      (drop
       (br_if $label$break$L1
        (i32.const 0)
        (i32.eqz
         (i32.and
          (i32.and
           (i32.eqz
            (i32.load
             (local.get $10)
            )
           )
           (i32.eq
            (i32.load
             (local.get $8)
            )
            (i32.const 1)
           )
          )
          (i32.eq
           (i32.load
            (local.get $9)
           )
           (i32.const 1)
          )
         )
        )
       )
      )
     )
     (i32.load
      (local.get $3)
     )
    )
   )
  )
  (global.set $STACKTOP
   (local.get $6)
  )
  (local.get $0)
 )
 (func $__ZNK10__cxxabiv120__si_class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib (; 113 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (local $6 i32)
  (if
   (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
    (local.get $0)
    (i32.load offset=8
     (local.get $1)
    )
   )
   (call $__ZNK10__cxxabiv117__class_type_info29process_static_type_above_dstEPNS_19__dynamic_cast_infoEPKvS4_i
    (local.get $1)
    (local.get $2)
    (local.get $3)
    (local.get $4)
   )
   (block
    (local.set $6
     (i32.load offset=20
      (i32.load
       (local.tee $0
        (i32.load offset=8
         (local.get $0)
        )
       )
      )
     )
    )
    (call_indirect (type $FUNCSIG$viiiiii)
     (local.get $0)
     (local.get $1)
     (local.get $2)
     (local.get $3)
     (local.get $4)
     (local.get $5)
     (i32.add
      (i32.and
       (local.get $6)
       (i32.const 3)
      )
      (i32.const 30)
     )
    )
   )
  )
 )
 (func $__ZNK10__cxxabiv120__si_class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib (; 114 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (if
   (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
    (local.get $0)
    (i32.load offset=8
     (local.get $1)
    )
   )
   (call $__ZNK10__cxxabiv117__class_type_info29process_static_type_below_dstEPNS_19__dynamic_cast_infoEPKvi
    (local.get $1)
    (local.get $2)
    (local.get $3)
   )
   (block $do-once
    (if
     (i32.eqz
      (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
       (local.get $0)
       (i32.load
        (local.get $1)
       )
      )
     )
     (block
      (local.set $5
       (i32.load offset=24
        (i32.load
         (local.tee $0
          (i32.load offset=8
           (local.get $0)
          )
         )
        )
       )
      )
      (call_indirect (type $FUNCSIG$viiiii)
       (local.get $0)
       (local.get $1)
       (local.get $2)
       (local.get $3)
       (local.get $4)
       (i32.add
        (i32.and
         (local.get $5)
         (i32.const 3)
        )
        (i32.const 26)
       )
      )
      (br $do-once)
     )
    )
    (if
     (i32.ne
      (i32.load offset=16
       (local.get $1)
      )
      (local.get $2)
     )
     (if
      (i32.ne
       (i32.load
        (local.tee $5
         (i32.add
          (local.get $1)
          (i32.const 20)
         )
        )
       )
       (local.get $2)
      )
      (block
       (i32.store offset=32
        (local.get $1)
        (local.get $3)
       )
       (br_if $do-once
        (i32.eq
         (i32.load
          (local.tee $3
           (i32.add
            (local.get $1)
            (i32.const 44)
           )
          )
         )
         (i32.const 4)
        )
       )
       (i32.store8
        (local.tee $6
         (i32.add
          (local.get $1)
          (i32.const 52)
         )
        )
        (i32.const 0)
       )
       (i32.store8
        (local.tee $7
         (i32.add
          (local.get $1)
          (i32.const 53)
         )
        )
        (i32.const 0)
       )
       (local.set $8
        (i32.load offset=20
         (i32.load
          (local.tee $0
           (i32.load offset=8
            (local.get $0)
           )
          )
         )
        )
       )
       (call_indirect (type $FUNCSIG$viiiiii)
        (local.get $0)
        (local.get $1)
        (local.get $2)
        (local.get $2)
        (i32.const 1)
        (local.get $4)
        (i32.add
         (i32.and
          (local.get $8)
          (i32.const 3)
         )
         (i32.const 30)
        )
       )
       (i32.store
        (local.get $3)
        (block $__rjto$1 (result i32)
         (block $__rjti$1
          (local.set $0
           (if (result i32)
            (i32.load8_s
             (local.get $7)
            )
            (block (result i32)
             (br_if $__rjti$1
              (i32.load8_s
               (local.get $6)
              )
             )
             (i32.const 1)
            )
            (i32.const 0)
           )
          )
          (i32.store
           (local.get $5)
           (local.get $2)
          )
          (i32.store
           (local.tee $2
            (i32.add
             (local.get $1)
             (i32.const 40)
            )
           )
           (i32.add
            (i32.load
             (local.get $2)
            )
            (i32.const 1)
           )
          )
          (if
           (i32.eq
            (i32.load offset=36
             (local.get $1)
            )
            (i32.const 1)
           )
           (if
            (i32.eq
             (i32.load offset=24
              (local.get $1)
             )
             (i32.const 2)
            )
            (block
             (i32.store8 offset=54
              (local.get $1)
              (i32.const 1)
             )
             (br_if $__rjti$1
              (local.get $0)
             )
             (br $__rjto$1
              (i32.const 4)
             )
            )
           )
          )
          (br_if $__rjti$1
           (local.get $0)
          )
          (br $__rjto$1
           (i32.const 4)
          )
         )
         (i32.const 3)
        )
       )
       (br $do-once)
      )
     )
    )
    (if
     (i32.eq
      (local.get $3)
      (i32.const 1)
     )
     (i32.store offset=32
      (local.get $1)
      (i32.const 1)
     )
    )
   )
  )
 )
 (func $__ZNK10__cxxabiv120__si_class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi (; 115 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (if
   (call $__ZN10__cxxabiv18is_equalEPKSt9type_infoS2_b
    (local.get $0)
    (i32.load offset=8
     (local.get $1)
    )
   )
   (call $__ZNK10__cxxabiv117__class_type_info24process_found_base_classEPNS_19__dynamic_cast_infoEPvi
    (local.get $1)
    (local.get $2)
    (local.get $3)
   )
   (block
    (local.set $4
     (i32.load offset=28
      (i32.load
       (local.tee $0
        (i32.load offset=8
         (local.get $0)
        )
       )
      )
     )
    )
    (call_indirect (type $FUNCSIG$viiii)
     (local.get $0)
     (local.get $1)
     (local.get $2)
     (local.get $3)
     (i32.add
      (i32.and
       (local.get $4)
       (i32.const 3)
      )
      (i32.const 22)
     )
    )
   )
  )
 )
 (func $__ZN10__cxxabiv112_GLOBAL__N_110construct_Ev (; 116 ;) (; has Stack IR ;)
  (local $0 i32)
  (local $1 i32)
  (local.set $0
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (local.set $1
   (local.get $0)
  )
  (if
   (call $_pthread_key_create)
   (call $_abort_message
    (i32.const 5781)
    (local.get $1)
   )
   (global.set $STACKTOP
    (local.get $0)
   )
  )
 )
 (func $__ZN10__cxxabiv112_GLOBAL__N_19destruct_EPv (; 117 ;) (; has Stack IR ;) (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local.set $1
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (local.set $2
   (local.get $1)
  )
  (call $_free
   (local.get $0)
  )
  (if
   (call $_pthread_setspecific
    (i32.load
     (i32.const 7640)
    )
   )
   (call $_abort_message
    (i32.const 5831)
    (local.get $2)
   )
   (global.set $STACKTOP
    (local.get $1)
   )
  )
 )
 (func $__ZSt15get_new_handlerv (; 118 ;) (; has Stack IR ;) (result i32)
  (local $0 i32)
  (i32.store
   (i32.const 7644)
   (local.tee $0
    (i32.load
     (i32.const 7644)
    )
   )
  )
  (local.get $0)
 )
 (func $___cxa_can_catch (; 119 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local.set $3
   (global.get $STACKTOP)
  )
  (global.set $STACKTOP
   (i32.add
    (global.get $STACKTOP)
    (i32.const 16)
   )
  )
  (i32.store
   (local.tee $4
    (local.get $3)
   )
   (i32.load
    (local.get $2)
   )
  )
  (local.set $5
   (i32.load offset=16
    (i32.load
     (local.get $0)
    )
   )
  )
  (if
   (local.tee $0
    (call_indirect (type $FUNCSIG$iiii)
     (local.get $0)
     (local.get $1)
     (local.get $3)
     (i32.add
      (i32.and
       (local.get $5)
       (i32.const 7)
      )
      (i32.const 2)
     )
    )
   )
   (i32.store
    (local.get $2)
    (i32.load
     (local.get $4)
    )
   )
  )
  (global.set $STACKTOP
   (local.get $3)
  )
  (i32.and
   (local.get $0)
   (i32.const 1)
  )
 )
 (func $___cxa_is_pointer_type (; 120 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (if (result i32)
   (local.get $0)
   (i32.ne
    (call $___dynamic_cast
     (local.get $0)
     (i32.const 1664)
    )
    (i32.const 0)
   )
   (i32.const 0)
  )
 )
 (func $_memcpy (; 121 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $_memset (; 122 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
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
 (func $_sbrk (; 123 ;) (; has Stack IR ;) (param $0 i32) (result i32)
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
 (func $dynCall_ii (; 124 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (result i32)
  (call_indirect (type $FUNCSIG$ii)
   (local.get $1)
   (i32.and
    (local.get $0)
    (i32.const 1)
   )
  )
 )
 (func $dynCall_iiii (; 125 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (call_indirect (type $FUNCSIG$iiii)
   (local.get $1)
   (local.get $2)
   (local.get $3)
   (i32.add
    (i32.and
     (local.get $0)
     (i32.const 7)
    )
    (i32.const 2)
   )
  )
 )
 (func $dynCall_v (; 126 ;) (; has Stack IR ;) (param $0 i32)
  (call_indirect (type $FUNCSIG$v)
   (i32.add
    (i32.and
     (local.get $0)
     (i32.const 3)
    )
    (i32.const 10)
   )
  )
 )
 (func $dynCall_vi (; 127 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32)
  (call_indirect (type $FUNCSIG$vi)
   (local.get $1)
   (i32.add
    (i32.and
     (local.get $0)
     (i32.const 7)
    )
    (i32.const 14)
   )
  )
 )
 (func $dynCall_viiii (; 128 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (call_indirect (type $FUNCSIG$viiii)
   (local.get $1)
   (local.get $2)
   (local.get $3)
   (local.get $4)
   (i32.add
    (i32.and
     (local.get $0)
     (i32.const 3)
    )
    (i32.const 22)
   )
  )
 )
 (func $dynCall_viiiii (; 129 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (call_indirect (type $FUNCSIG$viiiii)
   (local.get $1)
   (local.get $2)
   (local.get $3)
   (local.get $4)
   (local.get $5)
   (i32.add
    (i32.and
     (local.get $0)
     (i32.const 3)
    )
    (i32.const 26)
   )
  )
 )
 (func $dynCall_viiiiii (; 130 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32)
  (call_indirect (type $FUNCSIG$viiiiii)
   (local.get $1)
   (local.get $2)
   (local.get $3)
   (local.get $4)
   (local.get $5)
   (local.get $6)
   (i32.add
    (i32.and
     (local.get $0)
     (i32.const 3)
    )
    (i32.const 30)
   )
  )
 )
 (func $b0 (; 131 ;) (; has Stack IR ;) (param $0 i32) (result i32)
  (call $abort
   (i32.const 0)
  )
  (i32.const 0)
 )
 (func $b1 (; 132 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (call $abort
   (i32.const 1)
  )
  (i32.const 0)
 )
 (func $b2 (; 133 ;) (; has Stack IR ;)
  (call $abort
   (i32.const 2)
  )
 )
 (func $b3 (; 134 ;) (; has Stack IR ;) (param $0 i32)
  (call $abort
   (i32.const 3)
  )
 )
 (func $b4 (; 135 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (call $abort
   (i32.const 4)
  )
 )
 (func $b5 (; 136 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (call $abort
   (i32.const 5)
  )
 )
 (func $b6 (; 137 ;) (; has Stack IR ;) (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (call $abort
   (i32.const 6)
  )
 )
)
