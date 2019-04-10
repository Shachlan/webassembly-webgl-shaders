// Copyright 2010 The Emscripten Authors.  All rights reserved.
// Emscripten is available under two separate licenses, the MIT license and the
// University of Illinois/NCSA Open Source License.  Both these licenses can be
// found in the LICENSE file.

// The Module object: Our interface to the outside world. We import
// and export values on it. There are various ways Module can be used:
// 1. Not defined. We create it here
// 2. A function parameter, function(Module) { ..generated code.. }
// 3. pre-run appended it, var Module = {}; ..generated code..
// 4. External script tag defines var Module.
// We need to check if Module already exists (e.g. case 3 above).
// Substitution will be replaced with actual code on later stage of the build,
// this way Closure Compiler will not mangle it (e.g. case 4. above).
// Note that if you want to run closure, and also to use Module
// after the generated code, you will need to define   var Module = {};
// before the code. Then that object will be used in the code, and you
// can continue to use Module afterwards as well.
var Module = typeof Module !== 'undefined' ? Module : {};

// --pre-jses are emitted after the Module integration code, so that they can
// refer to Module (if they choose; they can also define Module)
// {{PRE_JSES}}

// Sometimes an existing Module object exists with properties
// meant to overwrite the default module functionality. Here
// we collect those properties and reapply _after_ we configure
// the current environment's defaults to avoid having to be so
// defensive during initialization.
var moduleOverrides = {};
var key;
for (key in Module) {
  if (Module.hasOwnProperty(key)) {
    moduleOverrides[key] = Module[key];
  }
}

Module['arguments'] = [];
Module['thisProgram'] = './this.program';
Module['quit'] = function(status, toThrow) {
  throw toThrow;
};
Module['preRun'] = [];
Module['postRun'] = [];

// Determine the runtime environment we are in. You can customize this by
// setting the ENVIRONMENT setting at compile time (see settings.js).

var ENVIRONMENT_IS_WEB = false;
var ENVIRONMENT_IS_WORKER = false;
var ENVIRONMENT_IS_NODE = false;
var ENVIRONMENT_IS_SHELL = false;
ENVIRONMENT_IS_WEB = typeof window === 'object';
ENVIRONMENT_IS_WORKER = typeof importScripts === 'function';
ENVIRONMENT_IS_NODE = typeof process === 'object' && typeof require === 'function' && !ENVIRONMENT_IS_WEB && !ENVIRONMENT_IS_WORKER;
ENVIRONMENT_IS_SHELL = !ENVIRONMENT_IS_WEB && !ENVIRONMENT_IS_NODE && !ENVIRONMENT_IS_WORKER;



// Three configurations we can be running in:
// 1) We could be the application main() thread running in the main JS UI thread. (ENVIRONMENT_IS_WORKER == false and ENVIRONMENT_IS_PTHREAD == false)
// 2) We could be the application main() thread proxied to worker. (with Emscripten -s PROXY_TO_WORKER=1) (ENVIRONMENT_IS_WORKER == true, ENVIRONMENT_IS_PTHREAD == false)
// 3) We could be an application pthread running in a worker. (ENVIRONMENT_IS_WORKER == true and ENVIRONMENT_IS_PTHREAD == true)




// `/` should be present at the end if `scriptDirectory` is not empty
var scriptDirectory = '';
function locateFile(path) {
  if (Module['locateFile']) {
    return Module['locateFile'](path, scriptDirectory);
  } else {
    return scriptDirectory + path;
  }
}

if (ENVIRONMENT_IS_NODE) {
  scriptDirectory = __dirname + '/';

  // Expose functionality in the same simple way that the shells work
  // Note that we pollute the global namespace here, otherwise we break in node
  var nodeFS;
  var nodePath;

  Module['read'] = function shell_read(filename, binary) {
    var ret;
      if (!nodeFS) nodeFS = require('fs');
      if (!nodePath) nodePath = require('path');
      filename = nodePath['normalize'](filename);
      ret = nodeFS['readFileSync'](filename);
    return binary ? ret : ret.toString();
  };

  Module['readBinary'] = function readBinary(filename) {
    var ret = Module['read'](filename, true);
    if (!ret.buffer) {
      ret = new Uint8Array(ret);
    }
    assert(ret.buffer);
    return ret;
  };

  if (process['argv'].length > 1) {
    Module['thisProgram'] = process['argv'][1].replace(/\\/g, '/');
  }

  Module['arguments'] = process['argv'].slice(2);

  if (typeof module !== 'undefined') {
    module['exports'] = Module;
  }

  process['on']('uncaughtException', function(ex) {
    // suppress ExitStatus exceptions from showing an error
    if (!(ex instanceof ExitStatus)) {
      throw ex;
    }
  });
  // Currently node will swallow unhandled rejections, but this behavior is
  // deprecated, and in the future it will exit with error status.
  process['on']('unhandledRejection', abort);

  Module['quit'] = function(status) {
    process['exit'](status);
  };

  Module['inspect'] = function () { return '[Emscripten Module object]'; };
} else
if (ENVIRONMENT_IS_SHELL) {


  if (typeof read != 'undefined') {
    Module['read'] = function shell_read(f) {
      return read(f);
    };
  }

  Module['readBinary'] = function readBinary(f) {
    var data;
    if (typeof readbuffer === 'function') {
      return new Uint8Array(readbuffer(f));
    }
    data = read(f, 'binary');
    assert(typeof data === 'object');
    return data;
  };

  if (typeof scriptArgs != 'undefined') {
    Module['arguments'] = scriptArgs;
  } else if (typeof arguments != 'undefined') {
    Module['arguments'] = arguments;
  }

  if (typeof quit === 'function') {
    Module['quit'] = function(status) {
      quit(status);
    }
  }
} else
if (ENVIRONMENT_IS_WEB || ENVIRONMENT_IS_WORKER) {
  if (ENVIRONMENT_IS_WORKER) { // Check worker, not web, since window could be polyfilled
    scriptDirectory = self.location.href;
  } else if (document.currentScript) { // web
    scriptDirectory = document.currentScript.src;
  }
  // blob urls look like blob:http://site.com/etc/etc and we cannot infer anything from them.
  // otherwise, slice off the final part of the url to find the script directory.
  // if scriptDirectory does not contain a slash, lastIndexOf will return -1,
  // and scriptDirectory will correctly be replaced with an empty string.
  if (scriptDirectory.indexOf('blob:') !== 0) {
    scriptDirectory = scriptDirectory.substr(0, scriptDirectory.lastIndexOf('/')+1);
  } else {
    scriptDirectory = '';
  }


  Module['read'] = function shell_read(url) {
      var xhr = new XMLHttpRequest();
      xhr.open('GET', url, false);
      xhr.send(null);
      return xhr.responseText;
  };

  if (ENVIRONMENT_IS_WORKER) {
    Module['readBinary'] = function readBinary(url) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, false);
        xhr.responseType = 'arraybuffer';
        xhr.send(null);
        return new Uint8Array(xhr.response);
    };
  }

  Module['readAsync'] = function readAsync(url, onload, onerror) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', url, true);
    xhr.responseType = 'arraybuffer';
    xhr.onload = function xhr_onload() {
      if (xhr.status == 200 || (xhr.status == 0 && xhr.response)) { // file URLs can return 0
        onload(xhr.response);
        return;
      }
      onerror();
    };
    xhr.onerror = onerror;
    xhr.send(null);
  };

  Module['setWindowTitle'] = function(title) { document.title = title };
} else
{
}

// Set up the out() and err() hooks, which are how we can print to stdout or
// stderr, respectively.
// If the user provided Module.print or printErr, use that. Otherwise,
// console.log is checked first, as 'print' on the web will open a print dialogue
// printErr is preferable to console.warn (works better in shells)
// bind(console) is necessary to fix IE/Edge closed dev tools panel behavior.
var out = Module['print'] || (typeof console !== 'undefined' ? console.log.bind(console) : (typeof print !== 'undefined' ? print : null));
var err = Module['printErr'] || (typeof printErr !== 'undefined' ? printErr : ((typeof console !== 'undefined' && console.warn.bind(console)) || out));

// Merge back in the overrides
for (key in moduleOverrides) {
  if (moduleOverrides.hasOwnProperty(key)) {
    Module[key] = moduleOverrides[key];
  }
}
// Free the object hierarchy contained in the overrides, this lets the GC
// reclaim data used e.g. in memoryInitializerRequest, which is a large typed array.
moduleOverrides = undefined;

// perform assertions in shell.js after we set up out() and err(), as otherwise if an assertion fails it cannot print the message



// Copyright 2017 The Emscripten Authors.  All rights reserved.
// Emscripten is available under two separate licenses, the MIT license and the
// University of Illinois/NCSA Open Source License.  Both these licenses can be
// found in the LICENSE file.

// {{PREAMBLE_ADDITIONS}}

var STACK_ALIGN = 16;


function dynamicAlloc(size) {
  var ret = HEAP32[DYNAMICTOP_PTR>>2];
  var end = (ret + size + 15) & -16;
  if (end <= _emscripten_get_heap_size()) {
    HEAP32[DYNAMICTOP_PTR>>2] = end;
  } else {
    var success = _emscripten_resize_heap(end);
    if (!success) return 0;
  }
  return ret;
}

function alignMemory(size, factor) {
  if (!factor) factor = STACK_ALIGN; // stack alignment (16-byte) by default
  return Math.ceil(size / factor) * factor;
}

function getNativeTypeSize(type) {
  switch (type) {
    case 'i1': case 'i8': return 1;
    case 'i16': return 2;
    case 'i32': return 4;
    case 'i64': return 8;
    case 'float': return 4;
    case 'double': return 8;
    default: {
      if (type[type.length-1] === '*') {
        return 4; // A pointer
      } else if (type[0] === 'i') {
        var bits = parseInt(type.substr(1));
        assert(bits % 8 === 0, 'getNativeTypeSize invalid bits ' + bits + ', type ' + type);
        return bits / 8;
      } else {
        return 0;
      }
    }
  }
}

function warnOnce(text) {
  if (!warnOnce.shown) warnOnce.shown = {};
  if (!warnOnce.shown[text]) {
    warnOnce.shown[text] = 1;
    err(text);
  }
}

var asm2wasmImports = { // special asm2wasm imports
    "f64-rem": function(x, y) {
        return x % y;
    },
    "debugger": function() {
        debugger;
    }
};



var jsCallStartIndex = 1;
var functionPointers = new Array(0);


// 'sig' parameter is currently only used for LLVM backend under certain
// circumstance: RESERVED_FUNCTION_POINTERS=1, EMULATED_FUNCTION_POINTERS=0.
function addFunction(func, sig) {

  var base = 0;
  for (var i = base; i < base + 0; i++) {
    if (!functionPointers[i]) {
      functionPointers[i] = func;
      return jsCallStartIndex + i;
    }
  }
  throw 'Finished up all reserved function pointers. Use a higher value for RESERVED_FUNCTION_POINTERS.';

}

function removeFunction(index) {
  functionPointers[index-jsCallStartIndex] = null;
}

var funcWrappers = {};

function getFuncWrapper(func, sig) {
  if (!func) return; // on null pointer, return undefined
  assert(sig);
  if (!funcWrappers[sig]) {
    funcWrappers[sig] = {};
  }
  var sigCache = funcWrappers[sig];
  if (!sigCache[func]) {
    // optimize away arguments usage in common cases
    if (sig.length === 1) {
      sigCache[func] = function dynCall_wrapper() {
        return dynCall(sig, func);
      };
    } else if (sig.length === 2) {
      sigCache[func] = function dynCall_wrapper(arg) {
        return dynCall(sig, func, [arg]);
      };
    } else {
      // general case
      sigCache[func] = function dynCall_wrapper() {
        return dynCall(sig, func, Array.prototype.slice.call(arguments));
      };
    }
  }
  return sigCache[func];
}


function makeBigInt(low, high, unsigned) {
  return unsigned ? ((+((low>>>0)))+((+((high>>>0)))*4294967296.0)) : ((+((low>>>0)))+((+((high|0)))*4294967296.0));
}

function dynCall(sig, ptr, args) {
  if (args && args.length) {
    return Module['dynCall_' + sig].apply(null, [ptr].concat(args));
  } else {
    return Module['dynCall_' + sig].call(null, ptr);
  }
}

var tempRet0 = 0;

var setTempRet0 = function(value) {
  tempRet0 = value;
}

var getTempRet0 = function() {
  return tempRet0;
}


var Runtime = {
};

// The address globals begin at. Very low in memory, for code size and optimization opportunities.
// Above 0 is static memory, starting with globals.
// Then the stack.
// Then 'dynamic' memory for sbrk.
var GLOBAL_BASE = 8;




// === Preamble library stuff ===

// Documentation for the public APIs defined in this file must be updated in:
//    site/source/docs/api_reference/preamble.js.rst
// A prebuilt local version of the documentation is available at:
//    site/build/text/docs/api_reference/preamble.js.txt
// You can also build docs locally as HTML or other formats in site/
// An online HTML version (which may be of a different version of Emscripten)
//    is up at http://kripken.github.io/emscripten-site/docs/api_reference/preamble.js.html




/** @type {function(number, string, boolean=)} */
function getValue(ptr, type, noSafe) {
  type = type || 'i8';
  if (type.charAt(type.length-1) === '*') type = 'i32'; // pointers are 32-bit
    switch(type) {
      case 'i1': return HEAP8[((ptr)>>0)];
      case 'i8': return HEAP8[((ptr)>>0)];
      case 'i16': return HEAP16[((ptr)>>1)];
      case 'i32': return HEAP32[((ptr)>>2)];
      case 'i64': return HEAP32[((ptr)>>2)];
      case 'float': return HEAPF32[((ptr)>>2)];
      case 'double': return HEAPF64[((ptr)>>3)];
      default: abort('invalid type for getValue: ' + type);
    }
  return null;
}




// Wasm globals

var wasmMemory;

// Potentially used for direct table calls.
var wasmTable;


//========================================
// Runtime essentials
//========================================

// whether we are quitting the application. no code should run after this.
// set in exit() and abort()
var ABORT = false;

// set by exit() and abort().  Passed to 'onExit' handler.
// NOTE: This is also used as the process return code code in shell environments
// but only when noExitRuntime is false.
var EXITSTATUS = 0;

/** @type {function(*, string=)} */
function assert(condition, text) {
  if (!condition) {
    abort('Assertion failed: ' + text);
  }
}

// Returns the C function with a specified identifier (for C++, you need to do manual name mangling)
function getCFunc(ident) {
  var func = Module['_' + ident]; // closure exported function
  assert(func, 'Cannot call unknown function ' + ident + ', make sure it is exported');
  return func;
}

// C calling interface.
function ccall(ident, returnType, argTypes, args, opts) {
  // For fast lookup of conversion functions
  var toC = {
    'string': function(str) {
      var ret = 0;
      if (str !== null && str !== undefined && str !== 0) { // null string
        // at most 4 bytes per UTF-8 code point, +1 for the trailing '\0'
        var len = (str.length << 2) + 1;
        ret = stackAlloc(len);
        stringToUTF8(str, ret, len);
      }
      return ret;
    },
    'array': function(arr) {
      var ret = stackAlloc(arr.length);
      writeArrayToMemory(arr, ret);
      return ret;
    }
  };

  function convertReturnValue(ret) {
    if (returnType === 'string') return UTF8ToString(ret);
    if (returnType === 'boolean') return Boolean(ret);
    return ret;
  }

  var func = getCFunc(ident);
  var cArgs = [];
  var stack = 0;
  if (args) {
    for (var i = 0; i < args.length; i++) {
      var converter = toC[argTypes[i]];
      if (converter) {
        if (stack === 0) stack = stackSave();
        cArgs[i] = converter(args[i]);
      } else {
        cArgs[i] = args[i];
      }
    }
  }
  var ret = func.apply(null, cArgs);
  ret = convertReturnValue(ret);
  if (stack !== 0) stackRestore(stack);
  return ret;
}

function cwrap(ident, returnType, argTypes, opts) {
  argTypes = argTypes || [];
  // When the function takes numbers and returns a number, we can just return
  // the original function
  var numericArgs = argTypes.every(function(type){ return type === 'number'});
  var numericRet = returnType !== 'string';
  if (numericRet && numericArgs && !opts) {
    return getCFunc(ident);
  }
  return function() {
    return ccall(ident, returnType, argTypes, arguments, opts);
  }
}

/** @type {function(number, number, string, boolean=)} */
function setValue(ptr, value, type, noSafe) {
  type = type || 'i8';
  if (type.charAt(type.length-1) === '*') type = 'i32'; // pointers are 32-bit
    switch(type) {
      case 'i1': HEAP8[((ptr)>>0)]=value; break;
      case 'i8': HEAP8[((ptr)>>0)]=value; break;
      case 'i16': HEAP16[((ptr)>>1)]=value; break;
      case 'i32': HEAP32[((ptr)>>2)]=value; break;
      case 'i64': (tempI64 = [value>>>0,(tempDouble=value,(+(Math_abs(tempDouble))) >= (+1) ? (tempDouble > (+0) ? ((Math_min((+(Math_floor((tempDouble)/(+4294967296)))), (+4294967295)))|0)>>>0 : (~~((+(Math_ceil((tempDouble - +(((~~(tempDouble)))>>>0))/(+4294967296))))))>>>0) : 0)],HEAP32[((ptr)>>2)]=tempI64[0],HEAP32[(((ptr)+(4))>>2)]=tempI64[1]); break;
      case 'float': HEAPF32[((ptr)>>2)]=value; break;
      case 'double': HEAPF64[((ptr)>>3)]=value; break;
      default: abort('invalid type for setValue: ' + type);
    }
}

var ALLOC_NORMAL = 0; // Tries to use _malloc()
var ALLOC_STACK = 1; // Lives for the duration of the current function call
var ALLOC_DYNAMIC = 2; // Cannot be freed except through sbrk
var ALLOC_NONE = 3; // Do not allocate

// allocate(): This is for internal use. You can use it yourself as well, but the interface
//             is a little tricky (see docs right below). The reason is that it is optimized
//             for multiple syntaxes to save space in generated code. So you should
//             normally not use allocate(), and instead allocate memory using _malloc(),
//             initialize it with setValue(), and so forth.
// @slab: An array of data, or a number. If a number, then the size of the block to allocate,
//        in *bytes* (note that this is sometimes confusing: the next parameter does not
//        affect this!)
// @types: Either an array of types, one for each byte (or 0 if no type at that position),
//         or a single type which is used for the entire block. This only matters if there
//         is initial data - if @slab is a number, then this does not matter at all and is
//         ignored.
// @allocator: How to allocate memory, see ALLOC_*
/** @type {function((TypedArray|Array<number>|number), string, number, number=)} */
function allocate(slab, types, allocator, ptr) {
  var zeroinit, size;
  if (typeof slab === 'number') {
    zeroinit = true;
    size = slab;
  } else {
    zeroinit = false;
    size = slab.length;
  }

  var singleType = typeof types === 'string' ? types : null;

  var ret;
  if (allocator == ALLOC_NONE) {
    ret = ptr;
  } else {
    ret = [_malloc,
    stackAlloc,
    dynamicAlloc][allocator](Math.max(size, singleType ? 1 : types.length));
  }

  if (zeroinit) {
    var stop;
    ptr = ret;
    assert((ret & 3) == 0);
    stop = ret + (size & ~3);
    for (; ptr < stop; ptr += 4) {
      HEAP32[((ptr)>>2)]=0;
    }
    stop = ret + size;
    while (ptr < stop) {
      HEAP8[((ptr++)>>0)]=0;
    }
    return ret;
  }

  if (singleType === 'i8') {
    if (slab.subarray || slab.slice) {
      HEAPU8.set(/** @type {!Uint8Array} */ (slab), ret);
    } else {
      HEAPU8.set(new Uint8Array(slab), ret);
    }
    return ret;
  }

  var i = 0, type, typeSize, previousType;
  while (i < size) {
    var curr = slab[i];

    type = singleType || types[i];
    if (type === 0) {
      i++;
      continue;
    }

    if (type == 'i64') type = 'i32'; // special case: we have one i32 here, and one i32 later

    setValue(ret+i, curr, type);

    // no need to look up size unless type changes, so cache it
    if (previousType !== type) {
      typeSize = getNativeTypeSize(type);
      previousType = type;
    }
    i += typeSize;
  }

  return ret;
}

// Allocate memory during any stage of startup - static memory early on, dynamic memory later, malloc when ready
function getMemory(size) {
  if (!runtimeInitialized) return dynamicAlloc(size);
  return _malloc(size);
}




/** @type {function(number, number=)} */
function Pointer_stringify(ptr, length) {
  abort("this function has been removed - you should use UTF8ToString(ptr, maxBytesToRead) instead!");
}

// Given a pointer 'ptr' to a null-terminated ASCII-encoded string in the emscripten HEAP, returns
// a copy of that string as a Javascript String object.

function AsciiToString(ptr) {
  var str = '';
  while (1) {
    var ch = HEAP8[((ptr++)>>0)];
    if (!ch) return str;
    str += String.fromCharCode(ch);
  }
}

// Copies the given Javascript String object 'str' to the emscripten HEAP at address 'outPtr',
// null-terminated and encoded in ASCII form. The copy will require at most str.length+1 bytes of space in the HEAP.

function stringToAscii(str, outPtr) {
  return writeAsciiToMemory(str, outPtr, false);
}


// Given a pointer 'ptr' to a null-terminated UTF8-encoded string in the given array that contains uint8 values, returns
// a copy of that string as a Javascript String object.

var UTF8Decoder = typeof TextDecoder !== 'undefined' ? new TextDecoder('utf8') : undefined;

/**
 * @param {number} idx
 * @param {number=} maxBytesToRead
 * @return {string}
 */
function UTF8ArrayToString(u8Array, idx, maxBytesToRead) {
  var endIdx = idx + maxBytesToRead;
  var endPtr = idx;
  // TextDecoder needs to know the byte length in advance, it doesn't stop on null terminator by itself.
  // Also, use the length info to avoid running tiny strings through TextDecoder, since .subarray() allocates garbage.
  // (As a tiny code save trick, compare endPtr against endIdx using a negation, so that undefined means Infinity)
  while (u8Array[endPtr] && !(endPtr >= endIdx)) ++endPtr;

  if (endPtr - idx > 16 && u8Array.subarray && UTF8Decoder) {
    return UTF8Decoder.decode(u8Array.subarray(idx, endPtr));
  } else {
    var str = '';
    // If building with TextDecoder, we have already computed the string length above, so test loop end condition against that
    while (idx < endPtr) {
      // For UTF8 byte structure, see:
      // http://en.wikipedia.org/wiki/UTF-8#Description
      // https://www.ietf.org/rfc/rfc2279.txt
      // https://tools.ietf.org/html/rfc3629
      var u0 = u8Array[idx++];
      if (!(u0 & 0x80)) { str += String.fromCharCode(u0); continue; }
      var u1 = u8Array[idx++] & 63;
      if ((u0 & 0xE0) == 0xC0) { str += String.fromCharCode(((u0 & 31) << 6) | u1); continue; }
      var u2 = u8Array[idx++] & 63;
      if ((u0 & 0xF0) == 0xE0) {
        u0 = ((u0 & 15) << 12) | (u1 << 6) | u2;
      } else {
        u0 = ((u0 & 7) << 18) | (u1 << 12) | (u2 << 6) | (u8Array[idx++] & 63);
      }

      if (u0 < 0x10000) {
        str += String.fromCharCode(u0);
      } else {
        var ch = u0 - 0x10000;
        str += String.fromCharCode(0xD800 | (ch >> 10), 0xDC00 | (ch & 0x3FF));
      }
    }
  }
  return str;
}

// Given a pointer 'ptr' to a null-terminated UTF8-encoded string in the emscripten HEAP, returns a
// copy of that string as a Javascript String object.
// maxBytesToRead: an optional length that specifies the maximum number of bytes to read. You can omit
//                 this parameter to scan the string until the first \0 byte. If maxBytesToRead is
//                 passed, and the string at [ptr, ptr+maxBytesToReadr[ contains a null byte in the
//                 middle, then the string will cut short at that byte index (i.e. maxBytesToRead will
//                 not produce a string of exact length [ptr, ptr+maxBytesToRead[)
//                 N.B. mixing frequent uses of UTF8ToString() with and without maxBytesToRead may
//                 throw JS JIT optimizations off, so it is worth to consider consistently using one
//                 style or the other.
/**
 * @param {number} ptr
 * @param {number=} maxBytesToRead
 * @return {string}
 */
function UTF8ToString(ptr, maxBytesToRead) {
  return ptr ? UTF8ArrayToString(HEAPU8, ptr, maxBytesToRead) : '';
}

// Copies the given Javascript String object 'str' to the given byte array at address 'outIdx',
// encoded in UTF8 form and null-terminated. The copy will require at most str.length*4+1 bytes of space in the HEAP.
// Use the function lengthBytesUTF8 to compute the exact number of bytes (excluding null terminator) that this function will write.
// Parameters:
//   str: the Javascript string to copy.
//   outU8Array: the array to copy to. Each index in this array is assumed to be one 8-byte element.
//   outIdx: The starting offset in the array to begin the copying.
//   maxBytesToWrite: The maximum number of bytes this function can write to the array.
//                    This count should include the null terminator,
//                    i.e. if maxBytesToWrite=1, only the null terminator will be written and nothing else.
//                    maxBytesToWrite=0 does not write any bytes to the output, not even the null terminator.
// Returns the number of bytes written, EXCLUDING the null terminator.

function stringToUTF8Array(str, outU8Array, outIdx, maxBytesToWrite) {
  if (!(maxBytesToWrite > 0)) // Parameter maxBytesToWrite is not optional. Negative values, 0, null, undefined and false each don't write out any bytes.
    return 0;

  var startIdx = outIdx;
  var endIdx = outIdx + maxBytesToWrite - 1; // -1 for string null terminator.
  for (var i = 0; i < str.length; ++i) {
    // Gotcha: charCodeAt returns a 16-bit word that is a UTF-16 encoded code unit, not a Unicode code point of the character! So decode UTF16->UTF32->UTF8.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    // For UTF8 byte structure, see http://en.wikipedia.org/wiki/UTF-8#Description and https://www.ietf.org/rfc/rfc2279.txt and https://tools.ietf.org/html/rfc3629
    var u = str.charCodeAt(i); // possibly a lead surrogate
    if (u >= 0xD800 && u <= 0xDFFF) {
      var u1 = str.charCodeAt(++i);
      u = 0x10000 + ((u & 0x3FF) << 10) | (u1 & 0x3FF);
    }
    if (u <= 0x7F) {
      if (outIdx >= endIdx) break;
      outU8Array[outIdx++] = u;
    } else if (u <= 0x7FF) {
      if (outIdx + 1 >= endIdx) break;
      outU8Array[outIdx++] = 0xC0 | (u >> 6);
      outU8Array[outIdx++] = 0x80 | (u & 63);
    } else if (u <= 0xFFFF) {
      if (outIdx + 2 >= endIdx) break;
      outU8Array[outIdx++] = 0xE0 | (u >> 12);
      outU8Array[outIdx++] = 0x80 | ((u >> 6) & 63);
      outU8Array[outIdx++] = 0x80 | (u & 63);
    } else {
      if (outIdx + 3 >= endIdx) break;
      outU8Array[outIdx++] = 0xF0 | (u >> 18);
      outU8Array[outIdx++] = 0x80 | ((u >> 12) & 63);
      outU8Array[outIdx++] = 0x80 | ((u >> 6) & 63);
      outU8Array[outIdx++] = 0x80 | (u & 63);
    }
  }
  // Null-terminate the pointer to the buffer.
  outU8Array[outIdx] = 0;
  return outIdx - startIdx;
}

// Copies the given Javascript String object 'str' to the emscripten HEAP at address 'outPtr',
// null-terminated and encoded in UTF8 form. The copy will require at most str.length*4+1 bytes of space in the HEAP.
// Use the function lengthBytesUTF8 to compute the exact number of bytes (excluding null terminator) that this function will write.
// Returns the number of bytes written, EXCLUDING the null terminator.

function stringToUTF8(str, outPtr, maxBytesToWrite) {
  return stringToUTF8Array(str, HEAPU8,outPtr, maxBytesToWrite);
}

// Returns the number of bytes the given Javascript string takes if encoded as a UTF8 byte array, EXCLUDING the null terminator byte.
function lengthBytesUTF8(str) {
  var len = 0;
  for (var i = 0; i < str.length; ++i) {
    // Gotcha: charCodeAt returns a 16-bit word that is a UTF-16 encoded code unit, not a Unicode code point of the character! So decode UTF16->UTF32->UTF8.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    var u = str.charCodeAt(i); // possibly a lead surrogate
    if (u >= 0xD800 && u <= 0xDFFF) u = 0x10000 + ((u & 0x3FF) << 10) | (str.charCodeAt(++i) & 0x3FF);
    if (u <= 0x7F) ++len;
    else if (u <= 0x7FF) len += 2;
    else if (u <= 0xFFFF) len += 3;
    else len += 4;
  }
  return len;
}


// Given a pointer 'ptr' to a null-terminated UTF16LE-encoded string in the emscripten HEAP, returns
// a copy of that string as a Javascript String object.

var UTF16Decoder = typeof TextDecoder !== 'undefined' ? new TextDecoder('utf-16le') : undefined;
function UTF16ToString(ptr) {
  var endPtr = ptr;
  // TextDecoder needs to know the byte length in advance, it doesn't stop on null terminator by itself.
  // Also, use the length info to avoid running tiny strings through TextDecoder, since .subarray() allocates garbage.
  var idx = endPtr >> 1;
  while (HEAP16[idx]) ++idx;
  endPtr = idx << 1;

  if (endPtr - ptr > 32 && UTF16Decoder) {
    return UTF16Decoder.decode(HEAPU8.subarray(ptr, endPtr));
  } else {
    var i = 0;

    var str = '';
    while (1) {
      var codeUnit = HEAP16[(((ptr)+(i*2))>>1)];
      if (codeUnit == 0) return str;
      ++i;
      // fromCharCode constructs a character from a UTF-16 code unit, so we can pass the UTF16 string right through.
      str += String.fromCharCode(codeUnit);
    }
  }
}

// Copies the given Javascript String object 'str' to the emscripten HEAP at address 'outPtr',
// null-terminated and encoded in UTF16 form. The copy will require at most str.length*4+2 bytes of space in the HEAP.
// Use the function lengthBytesUTF16() to compute the exact number of bytes (excluding null terminator) that this function will write.
// Parameters:
//   str: the Javascript string to copy.
//   outPtr: Byte address in Emscripten HEAP where to write the string to.
//   maxBytesToWrite: The maximum number of bytes this function can write to the array. This count should include the null
//                    terminator, i.e. if maxBytesToWrite=2, only the null terminator will be written and nothing else.
//                    maxBytesToWrite<2 does not write any bytes to the output, not even the null terminator.
// Returns the number of bytes written, EXCLUDING the null terminator.

function stringToUTF16(str, outPtr, maxBytesToWrite) {
  // Backwards compatibility: if max bytes is not specified, assume unsafe unbounded write is allowed.
  if (maxBytesToWrite === undefined) {
    maxBytesToWrite = 0x7FFFFFFF;
  }
  if (maxBytesToWrite < 2) return 0;
  maxBytesToWrite -= 2; // Null terminator.
  var startPtr = outPtr;
  var numCharsToWrite = (maxBytesToWrite < str.length*2) ? (maxBytesToWrite / 2) : str.length;
  for (var i = 0; i < numCharsToWrite; ++i) {
    // charCodeAt returns a UTF-16 encoded code unit, so it can be directly written to the HEAP.
    var codeUnit = str.charCodeAt(i); // possibly a lead surrogate
    HEAP16[((outPtr)>>1)]=codeUnit;
    outPtr += 2;
  }
  // Null-terminate the pointer to the HEAP.
  HEAP16[((outPtr)>>1)]=0;
  return outPtr - startPtr;
}

// Returns the number of bytes the given Javascript string takes if encoded as a UTF16 byte array, EXCLUDING the null terminator byte.

function lengthBytesUTF16(str) {
  return str.length*2;
}

function UTF32ToString(ptr) {
  var i = 0;

  var str = '';
  while (1) {
    var utf32 = HEAP32[(((ptr)+(i*4))>>2)];
    if (utf32 == 0)
      return str;
    ++i;
    // Gotcha: fromCharCode constructs a character from a UTF-16 encoded code (pair), not from a Unicode code point! So encode the code point to UTF-16 for constructing.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    if (utf32 >= 0x10000) {
      var ch = utf32 - 0x10000;
      str += String.fromCharCode(0xD800 | (ch >> 10), 0xDC00 | (ch & 0x3FF));
    } else {
      str += String.fromCharCode(utf32);
    }
  }
}

// Copies the given Javascript String object 'str' to the emscripten HEAP at address 'outPtr',
// null-terminated and encoded in UTF32 form. The copy will require at most str.length*4+4 bytes of space in the HEAP.
// Use the function lengthBytesUTF32() to compute the exact number of bytes (excluding null terminator) that this function will write.
// Parameters:
//   str: the Javascript string to copy.
//   outPtr: Byte address in Emscripten HEAP where to write the string to.
//   maxBytesToWrite: The maximum number of bytes this function can write to the array. This count should include the null
//                    terminator, i.e. if maxBytesToWrite=4, only the null terminator will be written and nothing else.
//                    maxBytesToWrite<4 does not write any bytes to the output, not even the null terminator.
// Returns the number of bytes written, EXCLUDING the null terminator.

function stringToUTF32(str, outPtr, maxBytesToWrite) {
  // Backwards compatibility: if max bytes is not specified, assume unsafe unbounded write is allowed.
  if (maxBytesToWrite === undefined) {
    maxBytesToWrite = 0x7FFFFFFF;
  }
  if (maxBytesToWrite < 4) return 0;
  var startPtr = outPtr;
  var endPtr = startPtr + maxBytesToWrite - 4;
  for (var i = 0; i < str.length; ++i) {
    // Gotcha: charCodeAt returns a 16-bit word that is a UTF-16 encoded code unit, not a Unicode code point of the character! We must decode the string to UTF-32 to the heap.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    var codeUnit = str.charCodeAt(i); // possibly a lead surrogate
    if (codeUnit >= 0xD800 && codeUnit <= 0xDFFF) {
      var trailSurrogate = str.charCodeAt(++i);
      codeUnit = 0x10000 + ((codeUnit & 0x3FF) << 10) | (trailSurrogate & 0x3FF);
    }
    HEAP32[((outPtr)>>2)]=codeUnit;
    outPtr += 4;
    if (outPtr + 4 > endPtr) break;
  }
  // Null-terminate the pointer to the HEAP.
  HEAP32[((outPtr)>>2)]=0;
  return outPtr - startPtr;
}

// Returns the number of bytes the given Javascript string takes if encoded as a UTF16 byte array, EXCLUDING the null terminator byte.

function lengthBytesUTF32(str) {
  var len = 0;
  for (var i = 0; i < str.length; ++i) {
    // Gotcha: charCodeAt returns a 16-bit word that is a UTF-16 encoded code unit, not a Unicode code point of the character! We must decode the string to UTF-32 to the heap.
    // See http://unicode.org/faq/utf_bom.html#utf16-3
    var codeUnit = str.charCodeAt(i);
    if (codeUnit >= 0xD800 && codeUnit <= 0xDFFF) ++i; // possibly a lead surrogate, so skip over the tail surrogate.
    len += 4;
  }

  return len;
}

// Allocate heap space for a JS string, and write it there.
// It is the responsibility of the caller to free() that memory.
function allocateUTF8(str) {
  var size = lengthBytesUTF8(str) + 1;
  var ret = _malloc(size);
  if (ret) stringToUTF8Array(str, HEAP8, ret, size);
  return ret;
}

// Allocate stack space for a JS string, and write it there.
function allocateUTF8OnStack(str) {
  var size = lengthBytesUTF8(str) + 1;
  var ret = stackAlloc(size);
  stringToUTF8Array(str, HEAP8, ret, size);
  return ret;
}

// Deprecated: This function should not be called because it is unsafe and does not provide
// a maximum length limit of how many bytes it is allowed to write. Prefer calling the
// function stringToUTF8Array() instead, which takes in a maximum length that can be used
// to be secure from out of bounds writes.
/** @deprecated */
function writeStringToMemory(string, buffer, dontAddNull) {
  warnOnce('writeStringToMemory is deprecated and should not be called! Use stringToUTF8() instead!');

  var /** @type {number} */ lastChar, /** @type {number} */ end;
  if (dontAddNull) {
    // stringToUTF8Array always appends null. If we don't want to do that, remember the
    // character that existed at the location where the null will be placed, and restore
    // that after the write (below).
    end = buffer + lengthBytesUTF8(string);
    lastChar = HEAP8[end];
  }
  stringToUTF8(string, buffer, Infinity);
  if (dontAddNull) HEAP8[end] = lastChar; // Restore the value under the null character.
}

function writeArrayToMemory(array, buffer) {
  HEAP8.set(array, buffer);
}

function writeAsciiToMemory(str, buffer, dontAddNull) {
  for (var i = 0; i < str.length; ++i) {
    HEAP8[((buffer++)>>0)]=str.charCodeAt(i);
  }
  // Null-terminate the pointer to the HEAP.
  if (!dontAddNull) HEAP8[((buffer)>>0)]=0;
}





function demangle(func) {
  return func;
}

function demangleAll(text) {
  var regex =
    /__Z[\w\d_]+/g;
  return text.replace(regex,
    function(x) {
      var y = demangle(x);
      return x === y ? x : (y + ' [' + x + ']');
    });
}

function jsStackTrace() {
  var err = new Error();
  if (!err.stack) {
    // IE10+ special cases: It does have callstack info, but it is only populated if an Error object is thrown,
    // so try that as a special-case.
    try {
      throw new Error(0);
    } catch(e) {
      err = e;
    }
    if (!err.stack) {
      return '(no stack trace available)';
    }
  }
  return err.stack.toString();
}

function stackTrace() {
  var js = jsStackTrace();
  if (Module['extraStackTrace']) js += '\n' + Module['extraStackTrace']();
  return demangleAll(js);
}



// Memory management

var PAGE_SIZE = 16384;
var WASM_PAGE_SIZE = 65536;
var ASMJS_PAGE_SIZE = 16777216;

function alignUp(x, multiple) {
  if (x % multiple > 0) {
    x += multiple - (x % multiple);
  }
  return x;
}

var HEAP,
/** @type {ArrayBuffer} */
  buffer,
/** @type {Int8Array} */
  HEAP8,
/** @type {Uint8Array} */
  HEAPU8,
/** @type {Int16Array} */
  HEAP16,
/** @type {Uint16Array} */
  HEAPU16,
/** @type {Int32Array} */
  HEAP32,
/** @type {Uint32Array} */
  HEAPU32,
/** @type {Float32Array} */
  HEAPF32,
/** @type {Float64Array} */
  HEAPF64;

function updateGlobalBuffer(buf) {
  Module['buffer'] = buffer = buf;
}

function updateGlobalBufferViews() {
  Module['HEAP8'] = HEAP8 = new Int8Array(buffer);
  Module['HEAP16'] = HEAP16 = new Int16Array(buffer);
  Module['HEAP32'] = HEAP32 = new Int32Array(buffer);
  Module['HEAPU8'] = HEAPU8 = new Uint8Array(buffer);
  Module['HEAPU16'] = HEAPU16 = new Uint16Array(buffer);
  Module['HEAPU32'] = HEAPU32 = new Uint32Array(buffer);
  Module['HEAPF32'] = HEAPF32 = new Float32Array(buffer);
  Module['HEAPF64'] = HEAPF64 = new Float64Array(buffer);
}


var STATIC_BASE = 8,
    STACK_BASE = 3936,
    STACKTOP = STACK_BASE,
    STACK_MAX = 5246816,
    DYNAMIC_BASE = 5246816,
    DYNAMICTOP_PTR = 3680;




var TOTAL_STACK = 5242880;

var TOTAL_MEMORY = Module['TOTAL_MEMORY'] || 16777216;
if (TOTAL_MEMORY < TOTAL_STACK) err('TOTAL_MEMORY should be larger than TOTAL_STACK, was ' + TOTAL_MEMORY + '! (TOTAL_STACK=' + TOTAL_STACK + ')');

// Initialize the runtime's memory







// Use a provided buffer, if there is one, or else allocate a new one
if (Module['buffer']) {
  buffer = Module['buffer'];
} else {
  // Use a WebAssembly memory where available
  {
    buffer = new ArrayBuffer(TOTAL_MEMORY);
  }
  Module['buffer'] = buffer;
}
updateGlobalBufferViews();


HEAP32[DYNAMICTOP_PTR>>2] = DYNAMIC_BASE;






// Endianness check (note: assumes compiler arch was little-endian)

function callRuntimeCallbacks(callbacks) {
  while(callbacks.length > 0) {
    var callback = callbacks.shift();
    if (typeof callback == 'function') {
      callback();
      continue;
    }
    var func = callback.func;
    if (typeof func === 'number') {
      if (callback.arg === undefined) {
        Module['dynCall_v'](func);
      } else {
        Module['dynCall_vi'](func, callback.arg);
      }
    } else {
      func(callback.arg === undefined ? null : callback.arg);
    }
  }
}

var __ATPRERUN__  = []; // functions called before the runtime is initialized
var __ATINIT__    = []; // functions called during startup
var __ATMAIN__    = []; // functions called when main() is to be run
var __ATEXIT__    = []; // functions called during shutdown
var __ATPOSTRUN__ = []; // functions called after the main() is called

var runtimeInitialized = false;
var runtimeExited = false;


function preRun() {
  // compatibility - merge in anything from Module['preRun'] at this time
  if (Module['preRun']) {
    if (typeof Module['preRun'] == 'function') Module['preRun'] = [Module['preRun']];
    while (Module['preRun'].length) {
      addOnPreRun(Module['preRun'].shift());
    }
  }
  callRuntimeCallbacks(__ATPRERUN__);
}

function ensureInitRuntime() {
  if (runtimeInitialized) return;
  runtimeInitialized = true;
  
  callRuntimeCallbacks(__ATINIT__);
}

function preMain() {
  
  callRuntimeCallbacks(__ATMAIN__);
}

function exitRuntime() {
  runtimeExited = true;
}

function postRun() {
  // compatibility - merge in anything from Module['postRun'] at this time
  if (Module['postRun']) {
    if (typeof Module['postRun'] == 'function') Module['postRun'] = [Module['postRun']];
    while (Module['postRun'].length) {
      addOnPostRun(Module['postRun'].shift());
    }
  }
  callRuntimeCallbacks(__ATPOSTRUN__);
}

function addOnPreRun(cb) {
  __ATPRERUN__.unshift(cb);
}

function addOnInit(cb) {
  __ATINIT__.unshift(cb);
}

function addOnPreMain(cb) {
  __ATMAIN__.unshift(cb);
}

function addOnExit(cb) {
}

function addOnPostRun(cb) {
  __ATPOSTRUN__.unshift(cb);
}

function unSign(value, bits, ignore) {
  if (value >= 0) {
    return value;
  }
  return bits <= 32 ? 2*Math.abs(1 << (bits-1)) + value // Need some trickery, since if bits == 32, we are right at the limit of the bits JS uses in bitshifts
                    : Math.pow(2, bits)         + value;
}
function reSign(value, bits, ignore) {
  if (value <= 0) {
    return value;
  }
  var half = bits <= 32 ? Math.abs(1 << (bits-1)) // abs is needed if bits == 32
                        : Math.pow(2, bits-1);
  if (value >= half && (bits <= 32 || value > half)) { // for huge values, we can hit the precision limit and always get true here. so don't do that
                                                       // but, in general there is no perfect solution here. With 64-bit ints, we get rounding and errors
                                                       // TODO: In i64 mode 1, resign the two parts separately and safely
    value = -2*half + value; // Cannot bitshift half, as it may be at the limit of the bits JS uses in bitshifts
  }
  return value;
}



var Math_abs = Math.abs;
var Math_cos = Math.cos;
var Math_sin = Math.sin;
var Math_tan = Math.tan;
var Math_acos = Math.acos;
var Math_asin = Math.asin;
var Math_atan = Math.atan;
var Math_atan2 = Math.atan2;
var Math_exp = Math.exp;
var Math_log = Math.log;
var Math_sqrt = Math.sqrt;
var Math_ceil = Math.ceil;
var Math_floor = Math.floor;
var Math_pow = Math.pow;
var Math_imul = Math.imul;
var Math_fround = Math.fround;
var Math_round = Math.round;
var Math_min = Math.min;
var Math_max = Math.max;
var Math_clz32 = Math.clz32;
var Math_trunc = Math.trunc;



// A counter of dependencies for calling run(). If we need to
// do asynchronous work before running, increment this and
// decrement it. Incrementing must happen in a place like
// Module.preRun (used by emcc to add file preloading).
// Note that you can add dependencies in preRun, even though
// it happens right before run - run will be postponed until
// the dependencies are met.
var runDependencies = 0;
var runDependencyWatcher = null;
var dependenciesFulfilled = null; // overridden to take different actions when all run dependencies are fulfilled

function getUniqueRunDependency(id) {
  return id;
}

function addRunDependency(id) {
  runDependencies++;
  if (Module['monitorRunDependencies']) {
    Module['monitorRunDependencies'](runDependencies);
  }
}

function removeRunDependency(id) {
  runDependencies--;
  if (Module['monitorRunDependencies']) {
    Module['monitorRunDependencies'](runDependencies);
  }
  if (runDependencies == 0) {
    if (runDependencyWatcher !== null) {
      clearInterval(runDependencyWatcher);
      runDependencyWatcher = null;
    }
    if (dependenciesFulfilled) {
      var callback = dependenciesFulfilled;
      dependenciesFulfilled = null;
      callback(); // can add another dependenciesFulfilled
    }
  }
}

Module["preloadedImages"] = {}; // maps url to image data
Module["preloadedAudios"] = {}; // maps url to audio data


var memoryInitializer = null;






// Copyright 2017 The Emscripten Authors.  All rights reserved.
// Emscripten is available under two separate licenses, the MIT license and the
// University of Illinois/NCSA Open Source License.  Both these licenses can be
// found in the LICENSE file.

// Prefix of data URIs emitted by SINGLE_FILE and related options.
var dataURIPrefix = 'data:application/octet-stream;base64,';

// Indicates whether filename is a base64 data URI.
function isDataURI(filename) {
  return String.prototype.startsWith ?
      filename.startsWith(dataURIPrefix) :
      filename.indexOf(dataURIPrefix) === 0;
}





// === Body ===

var ASM_CONSTS = [function() { if (typeof window != "undefined") { window.dispatchEvent(new CustomEvent("wasmLoaded")) } else { global.onWASMLoaded && global.onWASMLoaded()} }];

function _emscripten_asm_const_i(code) {
  return ASM_CONSTS[code]();
}




// STATICTOP = STATIC_BASE + 3928;
/* global initializers */  __ATINIT__.push({ func: function() { __GLOBAL__sub_I_emscripten_cpp() } });


memoryInitializer = "appWASM.js.mem";





/* no memory initializer */
var tempDoublePtr = 3920

function copyTempFloat(ptr) { // functions, because inlining this code increases code size too much
  HEAP8[tempDoublePtr] = HEAP8[ptr];
  HEAP8[tempDoublePtr+1] = HEAP8[ptr+1];
  HEAP8[tempDoublePtr+2] = HEAP8[ptr+2];
  HEAP8[tempDoublePtr+3] = HEAP8[ptr+3];
}

function copyTempDouble(ptr) {
  HEAP8[tempDoublePtr] = HEAP8[ptr];
  HEAP8[tempDoublePtr+1] = HEAP8[ptr+1];
  HEAP8[tempDoublePtr+2] = HEAP8[ptr+2];
  HEAP8[tempDoublePtr+3] = HEAP8[ptr+3];
  HEAP8[tempDoublePtr+4] = HEAP8[ptr+4];
  HEAP8[tempDoublePtr+5] = HEAP8[ptr+5];
  HEAP8[tempDoublePtr+6] = HEAP8[ptr+6];
  HEAP8[tempDoublePtr+7] = HEAP8[ptr+7];
}

// {{PRE_LIBRARY}}


  
  function __ZSt18uncaught_exceptionv() { // std::uncaught_exception()
      return !!__ZSt18uncaught_exceptionv.uncaught_exception;
    }
  
  
  
  
  function ___cxa_free_exception(ptr) {
      try {
        return _free(ptr);
      } catch(e) { // XXX FIXME
      }
    }var EXCEPTIONS={last:0,caught:[],infos:{},deAdjust:function (adjusted) {
        if (!adjusted || EXCEPTIONS.infos[adjusted]) return adjusted;
        for (var key in EXCEPTIONS.infos) {
          var ptr = +key; // the iteration key is a string, and if we throw this, it must be an integer as that is what we look for
          var adj = EXCEPTIONS.infos[ptr].adjusted;
          var len = adj.length;
          for (var i = 0; i < len; i++) {
            if (adj[i] === adjusted) {
              return ptr;
            }
          }
        }
        return adjusted;
      },addRef:function (ptr) {
        if (!ptr) return;
        var info = EXCEPTIONS.infos[ptr];
        info.refcount++;
      },decRef:function (ptr) {
        if (!ptr) return;
        var info = EXCEPTIONS.infos[ptr];
        assert(info.refcount > 0);
        info.refcount--;
        // A rethrown exception can reach refcount 0; it must not be discarded
        // Its next handler will clear the rethrown flag and addRef it, prior to
        // final decRef and destruction here
        if (info.refcount === 0 && !info.rethrown) {
          if (info.destructor) {
            Module['dynCall_vi'](info.destructor, ptr);
          }
          delete EXCEPTIONS.infos[ptr];
          ___cxa_free_exception(ptr);
        }
      },clearRef:function (ptr) {
        if (!ptr) return;
        var info = EXCEPTIONS.infos[ptr];
        info.refcount = 0;
      }};
  function ___resumeException(ptr) {
      if (!EXCEPTIONS.last) { EXCEPTIONS.last = ptr; }
      throw ptr;
    }function ___cxa_find_matching_catch() {
      var thrown = EXCEPTIONS.last;
      if (!thrown) {
        // just pass through the null ptr
        return ((setTempRet0(0),0)|0);
      }
      var info = EXCEPTIONS.infos[thrown];
      var throwntype = info.type;
      if (!throwntype) {
        // just pass through the thrown ptr
        return ((setTempRet0(0),thrown)|0);
      }
      var typeArray = Array.prototype.slice.call(arguments);
  
      var pointer = Module['___cxa_is_pointer_type'](throwntype);
      // can_catch receives a **, add indirection
      if (!___cxa_find_matching_catch.buffer) ___cxa_find_matching_catch.buffer = _malloc(4);
      HEAP32[((___cxa_find_matching_catch.buffer)>>2)]=thrown;
      thrown = ___cxa_find_matching_catch.buffer;
      // The different catch blocks are denoted by different types.
      // Due to inheritance, those types may not precisely match the
      // type of the thrown object. Find one which matches, and
      // return the type of the catch block which should be called.
      for (var i = 0; i < typeArray.length; i++) {
        if (typeArray[i] && Module['___cxa_can_catch'](typeArray[i], throwntype, thrown)) {
          thrown = HEAP32[((thrown)>>2)]; // undo indirection
          info.adjusted.push(thrown);
          return ((setTempRet0(typeArray[i]),thrown)|0);
        }
      }
      // Shouldn't happen unless we have bogus data in typeArray
      // or encounter a type for which emscripten doesn't have suitable
      // typeinfo defined. Best-efforts match just in case.
      thrown = HEAP32[((thrown)>>2)]; // undo indirection
      return ((setTempRet0(throwntype),thrown)|0);
    }function ___gxx_personality_v0() {
    }

  
  
  var _Math_imul=undefined;  

  
  var SYSCALLS={buffers:[null,[],[]],printChar:function (stream, curr) {
        var buffer = SYSCALLS.buffers[stream];
        if (curr === 0 || curr === 10) {
          (stream === 1 ? out : err)(UTF8ArrayToString(buffer, 0));
          buffer.length = 0;
        } else {
          buffer.push(curr);
        }
      },varargs:0,get:function (varargs) {
        SYSCALLS.varargs += 4;
        var ret = HEAP32[(((SYSCALLS.varargs)-(4))>>2)];
        return ret;
      },getStr:function () {
        var ret = UTF8ToString(SYSCALLS.get());
        return ret;
      },get64:function () {
        var low = SYSCALLS.get(), high = SYSCALLS.get();
        return low;
      },getZero:function () {
        SYSCALLS.get();
      }};function ___syscall140(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // llseek
      var stream = SYSCALLS.getStreamFromFD(), offset_high = SYSCALLS.get(), offset_low = SYSCALLS.get(), result = SYSCALLS.get(), whence = SYSCALLS.get();
      // NOTE: offset_high is unused - Emscripten's off_t is 32-bit
      var offset = offset_low;
      FS.llseek(stream, offset, whence);
      HEAP32[((result)>>2)]=stream.position;
      if (stream.getdents && offset === 0 && whence === 0) stream.getdents = null; // reset readdir state
      return 0;
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  
  function flush_NO_FILESYSTEM() {
      // flush anything remaining in the buffers during shutdown
      var fflush = Module["_fflush"];
      if (fflush) fflush(0);
      var buffers = SYSCALLS.buffers;
      if (buffers[1].length) SYSCALLS.printChar(1, 10);
      if (buffers[2].length) SYSCALLS.printChar(2, 10);
    }function ___syscall146(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // writev
      // hack to support printf in FILESYSTEM=0
      var stream = SYSCALLS.get(), iov = SYSCALLS.get(), iovcnt = SYSCALLS.get();
      var ret = 0;
      for (var i = 0; i < iovcnt; i++) {
        var ptr = HEAP32[(((iov)+(i*8))>>2)];
        var len = HEAP32[(((iov)+(i*8 + 4))>>2)];
        for (var j = 0; j < len; j++) {
          SYSCALLS.printChar(stream, HEAPU8[ptr+j]);
        }
        ret += len;
      }
      return ret;
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  function ___syscall54(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // ioctl
      return 0;
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  function ___syscall6(which, varargs) {SYSCALLS.varargs = varargs;
  try {
   // close
      var stream = SYSCALLS.getStreamFromFD();
      FS.close(stream);
      return 0;
    } catch (e) {
    if (typeof FS === 'undefined' || !(e instanceof FS.ErrnoError)) abort(e);
    return -e.errno;
  }
  }

  
  
   
  
   
  
  
  var _Math_clz32=undefined;   

  function _abort() {
      Module['abort']();
    }

   

   

  var _emscripten_asm_const_int=true;

  function _emscripten_get_heap_size() {
      return TOTAL_MEMORY;
    }

  
  function abortOnCannotGrowMemory(requestedSize) {
      abort('OOM');
    }
  
  function emscripten_realloc_buffer(size) {
      try {
        var newBuffer = new ArrayBuffer(size);
        if (newBuffer.byteLength != size) return false;
        new Int8Array(newBuffer).set(HEAP8);
      } catch(e) {
        return false;
      }
      Module['_emscripten_replace_memory'](newBuffer);
      HEAP8 = new Int8Array(newBuffer);
      HEAP16 = new Int16Array(newBuffer);
      HEAP32 = new Int32Array(newBuffer);
      HEAPU8 = new Uint8Array(newBuffer);
      HEAPU16 = new Uint16Array(newBuffer);
      HEAPU32 = new Uint32Array(newBuffer);
      HEAPF32 = new Float32Array(newBuffer);
      HEAPF64 = new Float64Array(newBuffer);
      buffer = newBuffer;
      return newBuffer;
    }function _emscripten_resize_heap(requestedSize) {
      var oldSize = _emscripten_get_heap_size();
      // TOTAL_MEMORY is the current size of the actual array, and DYNAMICTOP is the new top.
  
  
      var PAGE_MULTIPLE = 16777216;
      var LIMIT = 2147483648 - PAGE_MULTIPLE; // We can do one page short of 2GB as theoretical maximum.
  
      if (requestedSize > LIMIT) {
        return false;
      }
  
      var MIN_TOTAL_MEMORY = 16777216;
      var newSize = Math.max(oldSize, MIN_TOTAL_MEMORY); // So the loop below will not be infinite, and minimum asm.js memory size is 16MB.
  
      while (newSize < requestedSize) { // Keep incrementing the heap size as long as it's less than what is requested.
        if (newSize <= 536870912) {
          newSize = alignUp(2 * newSize, PAGE_MULTIPLE); // Simple heuristic: double until 1GB...
        } else {
          // ..., but after that, add smaller increments towards 2GB, which we cannot reach
          newSize = Math.min(alignUp((3 * newSize + 2147483648) / 4, PAGE_MULTIPLE), LIMIT);
        }
      }
  
  
  
      var replacement = emscripten_realloc_buffer(newSize);
      if (!replacement || replacement.byteLength != newSize) {
        return false;
      }
  
      // everything worked
      updateGlobalBuffer(replacement);
      updateGlobalBufferViews();
  
      TOTAL_MEMORY = newSize;
      HEAPU32[DYNAMICTOP_PTR>>2] = requestedSize;
  
  
  
      return true;
    }

  
  
  var GL={counter:1,lastError:0,buffers:[],mappedBuffers:{},programs:[],framebuffers:[],renderbuffers:[],textures:[],uniforms:[],shaders:[],vaos:[],contexts:{},currentContext:null,offscreenCanvases:{},timerQueriesEXT:[],queries:[],samplers:[],transformFeedbacks:[],syncs:[],programInfos:{},stringCache:{},stringiCache:{},unpackAlignment:4,init:function () {
        GL.miniTempBuffer = new Float32Array(GL.MINI_TEMP_BUFFER_SIZE);
        for (var i = 0; i < GL.MINI_TEMP_BUFFER_SIZE; i++) {
          GL.miniTempBufferViews[i] = GL.miniTempBuffer.subarray(0, i+1);
        }
      },recordError:function recordError(errorCode) {
        if (!GL.lastError) {
          GL.lastError = errorCode;
        }
      },getNewId:function (table) {
        var ret = GL.counter++;
        for (var i = table.length; i < ret; i++) {
          table[i] = null;
        }
        return ret;
      },MINI_TEMP_BUFFER_SIZE:256,miniTempBuffer:null,miniTempBufferViews:[0],getSource:function (shader, count, string, length) {
        var source = '';
        for (var i = 0; i < count; ++i) {
          var len = length ? HEAP32[(((length)+(i*4))>>2)] : -1;
          source += UTF8ToString(HEAP32[(((string)+(i*4))>>2)], len < 0 ? undefined : len);
        }
        return source;
      },createContext:function (canvas, webGLContextAttributes) {
  
  
  
  
        var ctx = 
          (webGLContextAttributes.majorVersion > 1) ? canvas.getContext("webgl2", webGLContextAttributes) :
          (canvas.getContext("webgl", webGLContextAttributes) || canvas.getContext("experimental-webgl", webGLContextAttributes));
  
  
        return ctx && GL.registerContext(ctx, webGLContextAttributes);
      },registerContext:function (ctx, webGLContextAttributes) {
        var handle = _malloc(8); // Make space on the heap to store GL context attributes that need to be accessible as shared between threads.
        var context = {
          handle: handle,
          attributes: webGLContextAttributes,
          version: webGLContextAttributes.majorVersion,
          GLctx: ctx
        };
  
        // BUG: Workaround Chrome WebGL 2 issue: the first shipped versions of WebGL 2 in Chrome did not actually implement the new WebGL 2 functions.
        //      Those are supported only in Chrome 58 and newer.
        function getChromeVersion() {
          var raw = navigator.userAgent.match(/Chrom(e|ium)\/([0-9]+)\./);
          return raw ? parseInt(raw[2], 10) : false;
        }
        context.supportsWebGL2EntryPoints = (context.version >= 2) && (getChromeVersion() === false || getChromeVersion() >= 58);
  
  
        // Store the created context object so that we can access the context given a canvas without having to pass the parameters again.
        if (ctx.canvas) ctx.canvas.GLctxObject = context;
        GL.contexts[handle] = context;
        if (typeof webGLContextAttributes.enableExtensionsByDefault === 'undefined' || webGLContextAttributes.enableExtensionsByDefault) {
          GL.initExtensions(context);
        }
  
  
  
  
        return handle;
      },makeContextCurrent:function (contextHandle) {
  
        GL.currentContext = GL.contexts[contextHandle]; // Active Emscripten GL layer context object.
        Module.ctx = GLctx = GL.currentContext && GL.currentContext.GLctx; // Active WebGL context object.
        return !(contextHandle && !GLctx);
      },getContext:function (contextHandle) {
        return GL.contexts[contextHandle];
      },deleteContext:function (contextHandle) {
        if (GL.currentContext === GL.contexts[contextHandle]) GL.currentContext = null;
        if (typeof JSEvents === 'object') JSEvents.removeAllHandlersOnTarget(GL.contexts[contextHandle].GLctx.canvas); // Release all JS event handlers on the DOM element that the GL context is associated with since the context is now deleted.
        if (GL.contexts[contextHandle] && GL.contexts[contextHandle].GLctx.canvas) GL.contexts[contextHandle].GLctx.canvas.GLctxObject = undefined; // Make sure the canvas object no longer refers to the context object so there are no GC surprises.
        _free(GL.contexts[contextHandle]);
        GL.contexts[contextHandle] = null;
      },initExtensions:function (context) {
        // If this function is called without a specific context object, init the extensions of the currently active context.
        if (!context) context = GL.currentContext;
  
        if (context.initExtensionsDone) return;
        context.initExtensionsDone = true;
  
        var GLctx = context.GLctx;
  
        // Detect the presence of a few extensions manually, this GL interop layer itself will need to know if they exist.
  
        if (context.version < 2) {
          // Extension available from Firefox 26 and Google Chrome 30
          var instancedArraysExt = GLctx.getExtension('ANGLE_instanced_arrays');
          if (instancedArraysExt) {
            GLctx['vertexAttribDivisor'] = function(index, divisor) { instancedArraysExt['vertexAttribDivisorANGLE'](index, divisor); };
            GLctx['drawArraysInstanced'] = function(mode, first, count, primcount) { instancedArraysExt['drawArraysInstancedANGLE'](mode, first, count, primcount); };
            GLctx['drawElementsInstanced'] = function(mode, count, type, indices, primcount) { instancedArraysExt['drawElementsInstancedANGLE'](mode, count, type, indices, primcount); };
          }
  
          // Extension available from Firefox 25 and WebKit
          var vaoExt = GLctx.getExtension('OES_vertex_array_object');
          if (vaoExt) {
            GLctx['createVertexArray'] = function() { return vaoExt['createVertexArrayOES'](); };
            GLctx['deleteVertexArray'] = function(vao) { vaoExt['deleteVertexArrayOES'](vao); };
            GLctx['bindVertexArray'] = function(vao) { vaoExt['bindVertexArrayOES'](vao); };
            GLctx['isVertexArray'] = function(vao) { return vaoExt['isVertexArrayOES'](vao); };
          }
  
          var drawBuffersExt = GLctx.getExtension('WEBGL_draw_buffers');
          if (drawBuffersExt) {
            GLctx['drawBuffers'] = function(n, bufs) { drawBuffersExt['drawBuffersWEBGL'](n, bufs); };
          }
        }
  
        GLctx.disjointTimerQueryExt = GLctx.getExtension("EXT_disjoint_timer_query");
  
        // These are the 'safe' feature-enabling extensions that don't add any performance impact related to e.g. debugging, and
        // should be enabled by default so that client GLES2/GL code will not need to go through extra hoops to get its stuff working.
        // As new extensions are ratified at http://www.khronos.org/registry/webgl/extensions/ , feel free to add your new extensions
        // here, as long as they don't produce a performance impact for users that might not be using those extensions.
        // E.g. debugging-related extensions should probably be off by default.
        var automaticallyEnabledExtensions = [ // Khronos ratified WebGL extensions ordered by number (no debug extensions):
                                               "OES_texture_float", "OES_texture_half_float", "OES_standard_derivatives",
                                               "OES_vertex_array_object", "WEBGL_compressed_texture_s3tc", "WEBGL_depth_texture",
                                               "OES_element_index_uint", "EXT_texture_filter_anisotropic", "EXT_frag_depth",
                                               "WEBGL_draw_buffers", "ANGLE_instanced_arrays", "OES_texture_float_linear",
                                               "OES_texture_half_float_linear", "EXT_blend_minmax", "EXT_shader_texture_lod",
                                               // Community approved WebGL extensions ordered by number:
                                               "WEBGL_compressed_texture_pvrtc", "EXT_color_buffer_half_float", "WEBGL_color_buffer_float",
                                               "EXT_sRGB", "WEBGL_compressed_texture_etc1", "EXT_disjoint_timer_query",
                                               "WEBGL_compressed_texture_etc", "WEBGL_compressed_texture_astc", "EXT_color_buffer_float",
                                               "WEBGL_compressed_texture_s3tc_srgb", "EXT_disjoint_timer_query_webgl2"];
  
        function shouldEnableAutomatically(extension) {
          var ret = false;
          automaticallyEnabledExtensions.forEach(function(include) {
            if (extension.indexOf(include) != -1) {
              ret = true;
            }
          });
          return ret;
        }
  
        var exts = GLctx.getSupportedExtensions();
        if (exts && exts.length > 0) {
          GLctx.getSupportedExtensions().forEach(function(ext) {
            if (automaticallyEnabledExtensions.indexOf(ext) != -1) {
              GLctx.getExtension(ext); // Calling .getExtension enables that extension permanently, no need to store the return value to be enabled.
            }
          });
        }
      },populateUniformTable:function (program) {
        var p = GL.programs[program];
        var ptable = GL.programInfos[program] = {
          uniforms: {},
          maxUniformLength: 0, // This is eagerly computed below, since we already enumerate all uniforms anyway.
          maxAttributeLength: -1, // This is lazily computed and cached, computed when/if first asked, "-1" meaning not computed yet.
          maxUniformBlockNameLength: -1 // Lazily computed as well
        };
  
        var utable = ptable.uniforms;
        // A program's uniform table maps the string name of an uniform to an integer location of that uniform.
        // The global GL.uniforms map maps integer locations to WebGLUniformLocations.
        var numUniforms = GLctx.getProgramParameter(p, 0x8B86/*GL_ACTIVE_UNIFORMS*/);
        for (var i = 0; i < numUniforms; ++i) {
          var u = GLctx.getActiveUniform(p, i);
  
          var name = u.name;
          ptable.maxUniformLength = Math.max(ptable.maxUniformLength, name.length+1);
  
          // If we are dealing with an array, e.g. vec4 foo[3], strip off the array index part to canonicalize that "foo", "foo[]",
          // and "foo[0]" will mean the same. Loop below will populate foo[1] and foo[2].
          if (name.slice(-1) == ']') {
            name = name.slice(0, name.lastIndexOf('['));
          }
  
          // Optimize memory usage slightly: If we have an array of uniforms, e.g. 'vec3 colors[3];', then
          // only store the string 'colors' in utable, and 'colors[0]', 'colors[1]' and 'colors[2]' will be parsed as 'colors'+i.
          // Note that for the GL.uniforms table, we still need to fetch the all WebGLUniformLocations for all the indices.
          var loc = GLctx.getUniformLocation(p, name);
          if (loc) {
            var id = GL.getNewId(GL.uniforms);
            utable[name] = [u.size, id];
            GL.uniforms[id] = loc;
  
            for (var j = 1; j < u.size; ++j) {
              var n = name + '['+j+']';
              loc = GLctx.getUniformLocation(p, n);
              id = GL.getNewId(GL.uniforms);
  
              GL.uniforms[id] = loc;
            }
          }
        }
      }};
  
  var JSEvents={keyEvent:0,mouseEvent:0,wheelEvent:0,uiEvent:0,focusEvent:0,deviceOrientationEvent:0,deviceMotionEvent:0,fullscreenChangeEvent:0,pointerlockChangeEvent:0,visibilityChangeEvent:0,touchEvent:0,previousFullscreenElement:null,previousScreenX:null,previousScreenY:null,removeEventListenersRegistered:false,removeAllEventListeners:function () {
        for(var i = JSEvents.eventHandlers.length-1; i >= 0; --i) {
          JSEvents._removeHandler(i);
        }
        JSEvents.eventHandlers = [];
        JSEvents.deferredCalls = [];
      },registerRemoveEventListeners:function () {
        if (!JSEvents.removeEventListenersRegistered) {
          __ATEXIT__.push(JSEvents.removeAllEventListeners);
          JSEvents.removeEventListenersRegistered = true;
        }
      },deferredCalls:[],deferCall:function (targetFunction, precedence, argsList) {
        function arraysHaveEqualContent(arrA, arrB) {
          if (arrA.length != arrB.length) return false;
  
          for(var i in arrA) {
            if (arrA[i] != arrB[i]) return false;
          }
          return true;
        }
        // Test if the given call was already queued, and if so, don't add it again.
        for(var i in JSEvents.deferredCalls) {
          var call = JSEvents.deferredCalls[i];
          if (call.targetFunction == targetFunction && arraysHaveEqualContent(call.argsList, argsList)) {
            return;
          }
        }
        JSEvents.deferredCalls.push({
          targetFunction: targetFunction,
          precedence: precedence,
          argsList: argsList
        });
  
        JSEvents.deferredCalls.sort(function(x,y) { return x.precedence < y.precedence; });
      },removeDeferredCalls:function (targetFunction) {
        for(var i = 0; i < JSEvents.deferredCalls.length; ++i) {
          if (JSEvents.deferredCalls[i].targetFunction == targetFunction) {
            JSEvents.deferredCalls.splice(i, 1);
            --i;
          }
        }
      },canPerformEventHandlerRequests:function () {
        return JSEvents.inEventHandler && JSEvents.currentEventHandler.allowsDeferredCalls;
      },runDeferredCalls:function () {
        if (!JSEvents.canPerformEventHandlerRequests()) {
          return;
        }
        for(var i = 0; i < JSEvents.deferredCalls.length; ++i) {
          var call = JSEvents.deferredCalls[i];
          JSEvents.deferredCalls.splice(i, 1);
          --i;
          call.targetFunction.apply(this, call.argsList);
        }
      },inEventHandler:0,currentEventHandler:null,eventHandlers:[],isInternetExplorer:function () { return navigator.userAgent.indexOf('MSIE') !== -1 || navigator.appVersion.indexOf('Trident/') > 0; },removeAllHandlersOnTarget:function (target, eventTypeString) {
        for(var i = 0; i < JSEvents.eventHandlers.length; ++i) {
          if (JSEvents.eventHandlers[i].target == target && 
            (!eventTypeString || eventTypeString == JSEvents.eventHandlers[i].eventTypeString)) {
             JSEvents._removeHandler(i--);
           }
        }
      },_removeHandler:function (i) {
        var h = JSEvents.eventHandlers[i];
        h.target.removeEventListener(h.eventTypeString, h.eventListenerFunc, h.useCapture);
        JSEvents.eventHandlers.splice(i, 1);
      },registerOrRemoveHandler:function (eventHandler) {
        var jsEventHandler = function jsEventHandler(event) {
          // Increment nesting count for the event handler.
          ++JSEvents.inEventHandler;
          JSEvents.currentEventHandler = eventHandler;
          // Process any old deferred calls the user has placed.
          JSEvents.runDeferredCalls();
          // Process the actual event, calls back to user C code handler.
          eventHandler.handlerFunc(event);
          // Process any new deferred calls that were placed right now from this event handler.
          JSEvents.runDeferredCalls();
          // Out of event handler - restore nesting count.
          --JSEvents.inEventHandler;
        }
        
        if (eventHandler.callbackfunc) {
          eventHandler.eventListenerFunc = jsEventHandler;
          eventHandler.target.addEventListener(eventHandler.eventTypeString, jsEventHandler, eventHandler.useCapture);
          JSEvents.eventHandlers.push(eventHandler);
          JSEvents.registerRemoveEventListeners();
        } else {
          for(var i = 0; i < JSEvents.eventHandlers.length; ++i) {
            if (JSEvents.eventHandlers[i].target == eventHandler.target
             && JSEvents.eventHandlers[i].eventTypeString == eventHandler.eventTypeString) {
               JSEvents._removeHandler(i--);
             }
          }
        }
      },getBoundingClientRectOrZeros:function (target) {
        return target.getBoundingClientRect ? target.getBoundingClientRect() : { left: 0, top: 0 };
      },pageScrollPos:function () {
        if (window.pageXOffset > 0 || window.pageYOffset > 0) {
          return [window.pageXOffset, window.pageYOffset];
        }
        if (typeof document.documentElement.scrollLeft !== 'undefined' || typeof document.documentElement.scrollTop !== 'undefined') {
          return [document.documentElement.scrollLeft, document.documentElement.scrollTop];
        }
        return [document.body.scrollLeft|0, document.body.scrollTop|0];
      },getNodeNameForTarget:function (target) {
        if (!target) return '';
        if (target == window) return '#window';
        if (target == screen) return '#screen';
        return (target && target.nodeName) ? target.nodeName : '';
      },tick:function () {
        if (window['performance'] && window['performance']['now']) return window['performance']['now']();
        else return Date.now();
      },fullscreenEnabled:function () {
        return document.fullscreenEnabled || document.mozFullScreenEnabled || document.webkitFullscreenEnabled || document.msFullscreenEnabled;
      }};
  
  var __emscripten_webgl_power_preferences=['default', 'low-power', 'high-performance'];
  
  
  var __specialEventTargets=[0, typeof document !== 'undefined' ? document : 0, typeof window !== 'undefined' ? window : 0];function __findEventTarget(target) {
      try {
        // The sensible "default" target varies between events, but use window as the default
        // since DOM events mostly can default to that. Specific callback registrations
        // override their own defaults.
        if (!target) return window;
        if (typeof target === "number") target = __specialEventTargets[target] || UTF8ToString(target);
        if (target === '#window') return window;
        else if (target === '#document') return document;
        else if (target === '#screen') return screen;
        else if (target === '#canvas') return Module['canvas'];
        return (typeof target === 'string') ? document.getElementById(target) : target;
      } catch(e) {
        // In Web Workers, some objects above, such as '#document' do not exist. Gracefully
        // return null for them.
        return null;
      }
    }
  
  function __findCanvasEventTarget(target) {
      if (typeof target === 'number') target = UTF8ToString(target);
      if (!target || target === '#canvas') {
        if (typeof GL !== 'undefined' && GL.offscreenCanvases['canvas']) return GL.offscreenCanvases['canvas']; // TODO: Remove this line, target '#canvas' should refer only to Module['canvas'], not to GL.offscreenCanvases['canvas'] - but need stricter tests to be able to remove this line.
        return Module['canvas'];
      }
      if (typeof GL !== 'undefined' && GL.offscreenCanvases[target]) return GL.offscreenCanvases[target];
      return __findEventTarget(target);
    }function _emscripten_webgl_do_create_context(target, attributes) {
      var contextAttributes = {};
      var a = attributes >> 2;
      contextAttributes['alpha'] = !!HEAP32[a + (0>>2)];
      contextAttributes['depth'] = !!HEAP32[a + (4>>2)];
      contextAttributes['stencil'] = !!HEAP32[a + (8>>2)];
      contextAttributes['antialias'] = !!HEAP32[a + (12>>2)];
      contextAttributes['premultipliedAlpha'] = !!HEAP32[a + (16>>2)];
      contextAttributes['preserveDrawingBuffer'] = !!HEAP32[a + (20>>2)];
      var powerPreference = HEAP32[a + (24>>2)];
      contextAttributes['powerPreference'] = __emscripten_webgl_power_preferences[powerPreference];
      contextAttributes['failIfMajorPerformanceCaveat'] = !!HEAP32[a + (28>>2)];
      contextAttributes.majorVersion = HEAP32[a + (32>>2)];
      contextAttributes.minorVersion = HEAP32[a + (36>>2)];
      contextAttributes.enableExtensionsByDefault = HEAP32[a + (40>>2)];
      contextAttributes.explicitSwapControl = HEAP32[a + (44>>2)];
      contextAttributes.proxyContextToMainThread = HEAP32[a + (48>>2)];
      contextAttributes.renderViaOffscreenBackBuffer = HEAP32[a + (52>>2)];
  
      var canvas = __findCanvasEventTarget(target);
  
  
  
      if (!canvas) {
        return 0;
      }
  
      if (contextAttributes.explicitSwapControl) {
        return 0;
      }
  
  
      var contextHandle = GL.createContext(canvas, contextAttributes);
      return contextHandle;
    }function _emscripten_webgl_create_context(a0,a1
  /*``*/) {
  return _emscripten_webgl_do_create_context(a0,a1);
  }

  function _emscripten_webgl_make_context_current(contextHandle) {
      var success = GL.makeContextCurrent(contextHandle);
      return success ? 0 : -5;
    }

  function _exit(status) {
      // void _exit(int status);
      // http://pubs.opengroup.org/onlinepubs/000095399/functions/exit.html
      exit(status);
    }

  function _glAttachShader(program, shader) {
      GLctx.attachShader(GL.programs[program],
                              GL.shaders[shader]);
    }

  function _glBindBuffer(target, buffer) {
  
      if (target == 0x88EB /*GL_PIXEL_PACK_BUFFER*/) {
        // In WebGL 2 glReadPixels entry point, we need to use a different WebGL 2 API function call when a buffer is bound to
        // GL_PIXEL_PACK_BUFFER_BINDING point, so must keep track whether that binding point is non-null to know what is
        // the proper API function to call.
        GLctx.currentPixelPackBufferBinding = buffer;
      } else if (target == 0x88EC /*GL_PIXEL_UNPACK_BUFFER*/) {
        // In WebGL 2 gl(Compressed)Tex(Sub)Image[23]D entry points, we need to
        // use a different WebGL 2 API function call when a buffer is bound to
        // GL_PIXEL_UNPACK_BUFFER_BINDING point, so must keep track whether that
        // binding point is non-null to know what is the proper API function to
        // call.
        GLctx.currentPixelUnpackBufferBinding = buffer;
      }
      GLctx.bindBuffer(target, GL.buffers[buffer]);
    }

  function _glBufferData(target, size, data, usage) {
      if (GL.currentContext.supportsWebGL2EntryPoints) { // WebGL 2 provides new garbage-free entry points to call to WebGL. Use those always when possible.
        if (data) {
          GLctx.bufferData(target, HEAPU8, usage, data, size);
        } else {
          GLctx.bufferData(target, size, usage);
        }
      } else {
        // N.b. here first form specifies a heap subarray, second form an integer size, so the ?: code here is polymorphic. It is advised to avoid
        // randomly mixing both uses in calling code, to avoid any potential JS engine JIT issues.
        GLctx.bufferData(target, data ? HEAPU8.subarray(data, data+size) : size, usage);
      }
    }

  function _glCompileShader(shader) {
      GLctx.compileShader(GL.shaders[shader]);
    }

  function _glCreateProgram() {
      var id = GL.getNewId(GL.programs);
      var program = GLctx.createProgram();
      program.name = id;
      GL.programs[id] = program;
      return id;
    }

  function _glCreateShader(shaderType) {
      var id = GL.getNewId(GL.shaders);
      GL.shaders[id] = GLctx.createShader(shaderType);
      return id;
    }

  function _glDrawArrays(mode, first, count) {
  
      GLctx.drawArrays(mode, first, count);
  
    }

  function _glEnableVertexAttribArray(index) {
      GLctx.enableVertexAttribArray(index);
    }

  
  function __glGenObject(n, buffers, createFunction, objectTable
      ) {
      for (var i = 0; i < n; i++) {
        var buffer = GLctx[createFunction]();
        var id = buffer && GL.getNewId(objectTable);
        if (buffer) {
          buffer.name = id;
          objectTable[id] = buffer;
        } else {
          GL.recordError(0x0502 /* GL_INVALID_OPERATION */);
        }
        HEAP32[(((buffers)+(i*4))>>2)]=id;
      }
    }function _glGenBuffers(n, buffers) {
      __glGenObject(n, buffers, 'createBuffer', GL.buffers
        );
    }

  function _glGetAttribLocation(program, name) {
      return GLctx.getAttribLocation(GL.programs[program], UTF8ToString(name));
    }

  function _glGetProgramiv(program, pname, p) {
      if (!p) {
        // GLES2 specification does not specify how to behave if p is a null pointer. Since calling this function does not make sense
        // if p == null, issue a GL error to notify user about it.
        GL.recordError(0x0501 /* GL_INVALID_VALUE */);
        return;
      }
  
      if (program >= GL.counter) {
        GL.recordError(0x0501 /* GL_INVALID_VALUE */);
        return;
      }
  
      var ptable = GL.programInfos[program];
      if (!ptable) {
        GL.recordError(0x0502 /* GL_INVALID_OPERATION */);
        return;
      }
  
      if (pname == 0x8B84) { // GL_INFO_LOG_LENGTH
        var log = GLctx.getProgramInfoLog(GL.programs[program]);
        if (log === null) log = '(unknown error)';
        HEAP32[((p)>>2)]=log.length + 1;
      } else if (pname == 0x8B87 /* GL_ACTIVE_UNIFORM_MAX_LENGTH */) {
        HEAP32[((p)>>2)]=ptable.maxUniformLength;
      } else if (pname == 0x8B8A /* GL_ACTIVE_ATTRIBUTE_MAX_LENGTH */) {
        if (ptable.maxAttributeLength == -1) {
          program = GL.programs[program];
          var numAttribs = GLctx.getProgramParameter(program, 0x8B89/*GL_ACTIVE_ATTRIBUTES*/);
          ptable.maxAttributeLength = 0; // Spec says if there are no active attribs, 0 must be returned.
          for (var i = 0; i < numAttribs; ++i) {
            var activeAttrib = GLctx.getActiveAttrib(program, i);
            ptable.maxAttributeLength = Math.max(ptable.maxAttributeLength, activeAttrib.name.length+1);
          }
        }
        HEAP32[((p)>>2)]=ptable.maxAttributeLength;
      } else if (pname == 0x8A35 /* GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH */) {
        if (ptable.maxUniformBlockNameLength == -1) {
          program = GL.programs[program];
          var numBlocks = GLctx.getProgramParameter(program, 0x8A36/*GL_ACTIVE_UNIFORM_BLOCKS*/);
          ptable.maxUniformBlockNameLength = 0;
          for (var i = 0; i < numBlocks; ++i) {
            var activeBlockName = GLctx.getActiveUniformBlockName(program, i);
            ptable.maxUniformBlockNameLength = Math.max(ptable.maxUniformBlockNameLength, activeBlockName.length+1);
          }
        }
        HEAP32[((p)>>2)]=ptable.maxUniformBlockNameLength;
      } else {
        HEAP32[((p)>>2)]=GLctx.getProgramParameter(GL.programs[program], pname);
      }
    }

  function _glGetShaderInfoLog(shader, maxLength, length, infoLog) {
      var log = GLctx.getShaderInfoLog(GL.shaders[shader]);
      if (log === null) log = '(unknown error)';
      if (maxLength > 0 && infoLog) {
        var numBytesWrittenExclNull = stringToUTF8(log, infoLog, maxLength);
        if (length) HEAP32[((length)>>2)]=numBytesWrittenExclNull;
      } else {
        if (length) HEAP32[((length)>>2)]=0;
      }
    }

  function _glGetShaderiv(shader, pname, p) {
      if (!p) {
        // GLES2 specification does not specify how to behave if p is a null pointer. Since calling this function does not make sense
        // if p == null, issue a GL error to notify user about it.
        GL.recordError(0x0501 /* GL_INVALID_VALUE */);
        return;
      }
      if (pname == 0x8B84) { // GL_INFO_LOG_LENGTH
        var log = GLctx.getShaderInfoLog(GL.shaders[shader]);
        if (log === null) log = '(unknown error)';
        HEAP32[((p)>>2)]=log.length + 1;
      } else if (pname == 0x8B88) { // GL_SHADER_SOURCE_LENGTH
        var source = GLctx.getShaderSource(GL.shaders[shader]);
        var sourceLength = (source === null || source.length == 0) ? 0 : source.length + 1;
        HEAP32[((p)>>2)]=sourceLength;
      } else {
        HEAP32[((p)>>2)]=GLctx.getShaderParameter(GL.shaders[shader], pname);
      }
    }

  function _glGetUniformLocation(program, name) {
      name = UTF8ToString(name);
  
      var arrayIndex = 0;
      // If user passed an array accessor "[index]", parse the array index off the accessor.
      if (name[name.length - 1] == ']') {
        var leftBrace = name.lastIndexOf('[');
        arrayIndex = name[leftBrace+1] != ']' ? parseInt(name.slice(leftBrace + 1)) : 0; // "index]", parseInt will ignore the ']' at the end; but treat "foo[]" as "foo[0]"
        name = name.slice(0, leftBrace);
      }
  
      var uniformInfo = GL.programInfos[program] && GL.programInfos[program].uniforms[name]; // returns pair [ dimension_of_uniform_array, uniform_location ]
      if (uniformInfo && arrayIndex >= 0 && arrayIndex < uniformInfo[0]) { // Check if user asked for an out-of-bounds element, i.e. for 'vec4 colors[3];' user could ask for 'colors[10]' which should return -1.
        return uniformInfo[1] + arrayIndex;
      } else {
        return -1;
      }
    }

  function _glIsShader(shader) {
      var s = GL.shaders[shader];
      if (!s) return 0;
      return GLctx.isShader(s);
    }

  function _glLinkProgram(program) {
      GLctx.linkProgram(GL.programs[program]);
      GL.populateUniformTable(program);
    }

  function _glShaderSource(shader, count, string, length) {
      var source = GL.getSource(shader, count, string, length);
  
  
      GLctx.shaderSource(GL.shaders[shader], source);
    }

  function _glUniform1f(location, v0) {
      GLctx.uniform1f(GL.uniforms[location], v0);
    }

  function _glUniform1i(location, v0) {
      GLctx.uniform1i(GL.uniforms[location], v0);
    }

  function _glUseProgram(program) {
      GLctx.useProgram(GL.programs[program]);
    }

  function _glVertexAttribPointer(index, size, type, normalized, stride, ptr) {
      GLctx.vertexAttribPointer(index, size, type, !!normalized, stride, ptr);
    }

  function _glViewport(x0, x1, x2, x3) { GLctx['viewport'](x0, x1, x2, x3) }



  
  function _emscripten_memcpy_big(dest, src, num) {
      HEAPU8.set(HEAPU8.subarray(src, src+num), dest);
    }
  
  var _Int8Array=undefined;
  
  var _Int32Array=undefined; 

   

  
  function ___setErrNo(value) {
      if (Module['___errno_location']) HEAP32[((Module['___errno_location']())>>2)]=value;
      return value;
    } 
var GLctx; GL.init();
var ASSERTIONS = false;

// Copyright 2017 The Emscripten Authors.  All rights reserved.
// Emscripten is available under two separate licenses, the MIT license and the
// University of Illinois/NCSA Open Source License.  Both these licenses can be
// found in the LICENSE file.

/** @type {function(string, boolean=, number=)} */
function intArrayFromString(stringy, dontAddNull, length) {
  var len = length > 0 ? length : lengthBytesUTF8(stringy)+1;
  var u8array = new Array(len);
  var numBytesWritten = stringToUTF8Array(stringy, u8array, 0, u8array.length);
  if (dontAddNull) u8array.length = numBytesWritten;
  return u8array;
}

function intArrayToString(array) {
  var ret = [];
  for (var i = 0; i < array.length; i++) {
    var chr = array[i];
    if (chr > 0xFF) {
      if (ASSERTIONS) {
        assert(false, 'Character code ' + chr + ' (' + String.fromCharCode(chr) + ')  at offset ' + i + ' not in 0x00-0xFF.');
      }
      chr &= 0xFF;
    }
    ret.push(String.fromCharCode(chr));
  }
  return ret.join('');
}


// ASM_LIBRARY EXTERN PRIMITIVES: Math_imul,Math_clz32,Int8Array,Int32Array


var asmGlobalArg = { "Math": Math, "Int8Array": Int8Array, "Int16Array": Int16Array, "Int32Array": Int32Array, "Uint8Array": Uint8Array, "Uint16Array": Uint16Array, "Float32Array": Float32Array, "Float64Array": Float64Array }

var asmLibraryArg = { "abort": abort, "setTempRet0": setTempRet0, "getTempRet0": getTempRet0, "__ZSt18uncaught_exceptionv": __ZSt18uncaught_exceptionv, "___cxa_find_matching_catch": ___cxa_find_matching_catch, "___cxa_free_exception": ___cxa_free_exception, "___gxx_personality_v0": ___gxx_personality_v0, "___resumeException": ___resumeException, "___setErrNo": ___setErrNo, "___syscall140": ___syscall140, "___syscall146": ___syscall146, "___syscall54": ___syscall54, "___syscall6": ___syscall6, "__findCanvasEventTarget": __findCanvasEventTarget, "__findEventTarget": __findEventTarget, "__glGenObject": __glGenObject, "_abort": _abort, "_emscripten_asm_const_i": _emscripten_asm_const_i, "_emscripten_get_heap_size": _emscripten_get_heap_size, "_emscripten_memcpy_big": _emscripten_memcpy_big, "_emscripten_resize_heap": _emscripten_resize_heap, "_emscripten_webgl_create_context": _emscripten_webgl_create_context, "_emscripten_webgl_do_create_context": _emscripten_webgl_do_create_context, "_emscripten_webgl_make_context_current": _emscripten_webgl_make_context_current, "_exit": _exit, "_glAttachShader": _glAttachShader, "_glBindBuffer": _glBindBuffer, "_glBufferData": _glBufferData, "_glCompileShader": _glCompileShader, "_glCreateProgram": _glCreateProgram, "_glCreateShader": _glCreateShader, "_glDrawArrays": _glDrawArrays, "_glEnableVertexAttribArray": _glEnableVertexAttribArray, "_glGenBuffers": _glGenBuffers, "_glGetAttribLocation": _glGetAttribLocation, "_glGetProgramiv": _glGetProgramiv, "_glGetShaderInfoLog": _glGetShaderInfoLog, "_glGetShaderiv": _glGetShaderiv, "_glGetUniformLocation": _glGetUniformLocation, "_glIsShader": _glIsShader, "_glLinkProgram": _glLinkProgram, "_glShaderSource": _glShaderSource, "_glUniform1f": _glUniform1f, "_glUniform1i": _glUniform1i, "_glUseProgram": _glUseProgram, "_glVertexAttribPointer": _glVertexAttribPointer, "_glViewport": _glViewport, "abortOnCannotGrowMemory": abortOnCannotGrowMemory, "emscripten_realloc_buffer": emscripten_realloc_buffer, "flush_NO_FILESYSTEM": flush_NO_FILESYSTEM, "tempDoublePtr": tempDoublePtr, "DYNAMICTOP_PTR": DYNAMICTOP_PTR }
// EMSCRIPTEN_START_ASM
var asm = (/** @suppress {uselessCode} */ function(global, env, buffer) {
'almost asm';

  var HEAP8 = new global.Int8Array(buffer),
  HEAP16 = new global.Int16Array(buffer),
  HEAP32 = new global.Int32Array(buffer),
  HEAPU8 = new global.Uint8Array(buffer),
  HEAPU16 = new global.Uint16Array(buffer),
  HEAPF32 = new global.Float32Array(buffer),
  HEAPF64 = new global.Float64Array(buffer),
  tempDoublePtr=env.tempDoublePtr|0,
  DYNAMICTOP_PTR=env.DYNAMICTOP_PTR|0,
  __THREW__ = 0,
  threwValue = 0,
  setjmpId = 0,
  tempInt = 0,
  tempBigInt = 0,
  tempBigIntS = 0,
  tempValue = 0,
  tempDouble = 0.0,
  Math_imul=global.Math.imul,
  Math_clz32=global.Math.clz32,
  abort=env.abort,
  setTempRet0=env.setTempRet0,
  getTempRet0=env.getTempRet0,
  __ZSt18uncaught_exceptionv=env.__ZSt18uncaught_exceptionv,
  ___cxa_find_matching_catch=env.___cxa_find_matching_catch,
  ___cxa_free_exception=env.___cxa_free_exception,
  ___gxx_personality_v0=env.___gxx_personality_v0,
  ___resumeException=env.___resumeException,
  ___setErrNo=env.___setErrNo,
  ___syscall140=env.___syscall140,
  ___syscall146=env.___syscall146,
  ___syscall54=env.___syscall54,
  ___syscall6=env.___syscall6,
  __findCanvasEventTarget=env.__findCanvasEventTarget,
  __findEventTarget=env.__findEventTarget,
  __glGenObject=env.__glGenObject,
  _abort=env._abort,
  _emscripten_asm_const_i=env._emscripten_asm_const_i,
  _emscripten_get_heap_size=env._emscripten_get_heap_size,
  _emscripten_memcpy_big=env._emscripten_memcpy_big,
  _emscripten_resize_heap=env._emscripten_resize_heap,
  _emscripten_webgl_create_context=env._emscripten_webgl_create_context,
  _emscripten_webgl_do_create_context=env._emscripten_webgl_do_create_context,
  _emscripten_webgl_make_context_current=env._emscripten_webgl_make_context_current,
  _exit=env._exit,
  _glAttachShader=env._glAttachShader,
  _glBindBuffer=env._glBindBuffer,
  _glBufferData=env._glBufferData,
  _glCompileShader=env._glCompileShader,
  _glCreateProgram=env._glCreateProgram,
  _glCreateShader=env._glCreateShader,
  _glDrawArrays=env._glDrawArrays,
  _glEnableVertexAttribArray=env._glEnableVertexAttribArray,
  _glGenBuffers=env._glGenBuffers,
  _glGetAttribLocation=env._glGetAttribLocation,
  _glGetProgramiv=env._glGetProgramiv,
  _glGetShaderInfoLog=env._glGetShaderInfoLog,
  _glGetShaderiv=env._glGetShaderiv,
  _glGetUniformLocation=env._glGetUniformLocation,
  _glIsShader=env._glIsShader,
  _glLinkProgram=env._glLinkProgram,
  _glShaderSource=env._glShaderSource,
  _glUniform1f=env._glUniform1f,
  _glUniform1i=env._glUniform1i,
  _glUseProgram=env._glUseProgram,
  _glVertexAttribPointer=env._glVertexAttribPointer,
  _glViewport=env._glViewport,
  abortOnCannotGrowMemory=env.abortOnCannotGrowMemory,
  emscripten_realloc_buffer=env.emscripten_realloc_buffer,
  flush_NO_FILESYSTEM=env.flush_NO_FILESYSTEM,
  STACKTOP = 3936,
  STACK_MAX = 5246816,
  tempFloat = 0.0;

function _emscripten_replace_memory(newBuffer) {
  HEAP8 = new Int8Array(newBuffer);
  HEAPU8 = new Uint8Array(newBuffer);
  HEAP16 = new Int16Array(newBuffer);
  HEAPU16 = new Uint16Array(newBuffer);
  HEAP32 = new Int32Array(newBuffer);
  HEAPF32 = new Float32Array(newBuffer);
  HEAPF64 = new Float64Array(newBuffer);

  buffer = newBuffer;
  return true;
}

// EMSCRIPTEN_START_FUNCS
function _malloc($0) {
 $0 = $0 | 0;
 var $$0 = 0, $$0$i$i = 0, $$0$i$i$i = 0, $$0$i16$i = 0, $$0187$i = 0, $$0189$i = 0, $$0190$i = 0, $$0191$i = 0, $$0197 = 0, $$0199 = 0, $$02065$i$i = 0, $$0207$lcssa$i$i = 0, $$02074$i$i = 0, $$0211$i$i = 0, $$0212$i$i = 0, $$024372$i = 0, $$0286$i$i = 0, $$028711$i$i = 0, $$0288$lcssa$i$i = 0, $$028810$i$i = 0, $$0294$i$i = 0, $$0295$i$i = 0, $$0340$i = 0, $$034217$i = 0, $$0343$lcssa$i = 0, $$034316$i = 0, $$0345$i = 0, $$0351$i = 0, $$0357$i = 0, $$0358$i = 0, $$0360$i = 0, $$0361$i = 0, $$0367$i = 0, $$1194$i = 0, $$1194$i$be = 0, $$1194$i$ph = 0, $$1196$i = 0, $$1196$i$be = 0, $$1196$i$ph = 0, $$124471$i = 0, $$1290$i$i = 0, $$1290$i$i$be = 0, $$1290$i$i$ph = 0, $$1292$i$i = 0, $$1292$i$i$be = 0, $$1292$i$i$ph = 0, $$1341$i = 0, $$1346$i = 0, $$1362$i = 0, $$1369$i = 0, $$1369$i$be = 0, $$1369$i$ph = 0, $$1373$i = 0, $$1373$i$be = 0, $$1373$i$ph = 0, $$2234243136$i = 0, $$2247$ph$i = 0, $$2253$ph$i = 0, $$2353$i = 0, $$3$i = 0, $$3$i$i = 0, $$3$i203 = 0, $$3$i203218 = 0, $$3348$i = 0, $$3371$i = 0, $$4$lcssa$i = 0, $$420$i = 0, $$420$i$ph = 0, $$4236$i = 0, $$4349$lcssa$i = 0, $$434919$i = 0, $$434919$i$ph = 0, $$4355$i = 0, $$535618$i = 0, $$535618$i$ph = 0, $$723947$i = 0, $$748$i = 0, $$pre$phi$i$iZ2D = 0, $$pre$phi$i18$iZ2D = 0, $$pre$phi$i209Z2D = 0, $$pre$phi$iZ2D = 0, $$pre$phi17$i$iZ2D = 0, $$pre$phiZ2D = 0, $1 = 0, $1000 = 0, $1003 = 0, $1008 = 0, $101 = 0, $1014 = 0, $1017 = 0, $1018 = 0, $102 = 0, $1025 = 0, $1037 = 0, $1042 = 0, $1049 = 0, $1050 = 0, $1051 = 0, $1060 = 0, $1062 = 0, $1063 = 0, $1064 = 0, $1070 = 0, $108 = 0, $112 = 0, $114 = 0, $115 = 0, $117 = 0, $119 = 0, $121 = 0, $123 = 0, $125 = 0, $127 = 0, $129 = 0, $134 = 0, $14 = 0, $140 = 0, $143 = 0, $146 = 0, $149 = 0, $150 = 0, $151 = 0, $153 = 0, $156 = 0, $158 = 0, $16 = 0, $161 = 0, $163 = 0, $166 = 0, $169 = 0, $17 = 0, $170 = 0, $172 = 0, $173 = 0, $175 = 0, $176 = 0, $178 = 0, $179 = 0, $18 = 0, $184 = 0, $185 = 0, $19 = 0, $193 = 0, $198 = 0, $20 = 0, $202 = 0, $208 = 0, $215 = 0, $219 = 0, $228 = 0, $229 = 0, $231 = 0, $232 = 0, $236 = 0, $237 = 0, $245 = 0, $246 = 0, $247 = 0, $249 = 0, $250 = 0, $255 = 0, $256 = 0, $259 = 0, $261 = 0, $264 = 0, $269 = 0, $27 = 0, $276 = 0, $286 = 0, $290 = 0, $299 = 0, $30 = 0, $302 = 0, $306 = 0, $308 = 0, $309 = 0, $311 = 0, $313 = 0, $315 = 0, $317 = 0, $319 = 0, $321 = 0, $323 = 0, $333 = 0, $334 = 0, $336 = 0, $34 = 0, $341 = 0, $346 = 0, $348 = 0, $351 = 0, $353 = 0, $356 = 0, $358 = 0, $361 = 0, $364 = 0, $365 = 0, $367 = 0, $368 = 0, $37 = 0, $370 = 0, $371 = 0, $373 = 0, $374 = 0, $379 = 0, $380 = 0, $385 = 0, $388 = 0, $393 = 0, $397 = 0, $403 = 0, $41 = 0, $410 = 0, $414 = 0, $422 = 0, $425 = 0, $426 = 0, $427 = 0, $431 = 0, $432 = 0, $438 = 0, $44 = 0, $443 = 0, $444 = 0, $447 = 0, $449 = 0, $452 = 0, $457 = 0, $463 = 0, $465 = 0, $467 = 0, $469 = 0, $47 = 0, $475 = 0, $487 = 0, $49 = 0, $492 = 0, $499 = 0, $50 = 0, $500 = 0, $501 = 0, $510 = 0, $512 = 0, $513 = 0, $515 = 0, $52 = 0, $524 = 0, $528 = 0, $530 = 0, $531 = 0, $532 = 0, $54 = 0, $543 = 0, $544 = 0, $545 = 0, $546 = 0, $547 = 0, $548 = 0, $550 = 0, $552 = 0, $553 = 0, $559 = 0, $56 = 0, $561 = 0, $568 = 0, $570 = 0, $572 = 0, $573 = 0, $574 = 0, $58 = 0, $582 = 0, $583 = 0, $586 = 0, $590 = 0, $593 = 0, $596 = 0, $6 = 0, $60 = 0, $602 = 0, $606 = 0, $610 = 0, $619 = 0, $62 = 0, $620 = 0, $626 = 0, $628 = 0, $632 = 0, $635 = 0, $637 = 0, $64 = 0, $641 = 0, $643 = 0, $648 = 0, $649 = 0, $650 = 0, $656 = 0, $658 = 0, $662 = 0, $664 = 0, $67 = 0, $673 = 0, $675 = 0, $680 = 0, $681 = 0, $682 = 0, $688 = 0, $69 = 0, $690 = 0, $694 = 0, $7 = 0, $70 = 0, $700 = 0, $704 = 0, $71 = 0, $710 = 0, $712 = 0, $718 = 0, $72 = 0, $722 = 0, $723 = 0, $728 = 0, $73 = 0, $734 = 0, $739 = 0, $742 = 0, $743 = 0, $746 = 0, $748 = 0, $750 = 0, $753 = 0, $764 = 0, $769 = 0, $77 = 0, $771 = 0, $774 = 0, $776 = 0, $779 = 0, $782 = 0, $783 = 0, $784 = 0, $786 = 0, $788 = 0, $789 = 0, $791 = 0, $792 = 0, $797 = 0, $798 = 0, $8 = 0, $80 = 0, $807 = 0, $812 = 0, $815 = 0, $816 = 0, $822 = 0, $83 = 0, $830 = 0, $836 = 0, $839 = 0, $84 = 0, $840 = 0, $841 = 0, $845 = 0, $846 = 0, $852 = 0, $857 = 0, $858 = 0, $861 = 0, $863 = 0, $866 = 0, $87 = 0, $871 = 0, $877 = 0, $879 = 0, $881 = 0, $882 = 0, $889 = 0, $9 = 0, $901 = 0, $906 = 0, $913 = 0, $914 = 0, $915 = 0, $92 = 0, $923 = 0, $927 = 0, $93 = 0, $931 = 0, $933 = 0, $939 = 0, $940 = 0, $942 = 0, $943 = 0, $944 = 0, $945 = 0, $947 = 0, $95 = 0, $952 = 0, $953 = 0, $954 = 0, $96 = 0, $960 = 0, $962 = 0, $968 = 0, $973 = 0, $976 = 0, $977 = 0, $978 = 0, $98 = 0, $982 = 0, $983 = 0, $989 = 0, $994 = 0, $995 = 0, $998 = 0, $spec$select$i205 = 0, $spec$select3$i = 0, $spec$select49$i = 0, label = 0, sp = 0, $962$looptemp = 0;
 sp = STACKTOP; //@line 3749
 STACKTOP = STACKTOP + 16 | 0; //@line 3750
 $1 = sp; //@line 3751
 do {
  if ($0 >>> 0 < 245) {
   $6 = $0 >>> 0 < 11 ? 16 : $0 + 11 & -8; //@line 3758
   $7 = $6 >>> 3; //@line 3759
   $8 = HEAP32[788] | 0; //@line 3760
   $9 = $8 >>> $7; //@line 3761
   if ($9 & 3 | 0) {
    $14 = ($9 & 1 ^ 1) + $7 | 0; //@line 3767
    $16 = 3192 + ($14 << 1 << 2) | 0; //@line 3769
    $17 = $16 + 8 | 0; //@line 3770
    $18 = HEAP32[$17 >> 2] | 0; //@line 3771
    $19 = $18 + 8 | 0; //@line 3772
    $20 = HEAP32[$19 >> 2] | 0; //@line 3773
    do {
     if (($20 | 0) == ($16 | 0)) {
      HEAP32[788] = $8 & ~(1 << $14); //@line 3780
     } else {
      if ((HEAP32[792] | 0) >>> 0 > $20 >>> 0) {
       _abort(); //@line 3785
      }
      $27 = $20 + 12 | 0; //@line 3788
      if ((HEAP32[$27 >> 2] | 0) == ($18 | 0)) {
       HEAP32[$27 >> 2] = $16; //@line 3792
       HEAP32[$17 >> 2] = $20; //@line 3793
       break;
      } else {
       _abort(); //@line 3796
      }
     }
    } while (0);
    $30 = $14 << 3; //@line 3801
    HEAP32[$18 + 4 >> 2] = $30 | 3; //@line 3804
    $34 = $18 + $30 + 4 | 0; //@line 3806
    HEAP32[$34 >> 2] = HEAP32[$34 >> 2] | 1; //@line 3809
    $$0 = $19; //@line 3810
    STACKTOP = sp; //@line 3811
    return $$0 | 0; //@line 3811
   }
   $37 = HEAP32[790] | 0; //@line 3813
   if ($6 >>> 0 > $37 >>> 0) {
    if ($9 | 0) {
     $41 = 2 << $7; //@line 3819
     $44 = $9 << $7 & ($41 | 0 - $41); //@line 3822
     $47 = ($44 & 0 - $44) + -1 | 0; //@line 3825
     $49 = $47 >>> 12 & 16; //@line 3827
     $50 = $47 >>> $49; //@line 3828
     $52 = $50 >>> 5 & 8; //@line 3830
     $54 = $50 >>> $52; //@line 3832
     $56 = $54 >>> 2 & 4; //@line 3834
     $58 = $54 >>> $56; //@line 3836
     $60 = $58 >>> 1 & 2; //@line 3838
     $62 = $58 >>> $60; //@line 3840
     $64 = $62 >>> 1 & 1; //@line 3842
     $67 = ($52 | $49 | $56 | $60 | $64) + ($62 >>> $64) | 0; //@line 3845
     $69 = 3192 + ($67 << 1 << 2) | 0; //@line 3847
     $70 = $69 + 8 | 0; //@line 3848
     $71 = HEAP32[$70 >> 2] | 0; //@line 3849
     $72 = $71 + 8 | 0; //@line 3850
     $73 = HEAP32[$72 >> 2] | 0; //@line 3851
     do {
      if (($73 | 0) == ($69 | 0)) {
       $77 = $8 & ~(1 << $67); //@line 3857
       HEAP32[788] = $77; //@line 3858
       $98 = $77; //@line 3859
      } else {
       if ((HEAP32[792] | 0) >>> 0 > $73 >>> 0) {
        _abort(); //@line 3864
       }
       $80 = $73 + 12 | 0; //@line 3867
       if ((HEAP32[$80 >> 2] | 0) == ($71 | 0)) {
        HEAP32[$80 >> 2] = $69; //@line 3871
        HEAP32[$70 >> 2] = $73; //@line 3872
        $98 = $8; //@line 3873
        break;
       } else {
        _abort(); //@line 3876
       }
      }
     } while (0);
     $83 = $67 << 3; //@line 3881
     $84 = $83 - $6 | 0; //@line 3882
     HEAP32[$71 + 4 >> 2] = $6 | 3; //@line 3885
     $87 = $71 + $6 | 0; //@line 3886
     HEAP32[$87 + 4 >> 2] = $84 | 1; //@line 3889
     HEAP32[$71 + $83 >> 2] = $84; //@line 3891
     if ($37 | 0) {
      $92 = HEAP32[793] | 0; //@line 3894
      $93 = $37 >>> 3; //@line 3895
      $95 = 3192 + ($93 << 1 << 2) | 0; //@line 3897
      $96 = 1 << $93; //@line 3898
      if (!($98 & $96)) {
       HEAP32[788] = $98 | $96; //@line 3903
       $$0199 = $95; //@line 3905
       $$pre$phiZ2D = $95 + 8 | 0; //@line 3905
      } else {
       $101 = $95 + 8 | 0; //@line 3907
       $102 = HEAP32[$101 >> 2] | 0; //@line 3908
       if ((HEAP32[792] | 0) >>> 0 > $102 >>> 0) {
        _abort(); //@line 3912
       } else {
        $$0199 = $102; //@line 3915
        $$pre$phiZ2D = $101; //@line 3915
       }
      }
      HEAP32[$$pre$phiZ2D >> 2] = $92; //@line 3918
      HEAP32[$$0199 + 12 >> 2] = $92; //@line 3920
      HEAP32[$92 + 8 >> 2] = $$0199; //@line 3922
      HEAP32[$92 + 12 >> 2] = $95; //@line 3924
     }
     HEAP32[790] = $84; //@line 3926
     HEAP32[793] = $87; //@line 3927
     $$0 = $72; //@line 3928
     STACKTOP = sp; //@line 3929
     return $$0 | 0; //@line 3929
    }
    $108 = HEAP32[789] | 0; //@line 3931
    if (!$108) {
     $$0197 = $6; //@line 3934
    } else {
     $112 = ($108 & 0 - $108) + -1 | 0; //@line 3938
     $114 = $112 >>> 12 & 16; //@line 3940
     $115 = $112 >>> $114; //@line 3941
     $117 = $115 >>> 5 & 8; //@line 3943
     $119 = $115 >>> $117; //@line 3945
     $121 = $119 >>> 2 & 4; //@line 3947
     $123 = $119 >>> $121; //@line 3949
     $125 = $123 >>> 1 & 2; //@line 3951
     $127 = $123 >>> $125; //@line 3953
     $129 = $127 >>> 1 & 1; //@line 3955
     $134 = HEAP32[3456 + (($117 | $114 | $121 | $125 | $129) + ($127 >>> $129) << 2) >> 2] | 0; //@line 3960
     $$0189$i = $134; //@line 3965
     $$0190$i = $134; //@line 3965
     $$0191$i = (HEAP32[$134 + 4 >> 2] & -8) - $6 | 0; //@line 3965
     while (1) {
      $140 = HEAP32[$$0189$i + 16 >> 2] | 0; //@line 3968
      if (!$140) {
       $143 = HEAP32[$$0189$i + 20 >> 2] | 0; //@line 3972
       if (!$143) {
        break;
       } else {
        $146 = $143; //@line 3977
       }
      } else {
       $146 = $140; //@line 3980
      }
      $149 = (HEAP32[$146 + 4 >> 2] & -8) - $6 | 0; //@line 3985
      $150 = $149 >>> 0 < $$0191$i >>> 0; //@line 3986
      $$0189$i = $146; //@line 3989
      $$0190$i = $150 ? $146 : $$0190$i; //@line 3989
      $$0191$i = $150 ? $149 : $$0191$i; //@line 3989
     }
     $151 = HEAP32[792] | 0; //@line 3991
     if ($151 >>> 0 > $$0190$i >>> 0) {
      _abort(); //@line 3994
     }
     $153 = $$0190$i + $6 | 0; //@line 3997
     if ($153 >>> 0 <= $$0190$i >>> 0) {
      _abort(); //@line 4000
     }
     $156 = HEAP32[$$0190$i + 24 >> 2] | 0; //@line 4004
     $158 = HEAP32[$$0190$i + 12 >> 2] | 0; //@line 4006
     do {
      if (($158 | 0) == ($$0190$i | 0)) {
       $169 = $$0190$i + 20 | 0; //@line 4010
       $170 = HEAP32[$169 >> 2] | 0; //@line 4011
       if (!$170) {
        $172 = $$0190$i + 16 | 0; //@line 4014
        $173 = HEAP32[$172 >> 2] | 0; //@line 4015
        if (!$173) {
         $$3$i = 0; //@line 4018
         break;
        } else {
         $$1194$i$ph = $173; //@line 4021
         $$1196$i$ph = $172; //@line 4021
        }
       } else {
        $$1194$i$ph = $170; //@line 4024
        $$1196$i$ph = $169; //@line 4024
       }
       $$1194$i = $$1194$i$ph; //@line 4026
       $$1196$i = $$1196$i$ph; //@line 4026
       while (1) {
        $175 = $$1194$i + 20 | 0; //@line 4028
        $176 = HEAP32[$175 >> 2] | 0; //@line 4029
        if (!$176) {
         $178 = $$1194$i + 16 | 0; //@line 4032
         $179 = HEAP32[$178 >> 2] | 0; //@line 4033
         if (!$179) {
          break;
         } else {
          $$1194$i$be = $179; //@line 4038
          $$1196$i$be = $178; //@line 4038
         }
        } else {
         $$1194$i$be = $176; //@line 4041
         $$1196$i$be = $175; //@line 4041
        }
        $$1194$i = $$1194$i$be; //@line 4043
        $$1196$i = $$1196$i$be; //@line 4043
       }
       if ($151 >>> 0 > $$1196$i >>> 0) {
        _abort(); //@line 4047
       } else {
        HEAP32[$$1196$i >> 2] = 0; //@line 4050
        $$3$i = $$1194$i; //@line 4051
        break;
       }
      } else {
       $161 = HEAP32[$$0190$i + 8 >> 2] | 0; //@line 4056
       if ($151 >>> 0 > $161 >>> 0) {
        _abort(); //@line 4059
       }
       $163 = $161 + 12 | 0; //@line 4062
       if ((HEAP32[$163 >> 2] | 0) != ($$0190$i | 0)) {
        _abort(); //@line 4066
       }
       $166 = $158 + 8 | 0; //@line 4069
       if ((HEAP32[$166 >> 2] | 0) == ($$0190$i | 0)) {
        HEAP32[$163 >> 2] = $158; //@line 4073
        HEAP32[$166 >> 2] = $161; //@line 4074
        $$3$i = $158; //@line 4075
        break;
       } else {
        _abort(); //@line 4078
       }
      }
     } while (0);
     L78 : do {
      if ($156 | 0) {
       $184 = HEAP32[$$0190$i + 28 >> 2] | 0; //@line 4087
       $185 = 3456 + ($184 << 2) | 0; //@line 4088
       do {
        if (($$0190$i | 0) == (HEAP32[$185 >> 2] | 0)) {
         HEAP32[$185 >> 2] = $$3$i; //@line 4093
         if (!$$3$i) {
          HEAP32[789] = $108 & ~(1 << $184); //@line 4099
          break L78;
         }
        } else {
         if ((HEAP32[792] | 0) >>> 0 > $156 >>> 0) {
          _abort(); //@line 4106
         } else {
          $193 = $156 + 16 | 0; //@line 4109
          HEAP32[((HEAP32[$193 >> 2] | 0) == ($$0190$i | 0) ? $193 : $156 + 20 | 0) >> 2] = $$3$i; //@line 4114
          if (!$$3$i) {
           break L78;
          } else {
           break;
          }
         }
        }
       } while (0);
       $198 = HEAP32[792] | 0; //@line 4124
       if ($198 >>> 0 > $$3$i >>> 0) {
        _abort(); //@line 4127
       }
       HEAP32[$$3$i + 24 >> 2] = $156; //@line 4131
       $202 = HEAP32[$$0190$i + 16 >> 2] | 0; //@line 4133
       do {
        if ($202 | 0) {
         if ($198 >>> 0 > $202 >>> 0) {
          _abort(); //@line 4139
         } else {
          HEAP32[$$3$i + 16 >> 2] = $202; //@line 4143
          HEAP32[$202 + 24 >> 2] = $$3$i; //@line 4145
          break;
         }
        }
       } while (0);
       $208 = HEAP32[$$0190$i + 20 >> 2] | 0; //@line 4151
       if ($208 | 0) {
        if ((HEAP32[792] | 0) >>> 0 > $208 >>> 0) {
         _abort(); //@line 4157
        } else {
         HEAP32[$$3$i + 20 >> 2] = $208; //@line 4161
         HEAP32[$208 + 24 >> 2] = $$3$i; //@line 4163
         break;
        }
       }
      }
     } while (0);
     if ($$0191$i >>> 0 < 16) {
      $215 = $$0191$i + $6 | 0; //@line 4171
      HEAP32[$$0190$i + 4 >> 2] = $215 | 3; //@line 4174
      $219 = $$0190$i + $215 + 4 | 0; //@line 4176
      HEAP32[$219 >> 2] = HEAP32[$219 >> 2] | 1; //@line 4179
     } else {
      HEAP32[$$0190$i + 4 >> 2] = $6 | 3; //@line 4183
      HEAP32[$153 + 4 >> 2] = $$0191$i | 1; //@line 4186
      HEAP32[$153 + $$0191$i >> 2] = $$0191$i; //@line 4188
      if ($37 | 0) {
       $228 = HEAP32[793] | 0; //@line 4191
       $229 = $37 >>> 3; //@line 4192
       $231 = 3192 + ($229 << 1 << 2) | 0; //@line 4194
       $232 = 1 << $229; //@line 4195
       if (!($232 & $8)) {
        HEAP32[788] = $232 | $8; //@line 4200
        $$0187$i = $231; //@line 4202
        $$pre$phi$iZ2D = $231 + 8 | 0; //@line 4202
       } else {
        $236 = $231 + 8 | 0; //@line 4204
        $237 = HEAP32[$236 >> 2] | 0; //@line 4205
        if ((HEAP32[792] | 0) >>> 0 > $237 >>> 0) {
         _abort(); //@line 4209
        } else {
         $$0187$i = $237; //@line 4212
         $$pre$phi$iZ2D = $236; //@line 4212
        }
       }
       HEAP32[$$pre$phi$iZ2D >> 2] = $228; //@line 4215
       HEAP32[$$0187$i + 12 >> 2] = $228; //@line 4217
       HEAP32[$228 + 8 >> 2] = $$0187$i; //@line 4219
       HEAP32[$228 + 12 >> 2] = $231; //@line 4221
      }
      HEAP32[790] = $$0191$i; //@line 4223
      HEAP32[793] = $153; //@line 4224
     }
     $$0 = $$0190$i + 8 | 0; //@line 4227
     STACKTOP = sp; //@line 4228
     return $$0 | 0; //@line 4228
    }
   } else {
    $$0197 = $6; //@line 4231
   }
  } else {
   if ($0 >>> 0 > 4294967231) {
    $$0197 = -1; //@line 4236
   } else {
    $245 = $0 + 11 | 0; //@line 4238
    $246 = $245 & -8; //@line 4239
    $247 = HEAP32[789] | 0; //@line 4240
    if (!$247) {
     $$0197 = $246; //@line 4243
    } else {
     $249 = 0 - $246 | 0; //@line 4245
     $250 = $245 >>> 8; //@line 4246
     if (!$250) {
      $$0357$i = 0; //@line 4249
     } else {
      if ($246 >>> 0 > 16777215) {
       $$0357$i = 31; //@line 4253
      } else {
       $255 = ($250 + 1048320 | 0) >>> 16 & 8; //@line 4257
       $256 = $250 << $255; //@line 4258
       $259 = ($256 + 520192 | 0) >>> 16 & 4; //@line 4261
       $261 = $256 << $259; //@line 4263
       $264 = ($261 + 245760 | 0) >>> 16 & 2; //@line 4266
       $269 = 14 - ($259 | $255 | $264) + ($261 << $264 >>> 15) | 0; //@line 4271
       $$0357$i = $246 >>> ($269 + 7 | 0) & 1 | $269 << 1; //@line 4277
      }
     }
     $276 = HEAP32[3456 + ($$0357$i << 2) >> 2] | 0; //@line 4281
     L122 : do {
      if (!$276) {
       $$2353$i = 0; //@line 4285
       $$3$i203 = 0; //@line 4285
       $$3348$i = $249; //@line 4285
       label = 85; //@line 4286
      } else {
       $$0340$i = 0; //@line 4293
       $$0345$i = $249; //@line 4293
       $$0351$i = $276; //@line 4293
       $$0358$i = $246 << (($$0357$i | 0) == 31 ? 0 : 25 - ($$0357$i >>> 1) | 0); //@line 4293
       $$0361$i = 0; //@line 4293
       while (1) {
        $286 = (HEAP32[$$0351$i + 4 >> 2] & -8) - $246 | 0; //@line 4298
        if ($286 >>> 0 < $$0345$i >>> 0) {
         if (!$286) {
          $$420$i$ph = $$0351$i; //@line 4303
          $$434919$i$ph = 0; //@line 4303
          $$535618$i$ph = $$0351$i; //@line 4303
          label = 89; //@line 4304
          break L122;
         } else {
          $$1341$i = $$0351$i; //@line 4307
          $$1346$i = $286; //@line 4307
         }
        } else {
         $$1341$i = $$0340$i; //@line 4310
         $$1346$i = $$0345$i; //@line 4310
        }
        $290 = HEAP32[$$0351$i + 20 >> 2] | 0; //@line 4313
        $$0351$i = HEAP32[$$0351$i + 16 + ($$0358$i >>> 31 << 2) >> 2] | 0; //@line 4316
        $$1362$i = ($290 | 0) == 0 | ($290 | 0) == ($$0351$i | 0) ? $$0361$i : $290; //@line 4320
        if (!$$0351$i) {
         $$2353$i = $$1362$i; //@line 4324
         $$3$i203 = $$1341$i; //@line 4324
         $$3348$i = $$1346$i; //@line 4324
         label = 85; //@line 4325
         break;
        } else {
         $$0340$i = $$1341$i; //@line 4328
         $$0345$i = $$1346$i; //@line 4328
         $$0358$i = $$0358$i << 1; //@line 4328
         $$0361$i = $$1362$i; //@line 4328
        }
       }
      }
     } while (0);
     if ((label | 0) == 85) {
      if (($$2353$i | 0) == 0 & ($$3$i203 | 0) == 0) {
       $299 = 2 << $$0357$i; //@line 4338
       $302 = ($299 | 0 - $299) & $247; //@line 4341
       if (!$302) {
        $$0197 = $246; //@line 4344
        break;
       }
       $306 = ($302 & 0 - $302) + -1 | 0; //@line 4349
       $308 = $306 >>> 12 & 16; //@line 4351
       $309 = $306 >>> $308; //@line 4352
       $311 = $309 >>> 5 & 8; //@line 4354
       $313 = $309 >>> $311; //@line 4356
       $315 = $313 >>> 2 & 4; //@line 4358
       $317 = $313 >>> $315; //@line 4360
       $319 = $317 >>> 1 & 2; //@line 4362
       $321 = $317 >>> $319; //@line 4364
       $323 = $321 >>> 1 & 1; //@line 4366
       $$3$i203218 = 0; //@line 4372
       $$4355$i = HEAP32[3456 + (($311 | $308 | $315 | $319 | $323) + ($321 >>> $323) << 2) >> 2] | 0; //@line 4372
      } else {
       $$3$i203218 = $$3$i203; //@line 4374
       $$4355$i = $$2353$i; //@line 4374
      }
      if (!$$4355$i) {
       $$4$lcssa$i = $$3$i203218; //@line 4378
       $$4349$lcssa$i = $$3348$i; //@line 4378
      } else {
       $$420$i$ph = $$3$i203218; //@line 4380
       $$434919$i$ph = $$3348$i; //@line 4380
       $$535618$i$ph = $$4355$i; //@line 4380
       label = 89; //@line 4381
      }
     }
     if ((label | 0) == 89) {
      $$420$i = $$420$i$ph; //@line 4385
      $$434919$i = $$434919$i$ph; //@line 4385
      $$535618$i = $$535618$i$ph; //@line 4385
      while (1) {
       $333 = (HEAP32[$$535618$i + 4 >> 2] & -8) - $246 | 0; //@line 4390
       $334 = $333 >>> 0 < $$434919$i >>> 0; //@line 4391
       $spec$select$i205 = $334 ? $333 : $$434919$i; //@line 4392
       $spec$select3$i = $334 ? $$535618$i : $$420$i; //@line 4393
       $336 = HEAP32[$$535618$i + 16 >> 2] | 0; //@line 4395
       if (!$336) {
        $341 = HEAP32[$$535618$i + 20 >> 2] | 0; //@line 4400
       } else {
        $341 = $336; //@line 4402
       }
       if (!$341) {
        $$4$lcssa$i = $spec$select3$i; //@line 4406
        $$4349$lcssa$i = $spec$select$i205; //@line 4406
        break;
       } else {
        $$420$i = $spec$select3$i; //@line 4409
        $$434919$i = $spec$select$i205; //@line 4409
        $$535618$i = $341; //@line 4409
       }
      }
     }
     if (!$$4$lcssa$i) {
      $$0197 = $246; //@line 4415
     } else {
      if ($$4349$lcssa$i >>> 0 < ((HEAP32[790] | 0) - $246 | 0) >>> 0) {
       $346 = HEAP32[792] | 0; //@line 4421
       if ($346 >>> 0 > $$4$lcssa$i >>> 0) {
        _abort(); //@line 4424
       }
       $348 = $$4$lcssa$i + $246 | 0; //@line 4427
       if ($348 >>> 0 <= $$4$lcssa$i >>> 0) {
        _abort(); //@line 4430
       }
       $351 = HEAP32[$$4$lcssa$i + 24 >> 2] | 0; //@line 4434
       $353 = HEAP32[$$4$lcssa$i + 12 >> 2] | 0; //@line 4436
       do {
        if (($353 | 0) == ($$4$lcssa$i | 0)) {
         $364 = $$4$lcssa$i + 20 | 0; //@line 4440
         $365 = HEAP32[$364 >> 2] | 0; //@line 4441
         if (!$365) {
          $367 = $$4$lcssa$i + 16 | 0; //@line 4444
          $368 = HEAP32[$367 >> 2] | 0; //@line 4445
          if (!$368) {
           $$3371$i = 0; //@line 4448
           break;
          } else {
           $$1369$i$ph = $368; //@line 4451
           $$1373$i$ph = $367; //@line 4451
          }
         } else {
          $$1369$i$ph = $365; //@line 4454
          $$1373$i$ph = $364; //@line 4454
         }
         $$1369$i = $$1369$i$ph; //@line 4456
         $$1373$i = $$1373$i$ph; //@line 4456
         while (1) {
          $370 = $$1369$i + 20 | 0; //@line 4458
          $371 = HEAP32[$370 >> 2] | 0; //@line 4459
          if (!$371) {
           $373 = $$1369$i + 16 | 0; //@line 4462
           $374 = HEAP32[$373 >> 2] | 0; //@line 4463
           if (!$374) {
            break;
           } else {
            $$1369$i$be = $374; //@line 4468
            $$1373$i$be = $373; //@line 4468
           }
          } else {
           $$1369$i$be = $371; //@line 4471
           $$1373$i$be = $370; //@line 4471
          }
          $$1369$i = $$1369$i$be; //@line 4473
          $$1373$i = $$1373$i$be; //@line 4473
         }
         if ($346 >>> 0 > $$1373$i >>> 0) {
          _abort(); //@line 4477
         } else {
          HEAP32[$$1373$i >> 2] = 0; //@line 4480
          $$3371$i = $$1369$i; //@line 4481
          break;
         }
        } else {
         $356 = HEAP32[$$4$lcssa$i + 8 >> 2] | 0; //@line 4486
         if ($346 >>> 0 > $356 >>> 0) {
          _abort(); //@line 4489
         }
         $358 = $356 + 12 | 0; //@line 4492
         if ((HEAP32[$358 >> 2] | 0) != ($$4$lcssa$i | 0)) {
          _abort(); //@line 4496
         }
         $361 = $353 + 8 | 0; //@line 4499
         if ((HEAP32[$361 >> 2] | 0) == ($$4$lcssa$i | 0)) {
          HEAP32[$358 >> 2] = $353; //@line 4503
          HEAP32[$361 >> 2] = $356; //@line 4504
          $$3371$i = $353; //@line 4505
          break;
         } else {
          _abort(); //@line 4508
         }
        }
       } while (0);
       L176 : do {
        if (!$351) {
         $469 = $247; //@line 4516
        } else {
         $379 = HEAP32[$$4$lcssa$i + 28 >> 2] | 0; //@line 4519
         $380 = 3456 + ($379 << 2) | 0; //@line 4520
         do {
          if (($$4$lcssa$i | 0) == (HEAP32[$380 >> 2] | 0)) {
           HEAP32[$380 >> 2] = $$3371$i; //@line 4525
           if (!$$3371$i) {
            $385 = $247 & ~(1 << $379); //@line 4530
            HEAP32[789] = $385; //@line 4531
            $469 = $385; //@line 4532
            break L176;
           }
          } else {
           if ((HEAP32[792] | 0) >>> 0 > $351 >>> 0) {
            _abort(); //@line 4539
           } else {
            $388 = $351 + 16 | 0; //@line 4542
            HEAP32[((HEAP32[$388 >> 2] | 0) == ($$4$lcssa$i | 0) ? $388 : $351 + 20 | 0) >> 2] = $$3371$i; //@line 4547
            if (!$$3371$i) {
             $469 = $247; //@line 4550
             break L176;
            } else {
             break;
            }
           }
          }
         } while (0);
         $393 = HEAP32[792] | 0; //@line 4558
         if ($393 >>> 0 > $$3371$i >>> 0) {
          _abort(); //@line 4561
         }
         HEAP32[$$3371$i + 24 >> 2] = $351; //@line 4565
         $397 = HEAP32[$$4$lcssa$i + 16 >> 2] | 0; //@line 4567
         do {
          if ($397 | 0) {
           if ($393 >>> 0 > $397 >>> 0) {
            _abort(); //@line 4573
           } else {
            HEAP32[$$3371$i + 16 >> 2] = $397; //@line 4577
            HEAP32[$397 + 24 >> 2] = $$3371$i; //@line 4579
            break;
           }
          }
         } while (0);
         $403 = HEAP32[$$4$lcssa$i + 20 >> 2] | 0; //@line 4585
         if (!$403) {
          $469 = $247; //@line 4588
         } else {
          if ((HEAP32[792] | 0) >>> 0 > $403 >>> 0) {
           _abort(); //@line 4593
          } else {
           HEAP32[$$3371$i + 20 >> 2] = $403; //@line 4597
           HEAP32[$403 + 24 >> 2] = $$3371$i; //@line 4599
           $469 = $247; //@line 4600
           break;
          }
         }
        }
       } while (0);
       L200 : do {
        if ($$4349$lcssa$i >>> 0 < 16) {
         $410 = $$4349$lcssa$i + $246 | 0; //@line 4609
         HEAP32[$$4$lcssa$i + 4 >> 2] = $410 | 3; //@line 4612
         $414 = $$4$lcssa$i + $410 + 4 | 0; //@line 4614
         HEAP32[$414 >> 2] = HEAP32[$414 >> 2] | 1; //@line 4617
        } else {
         HEAP32[$$4$lcssa$i + 4 >> 2] = $246 | 3; //@line 4621
         HEAP32[$348 + 4 >> 2] = $$4349$lcssa$i | 1; //@line 4624
         HEAP32[$348 + $$4349$lcssa$i >> 2] = $$4349$lcssa$i; //@line 4626
         $422 = $$4349$lcssa$i >>> 3; //@line 4627
         if ($$4349$lcssa$i >>> 0 < 256) {
          $425 = 3192 + ($422 << 1 << 2) | 0; //@line 4631
          $426 = HEAP32[788] | 0; //@line 4632
          $427 = 1 << $422; //@line 4633
          if (!($426 & $427)) {
           HEAP32[788] = $426 | $427; //@line 4638
           $$0367$i = $425; //@line 4640
           $$pre$phi$i209Z2D = $425 + 8 | 0; //@line 4640
          } else {
           $431 = $425 + 8 | 0; //@line 4642
           $432 = HEAP32[$431 >> 2] | 0; //@line 4643
           if ((HEAP32[792] | 0) >>> 0 > $432 >>> 0) {
            _abort(); //@line 4647
           } else {
            $$0367$i = $432; //@line 4650
            $$pre$phi$i209Z2D = $431; //@line 4650
           }
          }
          HEAP32[$$pre$phi$i209Z2D >> 2] = $348; //@line 4653
          HEAP32[$$0367$i + 12 >> 2] = $348; //@line 4655
          HEAP32[$348 + 8 >> 2] = $$0367$i; //@line 4657
          HEAP32[$348 + 12 >> 2] = $425; //@line 4659
          break;
         }
         $438 = $$4349$lcssa$i >>> 8; //@line 4662
         if (!$438) {
          $$0360$i = 0; //@line 4665
         } else {
          if ($$4349$lcssa$i >>> 0 > 16777215) {
           $$0360$i = 31; //@line 4669
          } else {
           $443 = ($438 + 1048320 | 0) >>> 16 & 8; //@line 4673
           $444 = $438 << $443; //@line 4674
           $447 = ($444 + 520192 | 0) >>> 16 & 4; //@line 4677
           $449 = $444 << $447; //@line 4679
           $452 = ($449 + 245760 | 0) >>> 16 & 2; //@line 4682
           $457 = 14 - ($447 | $443 | $452) + ($449 << $452 >>> 15) | 0; //@line 4687
           $$0360$i = $$4349$lcssa$i >>> ($457 + 7 | 0) & 1 | $457 << 1; //@line 4693
          }
         }
         $463 = 3456 + ($$0360$i << 2) | 0; //@line 4696
         HEAP32[$348 + 28 >> 2] = $$0360$i; //@line 4698
         $465 = $348 + 16 | 0; //@line 4699
         HEAP32[$465 + 4 >> 2] = 0; //@line 4701
         HEAP32[$465 >> 2] = 0; //@line 4702
         $467 = 1 << $$0360$i; //@line 4703
         if (!($469 & $467)) {
          HEAP32[789] = $469 | $467; //@line 4708
          HEAP32[$463 >> 2] = $348; //@line 4709
          HEAP32[$348 + 24 >> 2] = $463; //@line 4711
          HEAP32[$348 + 12 >> 2] = $348; //@line 4713
          HEAP32[$348 + 8 >> 2] = $348; //@line 4715
          break;
         }
         $475 = HEAP32[$463 >> 2] | 0; //@line 4718
         L218 : do {
          if ((HEAP32[$475 + 4 >> 2] & -8 | 0) == ($$4349$lcssa$i | 0)) {
           $$0343$lcssa$i = $475; //@line 4725
          } else {
           $$034217$i = $$4349$lcssa$i << (($$0360$i | 0) == 31 ? 0 : 25 - ($$0360$i >>> 1) | 0); //@line 4732
           $$034316$i = $475; //@line 4732
           while (1) {
            $492 = $$034316$i + 16 + ($$034217$i >>> 31 << 2) | 0; //@line 4735
            $487 = HEAP32[$492 >> 2] | 0; //@line 4736
            if (!$487) {
             break;
            }
            if ((HEAP32[$487 + 4 >> 2] & -8 | 0) == ($$4349$lcssa$i | 0)) {
             $$0343$lcssa$i = $487; //@line 4747
             break L218;
            } else {
             $$034217$i = $$034217$i << 1; //@line 4750
             $$034316$i = $487; //@line 4750
            }
           }
           if ((HEAP32[792] | 0) >>> 0 > $492 >>> 0) {
            _abort(); //@line 4756
           } else {
            HEAP32[$492 >> 2] = $348; //@line 4759
            HEAP32[$348 + 24 >> 2] = $$034316$i; //@line 4761
            HEAP32[$348 + 12 >> 2] = $348; //@line 4763
            HEAP32[$348 + 8 >> 2] = $348; //@line 4765
            break L200;
           }
          }
         } while (0);
         $499 = $$0343$lcssa$i + 8 | 0; //@line 4770
         $500 = HEAP32[$499 >> 2] | 0; //@line 4771
         $501 = HEAP32[792] | 0; //@line 4772
         if ($501 >>> 0 <= $500 >>> 0 & $501 >>> 0 <= $$0343$lcssa$i >>> 0) {
          HEAP32[$500 + 12 >> 2] = $348; //@line 4778
          HEAP32[$499 >> 2] = $348; //@line 4779
          HEAP32[$348 + 8 >> 2] = $500; //@line 4781
          HEAP32[$348 + 12 >> 2] = $$0343$lcssa$i; //@line 4783
          HEAP32[$348 + 24 >> 2] = 0; //@line 4785
          break;
         } else {
          _abort(); //@line 4788
         }
        }
       } while (0);
       $$0 = $$4$lcssa$i + 8 | 0; //@line 4794
       STACKTOP = sp; //@line 4795
       return $$0 | 0; //@line 4795
      } else {
       $$0197 = $246; //@line 4797
      }
     }
    }
   }
  }
 } while (0);
 $510 = HEAP32[790] | 0; //@line 4804
 if ($510 >>> 0 >= $$0197 >>> 0) {
  $512 = $510 - $$0197 | 0; //@line 4807
  $513 = HEAP32[793] | 0; //@line 4808
  if ($512 >>> 0 > 15) {
   $515 = $513 + $$0197 | 0; //@line 4811
   HEAP32[793] = $515; //@line 4812
   HEAP32[790] = $512; //@line 4813
   HEAP32[$515 + 4 >> 2] = $512 | 1; //@line 4816
   HEAP32[$513 + $510 >> 2] = $512; //@line 4818
   HEAP32[$513 + 4 >> 2] = $$0197 | 3; //@line 4821
  } else {
   HEAP32[790] = 0; //@line 4823
   HEAP32[793] = 0; //@line 4824
   HEAP32[$513 + 4 >> 2] = $510 | 3; //@line 4827
   $524 = $513 + $510 + 4 | 0; //@line 4829
   HEAP32[$524 >> 2] = HEAP32[$524 >> 2] | 1; //@line 4832
  }
  $$0 = $513 + 8 | 0; //@line 4835
  STACKTOP = sp; //@line 4836
  return $$0 | 0; //@line 4836
 }
 $528 = HEAP32[791] | 0; //@line 4838
 if ($528 >>> 0 > $$0197 >>> 0) {
  $530 = $528 - $$0197 | 0; //@line 4841
  HEAP32[791] = $530; //@line 4842
  $531 = HEAP32[794] | 0; //@line 4843
  $532 = $531 + $$0197 | 0; //@line 4844
  HEAP32[794] = $532; //@line 4845
  HEAP32[$532 + 4 >> 2] = $530 | 1; //@line 4848
  HEAP32[$531 + 4 >> 2] = $$0197 | 3; //@line 4851
  $$0 = $531 + 8 | 0; //@line 4853
  STACKTOP = sp; //@line 4854
  return $$0 | 0; //@line 4854
 }
 if (!(HEAP32[906] | 0)) {
  HEAP32[908] = 4096; //@line 4859
  HEAP32[907] = 4096; //@line 4860
  HEAP32[909] = -1; //@line 4861
  HEAP32[910] = -1; //@line 4862
  HEAP32[911] = 0; //@line 4863
  HEAP32[899] = 0; //@line 4864
  HEAP32[906] = $1 & -16 ^ 1431655768; //@line 4868
  $546 = 4096; //@line 4869
 } else {
  $546 = HEAP32[908] | 0; //@line 4872
 }
 $543 = $$0197 + 48 | 0; //@line 4874
 $544 = $$0197 + 47 | 0; //@line 4875
 $545 = $546 + $544 | 0; //@line 4876
 $547 = 0 - $546 | 0; //@line 4877
 $548 = $545 & $547; //@line 4878
 if ($548 >>> 0 <= $$0197 >>> 0) {
  $$0 = 0; //@line 4881
  STACKTOP = sp; //@line 4882
  return $$0 | 0; //@line 4882
 }
 $550 = HEAP32[898] | 0; //@line 4884
 if ($550 | 0) {
  $552 = HEAP32[896] | 0; //@line 4887
  $553 = $552 + $548 | 0; //@line 4888
  if ($553 >>> 0 <= $552 >>> 0 | $553 >>> 0 > $550 >>> 0) {
   $$0 = 0; //@line 4893
   STACKTOP = sp; //@line 4894
   return $$0 | 0; //@line 4894
  }
 }
 L257 : do {
  if (!(HEAP32[899] & 4)) {
   $559 = HEAP32[794] | 0; //@line 4902
   L259 : do {
    if (!$559) {
     label = 173; //@line 4906
    } else {
     $$0$i$i = 3600; //@line 4908
     while (1) {
      $561 = HEAP32[$$0$i$i >> 2] | 0; //@line 4910
      if ($561 >>> 0 <= $559 >>> 0) {
       if (($561 + (HEAP32[$$0$i$i + 4 >> 2] | 0) | 0) >>> 0 > $559 >>> 0) {
        break;
       }
      }
      $568 = HEAP32[$$0$i$i + 8 >> 2] | 0; //@line 4922
      if (!$568) {
       label = 173; //@line 4925
       break L259;
      } else {
       $$0$i$i = $568; //@line 4928
      }
     }
     $593 = $545 - $528 & $547; //@line 4932
     if ($593 >>> 0 < 2147483647) {
      $596 = _sbrk($593 | 0) | 0; //@line 4936
      if (($596 | 0) == ((HEAP32[$$0$i$i >> 2] | 0) + (HEAP32[$$0$i$i + 4 >> 2] | 0) | 0)) {
       if (($596 | 0) == (-1 | 0)) {
        $$2234243136$i = $593; //@line 4944
       } else {
        $$723947$i = $593; //@line 4946
        $$748$i = $596; //@line 4946
        label = 190; //@line 4947
        break L257;
       }
      } else {
       $$2247$ph$i = $596; //@line 4951
       $$2253$ph$i = $593; //@line 4951
       label = 181; //@line 4952
      }
     } else {
      $$2234243136$i = 0; //@line 4955
     }
    }
   } while (0);
   do {
    if ((label | 0) == 173) {
     $570 = _sbrk(0) | 0; //@line 4961
     if (($570 | 0) == (-1 | 0)) {
      $$2234243136$i = 0; //@line 4964
     } else {
      $572 = $570; //@line 4966
      $573 = HEAP32[907] | 0; //@line 4967
      $574 = $573 + -1 | 0; //@line 4968
      $spec$select49$i = (($574 & $572 | 0) == 0 ? 0 : ($574 + $572 & 0 - $573) - $572 | 0) + $548 | 0; //@line 4976
      $582 = HEAP32[896] | 0; //@line 4977
      $583 = $spec$select49$i + $582 | 0; //@line 4978
      if ($spec$select49$i >>> 0 > $$0197 >>> 0 & $spec$select49$i >>> 0 < 2147483647) {
       $586 = HEAP32[898] | 0; //@line 4983
       if ($586 | 0) {
        if ($583 >>> 0 <= $582 >>> 0 | $583 >>> 0 > $586 >>> 0) {
         $$2234243136$i = 0; //@line 4990
         break;
        }
       }
       $590 = _sbrk($spec$select49$i | 0) | 0; //@line 4994
       if (($590 | 0) == ($570 | 0)) {
        $$723947$i = $spec$select49$i; //@line 4997
        $$748$i = $570; //@line 4997
        label = 190; //@line 4998
        break L257;
       } else {
        $$2247$ph$i = $590; //@line 5001
        $$2253$ph$i = $spec$select49$i; //@line 5001
        label = 181; //@line 5002
       }
      } else {
       $$2234243136$i = 0; //@line 5005
      }
     }
    }
   } while (0);
   do {
    if ((label | 0) == 181) {
     $602 = 0 - $$2253$ph$i | 0; //@line 5012
     if (!($543 >>> 0 > $$2253$ph$i >>> 0 & ($$2253$ph$i >>> 0 < 2147483647 & ($$2247$ph$i | 0) != (-1 | 0)))) {
      if (($$2247$ph$i | 0) == (-1 | 0)) {
       $$2234243136$i = 0; //@line 5021
       break;
      } else {
       $$723947$i = $$2253$ph$i; //@line 5024
       $$748$i = $$2247$ph$i; //@line 5024
       label = 190; //@line 5025
       break L257;
      }
     }
     $606 = HEAP32[908] | 0; //@line 5029
     $610 = $544 - $$2253$ph$i + $606 & 0 - $606; //@line 5033
     if ($610 >>> 0 >= 2147483647) {
      $$723947$i = $$2253$ph$i; //@line 5036
      $$748$i = $$2247$ph$i; //@line 5036
      label = 190; //@line 5037
      break L257;
     }
     if ((_sbrk($610 | 0) | 0) == (-1 | 0)) {
      _sbrk($602 | 0) | 0; //@line 5043
      $$2234243136$i = 0; //@line 5044
      break;
     } else {
      $$723947$i = $610 + $$2253$ph$i | 0; //@line 5048
      $$748$i = $$2247$ph$i; //@line 5048
      label = 190; //@line 5049
      break L257;
     }
    }
   } while (0);
   HEAP32[899] = HEAP32[899] | 4; //@line 5056
   $$4236$i = $$2234243136$i; //@line 5057
   label = 188; //@line 5058
  } else {
   $$4236$i = 0; //@line 5060
   label = 188; //@line 5061
  }
 } while (0);
 if ((label | 0) == 188) {
  if ($548 >>> 0 < 2147483647) {
   $619 = _sbrk($548 | 0) | 0; //@line 5067
   $620 = _sbrk(0) | 0; //@line 5068
   $626 = $620 - $619 | 0; //@line 5076
   $628 = $626 >>> 0 > ($$0197 + 40 | 0) >>> 0; //@line 5078
   if (!(($619 | 0) == (-1 | 0) | $628 ^ 1 | $619 >>> 0 < $620 >>> 0 & (($619 | 0) != (-1 | 0) & ($620 | 0) != (-1 | 0)) ^ 1)) {
    $$723947$i = $628 ? $626 : $$4236$i; //@line 5086
    $$748$i = $619; //@line 5086
    label = 190; //@line 5087
   }
  }
 }
 if ((label | 0) == 190) {
  $632 = (HEAP32[896] | 0) + $$723947$i | 0; //@line 5093
  HEAP32[896] = $632; //@line 5094
  if ($632 >>> 0 > (HEAP32[897] | 0) >>> 0) {
   HEAP32[897] = $632; //@line 5098
  }
  $635 = HEAP32[794] | 0; //@line 5100
  L294 : do {
   if (!$635) {
    $637 = HEAP32[792] | 0; //@line 5104
    if (($637 | 0) == 0 | $$748$i >>> 0 < $637 >>> 0) {
     HEAP32[792] = $$748$i; //@line 5109
    }
    HEAP32[900] = $$748$i; //@line 5111
    HEAP32[901] = $$723947$i; //@line 5112
    HEAP32[903] = 0; //@line 5113
    HEAP32[797] = HEAP32[906]; //@line 5115
    HEAP32[796] = -1; //@line 5116
    HEAP32[801] = 3192; //@line 5117
    HEAP32[800] = 3192; //@line 5118
    HEAP32[803] = 3200; //@line 5119
    HEAP32[802] = 3200; //@line 5120
    HEAP32[805] = 3208; //@line 5121
    HEAP32[804] = 3208; //@line 5122
    HEAP32[807] = 3216; //@line 5123
    HEAP32[806] = 3216; //@line 5124
    HEAP32[809] = 3224; //@line 5125
    HEAP32[808] = 3224; //@line 5126
    HEAP32[811] = 3232; //@line 5127
    HEAP32[810] = 3232; //@line 5128
    HEAP32[813] = 3240; //@line 5129
    HEAP32[812] = 3240; //@line 5130
    HEAP32[815] = 3248; //@line 5131
    HEAP32[814] = 3248; //@line 5132
    HEAP32[817] = 3256; //@line 5133
    HEAP32[816] = 3256; //@line 5134
    HEAP32[819] = 3264; //@line 5135
    HEAP32[818] = 3264; //@line 5136
    HEAP32[821] = 3272; //@line 5137
    HEAP32[820] = 3272; //@line 5138
    HEAP32[823] = 3280; //@line 5139
    HEAP32[822] = 3280; //@line 5140
    HEAP32[825] = 3288; //@line 5141
    HEAP32[824] = 3288; //@line 5142
    HEAP32[827] = 3296; //@line 5143
    HEAP32[826] = 3296; //@line 5144
    HEAP32[829] = 3304; //@line 5145
    HEAP32[828] = 3304; //@line 5146
    HEAP32[831] = 3312; //@line 5147
    HEAP32[830] = 3312; //@line 5148
    HEAP32[833] = 3320; //@line 5149
    HEAP32[832] = 3320; //@line 5150
    HEAP32[835] = 3328; //@line 5151
    HEAP32[834] = 3328; //@line 5152
    HEAP32[837] = 3336; //@line 5153
    HEAP32[836] = 3336; //@line 5154
    HEAP32[839] = 3344; //@line 5155
    HEAP32[838] = 3344; //@line 5156
    HEAP32[841] = 3352; //@line 5157
    HEAP32[840] = 3352; //@line 5158
    HEAP32[843] = 3360; //@line 5159
    HEAP32[842] = 3360; //@line 5160
    HEAP32[845] = 3368; //@line 5161
    HEAP32[844] = 3368; //@line 5162
    HEAP32[847] = 3376; //@line 5163
    HEAP32[846] = 3376; //@line 5164
    HEAP32[849] = 3384; //@line 5165
    HEAP32[848] = 3384; //@line 5166
    HEAP32[851] = 3392; //@line 5167
    HEAP32[850] = 3392; //@line 5168
    HEAP32[853] = 3400; //@line 5169
    HEAP32[852] = 3400; //@line 5170
    HEAP32[855] = 3408; //@line 5171
    HEAP32[854] = 3408; //@line 5172
    HEAP32[857] = 3416; //@line 5173
    HEAP32[856] = 3416; //@line 5174
    HEAP32[859] = 3424; //@line 5175
    HEAP32[858] = 3424; //@line 5176
    HEAP32[861] = 3432; //@line 5177
    HEAP32[860] = 3432; //@line 5178
    HEAP32[863] = 3440; //@line 5179
    HEAP32[862] = 3440; //@line 5180
    $641 = $$723947$i + -40 | 0; //@line 5181
    $643 = $$748$i + 8 | 0; //@line 5183
    $648 = ($643 & 7 | 0) == 0 ? 0 : 0 - $643 & 7; //@line 5188
    $649 = $$748$i + $648 | 0; //@line 5189
    $650 = $641 - $648 | 0; //@line 5190
    HEAP32[794] = $649; //@line 5191
    HEAP32[791] = $650; //@line 5192
    HEAP32[$649 + 4 >> 2] = $650 | 1; //@line 5195
    HEAP32[$$748$i + $641 + 4 >> 2] = 40; //@line 5198
    HEAP32[795] = HEAP32[910]; //@line 5200
   } else {
    $$024372$i = 3600; //@line 5202
    while (1) {
     $656 = HEAP32[$$024372$i >> 2] | 0; //@line 5204
     $658 = HEAP32[$$024372$i + 4 >> 2] | 0; //@line 5206
     if (($$748$i | 0) == ($656 + $658 | 0)) {
      label = 199; //@line 5210
      break;
     }
     $662 = HEAP32[$$024372$i + 8 >> 2] | 0; //@line 5214
     if (!$662) {
      break;
     } else {
      $$024372$i = $662; //@line 5219
     }
    }
    if ((label | 0) == 199) {
     $664 = $$024372$i + 4 | 0; //@line 5223
     if (!(HEAP32[$$024372$i + 12 >> 2] & 8)) {
      if ($$748$i >>> 0 > $635 >>> 0 & $656 >>> 0 <= $635 >>> 0) {
       HEAP32[$664 >> 2] = $658 + $$723947$i; //@line 5234
       $673 = (HEAP32[791] | 0) + $$723947$i | 0; //@line 5236
       $675 = $635 + 8 | 0; //@line 5238
       $680 = ($675 & 7 | 0) == 0 ? 0 : 0 - $675 & 7; //@line 5243
       $681 = $635 + $680 | 0; //@line 5244
       $682 = $673 - $680 | 0; //@line 5245
       HEAP32[794] = $681; //@line 5246
       HEAP32[791] = $682; //@line 5247
       HEAP32[$681 + 4 >> 2] = $682 | 1; //@line 5250
       HEAP32[$635 + $673 + 4 >> 2] = 40; //@line 5253
       HEAP32[795] = HEAP32[910]; //@line 5255
       break;
      }
     }
    }
    $688 = HEAP32[792] | 0; //@line 5260
    if ($$748$i >>> 0 < $688 >>> 0) {
     HEAP32[792] = $$748$i; //@line 5263
     $753 = $$748$i; //@line 5264
    } else {
     $753 = $688; //@line 5266
    }
    $690 = $$748$i + $$723947$i | 0; //@line 5268
    $$124471$i = 3600; //@line 5269
    while (1) {
     if ((HEAP32[$$124471$i >> 2] | 0) == ($690 | 0)) {
      label = 207; //@line 5274
      break;
     }
     $694 = HEAP32[$$124471$i + 8 >> 2] | 0; //@line 5278
     if (!$694) {
      break;
     } else {
      $$124471$i = $694; //@line 5283
     }
    }
    if ((label | 0) == 207) {
     if (!(HEAP32[$$124471$i + 12 >> 2] & 8)) {
      HEAP32[$$124471$i >> 2] = $$748$i; //@line 5292
      $700 = $$124471$i + 4 | 0; //@line 5293
      HEAP32[$700 >> 2] = (HEAP32[$700 >> 2] | 0) + $$723947$i; //@line 5296
      $704 = $$748$i + 8 | 0; //@line 5298
      $710 = $$748$i + (($704 & 7 | 0) == 0 ? 0 : 0 - $704 & 7) | 0; //@line 5304
      $712 = $690 + 8 | 0; //@line 5306
      $718 = $690 + (($712 & 7 | 0) == 0 ? 0 : 0 - $712 & 7) | 0; //@line 5312
      $722 = $710 + $$0197 | 0; //@line 5316
      $723 = $718 - $710 - $$0197 | 0; //@line 5317
      HEAP32[$710 + 4 >> 2] = $$0197 | 3; //@line 5320
      L317 : do {
       if (($635 | 0) == ($718 | 0)) {
        $728 = (HEAP32[791] | 0) + $723 | 0; //@line 5325
        HEAP32[791] = $728; //@line 5326
        HEAP32[794] = $722; //@line 5327
        HEAP32[$722 + 4 >> 2] = $728 | 1; //@line 5330
       } else {
        if ((HEAP32[793] | 0) == ($718 | 0)) {
         $734 = (HEAP32[790] | 0) + $723 | 0; //@line 5336
         HEAP32[790] = $734; //@line 5337
         HEAP32[793] = $722; //@line 5338
         HEAP32[$722 + 4 >> 2] = $734 | 1; //@line 5341
         HEAP32[$722 + $734 >> 2] = $734; //@line 5343
         break;
        }
        $739 = HEAP32[$718 + 4 >> 2] | 0; //@line 5347
        if (($739 & 3 | 0) == 1) {
         $742 = $739 & -8; //@line 5351
         $743 = $739 >>> 3; //@line 5352
         L325 : do {
          if ($739 >>> 0 < 256) {
           $746 = HEAP32[$718 + 8 >> 2] | 0; //@line 5357
           $748 = HEAP32[$718 + 12 >> 2] | 0; //@line 5359
           $750 = 3192 + ($743 << 1 << 2) | 0; //@line 5361
           do {
            if (($746 | 0) != ($750 | 0)) {
             if ($753 >>> 0 > $746 >>> 0) {
              _abort(); //@line 5367
             }
             if ((HEAP32[$746 + 12 >> 2] | 0) == ($718 | 0)) {
              break;
             }
             _abort(); //@line 5376
            }
           } while (0);
           if (($748 | 0) == ($746 | 0)) {
            HEAP32[788] = HEAP32[788] & ~(1 << $743); //@line 5386
            break;
           }
           do {
            if (($748 | 0) == ($750 | 0)) {
             $$pre$phi17$i$iZ2D = $748 + 8 | 0; //@line 5393
            } else {
             if ($753 >>> 0 > $748 >>> 0) {
              _abort(); //@line 5397
             }
             $764 = $748 + 8 | 0; //@line 5400
             if ((HEAP32[$764 >> 2] | 0) == ($718 | 0)) {
              $$pre$phi17$i$iZ2D = $764; //@line 5404
              break;
             }
             _abort(); //@line 5407
            }
           } while (0);
           HEAP32[$746 + 12 >> 2] = $748; //@line 5412
           HEAP32[$$pre$phi17$i$iZ2D >> 2] = $746; //@line 5413
          } else {
           $769 = HEAP32[$718 + 24 >> 2] | 0; //@line 5416
           $771 = HEAP32[$718 + 12 >> 2] | 0; //@line 5418
           do {
            if (($771 | 0) == ($718 | 0)) {
             $782 = $718 + 16 | 0; //@line 5422
             $783 = $782 + 4 | 0; //@line 5423
             $784 = HEAP32[$783 >> 2] | 0; //@line 5424
             if (!$784) {
              $786 = HEAP32[$782 >> 2] | 0; //@line 5427
              if (!$786) {
               $$3$i$i = 0; //@line 5430
               break;
              } else {
               $$1290$i$i$ph = $786; //@line 5433
               $$1292$i$i$ph = $782; //@line 5433
              }
             } else {
              $$1290$i$i$ph = $784; //@line 5436
              $$1292$i$i$ph = $783; //@line 5436
             }
             $$1290$i$i = $$1290$i$i$ph; //@line 5438
             $$1292$i$i = $$1292$i$i$ph; //@line 5438
             while (1) {
              $788 = $$1290$i$i + 20 | 0; //@line 5440
              $789 = HEAP32[$788 >> 2] | 0; //@line 5441
              if (!$789) {
               $791 = $$1290$i$i + 16 | 0; //@line 5444
               $792 = HEAP32[$791 >> 2] | 0; //@line 5445
               if (!$792) {
                break;
               } else {
                $$1290$i$i$be = $792; //@line 5450
                $$1292$i$i$be = $791; //@line 5450
               }
              } else {
               $$1290$i$i$be = $789; //@line 5453
               $$1292$i$i$be = $788; //@line 5453
              }
              $$1290$i$i = $$1290$i$i$be; //@line 5455
              $$1292$i$i = $$1292$i$i$be; //@line 5455
             }
             if ($753 >>> 0 > $$1292$i$i >>> 0) {
              _abort(); //@line 5459
             } else {
              HEAP32[$$1292$i$i >> 2] = 0; //@line 5462
              $$3$i$i = $$1290$i$i; //@line 5463
              break;
             }
            } else {
             $774 = HEAP32[$718 + 8 >> 2] | 0; //@line 5468
             if ($753 >>> 0 > $774 >>> 0) {
              _abort(); //@line 5471
             }
             $776 = $774 + 12 | 0; //@line 5474
             if ((HEAP32[$776 >> 2] | 0) != ($718 | 0)) {
              _abort(); //@line 5478
             }
             $779 = $771 + 8 | 0; //@line 5481
             if ((HEAP32[$779 >> 2] | 0) == ($718 | 0)) {
              HEAP32[$776 >> 2] = $771; //@line 5485
              HEAP32[$779 >> 2] = $774; //@line 5486
              $$3$i$i = $771; //@line 5487
              break;
             } else {
              _abort(); //@line 5490
             }
            }
           } while (0);
           if (!$769) {
            break;
           }
           $797 = HEAP32[$718 + 28 >> 2] | 0; //@line 5500
           $798 = 3456 + ($797 << 2) | 0; //@line 5501
           do {
            if ((HEAP32[$798 >> 2] | 0) == ($718 | 0)) {
             HEAP32[$798 >> 2] = $$3$i$i; //@line 5506
             if ($$3$i$i | 0) {
              break;
             }
             HEAP32[789] = HEAP32[789] & ~(1 << $797); //@line 5515
             break L325;
            } else {
             if ((HEAP32[792] | 0) >>> 0 > $769 >>> 0) {
              _abort(); //@line 5521
             } else {
              $807 = $769 + 16 | 0; //@line 5524
              HEAP32[((HEAP32[$807 >> 2] | 0) == ($718 | 0) ? $807 : $769 + 20 | 0) >> 2] = $$3$i$i; //@line 5529
              if (!$$3$i$i) {
               break L325;
              } else {
               break;
              }
             }
            }
           } while (0);
           $812 = HEAP32[792] | 0; //@line 5539
           if ($812 >>> 0 > $$3$i$i >>> 0) {
            _abort(); //@line 5542
           }
           HEAP32[$$3$i$i + 24 >> 2] = $769; //@line 5546
           $815 = $718 + 16 | 0; //@line 5547
           $816 = HEAP32[$815 >> 2] | 0; //@line 5548
           do {
            if ($816 | 0) {
             if ($812 >>> 0 > $816 >>> 0) {
              _abort(); //@line 5554
             } else {
              HEAP32[$$3$i$i + 16 >> 2] = $816; //@line 5558
              HEAP32[$816 + 24 >> 2] = $$3$i$i; //@line 5560
              break;
             }
            }
           } while (0);
           $822 = HEAP32[$815 + 4 >> 2] | 0; //@line 5566
           if (!$822) {
            break;
           }
           if ((HEAP32[792] | 0) >>> 0 > $822 >>> 0) {
            _abort(); //@line 5574
           } else {
            HEAP32[$$3$i$i + 20 >> 2] = $822; //@line 5578
            HEAP32[$822 + 24 >> 2] = $$3$i$i; //@line 5580
            break;
           }
          }
         } while (0);
         $$0$i16$i = $718 + $742 | 0; //@line 5587
         $$0286$i$i = $742 + $723 | 0; //@line 5587
        } else {
         $$0$i16$i = $718; //@line 5589
         $$0286$i$i = $723; //@line 5589
        }
        $830 = $$0$i16$i + 4 | 0; //@line 5591
        HEAP32[$830 >> 2] = HEAP32[$830 >> 2] & -2; //@line 5594
        HEAP32[$722 + 4 >> 2] = $$0286$i$i | 1; //@line 5597
        HEAP32[$722 + $$0286$i$i >> 2] = $$0286$i$i; //@line 5599
        $836 = $$0286$i$i >>> 3; //@line 5600
        if ($$0286$i$i >>> 0 < 256) {
         $839 = 3192 + ($836 << 1 << 2) | 0; //@line 5604
         $840 = HEAP32[788] | 0; //@line 5605
         $841 = 1 << $836; //@line 5606
         do {
          if (!($840 & $841)) {
           HEAP32[788] = $840 | $841; //@line 5612
           $$0294$i$i = $839; //@line 5614
           $$pre$phi$i18$iZ2D = $839 + 8 | 0; //@line 5614
          } else {
           $845 = $839 + 8 | 0; //@line 5616
           $846 = HEAP32[$845 >> 2] | 0; //@line 5617
           if ((HEAP32[792] | 0) >>> 0 <= $846 >>> 0) {
            $$0294$i$i = $846; //@line 5621
            $$pre$phi$i18$iZ2D = $845; //@line 5621
            break;
           }
           _abort(); //@line 5624
          }
         } while (0);
         HEAP32[$$pre$phi$i18$iZ2D >> 2] = $722; //@line 5628
         HEAP32[$$0294$i$i + 12 >> 2] = $722; //@line 5630
         HEAP32[$722 + 8 >> 2] = $$0294$i$i; //@line 5632
         HEAP32[$722 + 12 >> 2] = $839; //@line 5634
         break;
        }
        $852 = $$0286$i$i >>> 8; //@line 5637
        do {
         if (!$852) {
          $$0295$i$i = 0; //@line 5641
         } else {
          if ($$0286$i$i >>> 0 > 16777215) {
           $$0295$i$i = 31; //@line 5645
           break;
          }
          $857 = ($852 + 1048320 | 0) >>> 16 & 8; //@line 5650
          $858 = $852 << $857; //@line 5651
          $861 = ($858 + 520192 | 0) >>> 16 & 4; //@line 5654
          $863 = $858 << $861; //@line 5656
          $866 = ($863 + 245760 | 0) >>> 16 & 2; //@line 5659
          $871 = 14 - ($861 | $857 | $866) + ($863 << $866 >>> 15) | 0; //@line 5664
          $$0295$i$i = $$0286$i$i >>> ($871 + 7 | 0) & 1 | $871 << 1; //@line 5670
         }
        } while (0);
        $877 = 3456 + ($$0295$i$i << 2) | 0; //@line 5673
        HEAP32[$722 + 28 >> 2] = $$0295$i$i; //@line 5675
        $879 = $722 + 16 | 0; //@line 5676
        HEAP32[$879 + 4 >> 2] = 0; //@line 5678
        HEAP32[$879 >> 2] = 0; //@line 5679
        $881 = HEAP32[789] | 0; //@line 5680
        $882 = 1 << $$0295$i$i; //@line 5681
        if (!($881 & $882)) {
         HEAP32[789] = $881 | $882; //@line 5686
         HEAP32[$877 >> 2] = $722; //@line 5687
         HEAP32[$722 + 24 >> 2] = $877; //@line 5689
         HEAP32[$722 + 12 >> 2] = $722; //@line 5691
         HEAP32[$722 + 8 >> 2] = $722; //@line 5693
         break;
        }
        $889 = HEAP32[$877 >> 2] | 0; //@line 5696
        L410 : do {
         if ((HEAP32[$889 + 4 >> 2] & -8 | 0) == ($$0286$i$i | 0)) {
          $$0288$lcssa$i$i = $889; //@line 5703
         } else {
          $$028711$i$i = $$0286$i$i << (($$0295$i$i | 0) == 31 ? 0 : 25 - ($$0295$i$i >>> 1) | 0); //@line 5710
          $$028810$i$i = $889; //@line 5710
          while (1) {
           $906 = $$028810$i$i + 16 + ($$028711$i$i >>> 31 << 2) | 0; //@line 5713
           $901 = HEAP32[$906 >> 2] | 0; //@line 5714
           if (!$901) {
            break;
           }
           if ((HEAP32[$901 + 4 >> 2] & -8 | 0) == ($$0286$i$i | 0)) {
            $$0288$lcssa$i$i = $901; //@line 5725
            break L410;
           } else {
            $$028711$i$i = $$028711$i$i << 1; //@line 5728
            $$028810$i$i = $901; //@line 5728
           }
          }
          if ((HEAP32[792] | 0) >>> 0 > $906 >>> 0) {
           _abort(); //@line 5734
          } else {
           HEAP32[$906 >> 2] = $722; //@line 5737
           HEAP32[$722 + 24 >> 2] = $$028810$i$i; //@line 5739
           HEAP32[$722 + 12 >> 2] = $722; //@line 5741
           HEAP32[$722 + 8 >> 2] = $722; //@line 5743
           break L317;
          }
         }
        } while (0);
        $913 = $$0288$lcssa$i$i + 8 | 0; //@line 5748
        $914 = HEAP32[$913 >> 2] | 0; //@line 5749
        $915 = HEAP32[792] | 0; //@line 5750
        if ($915 >>> 0 <= $914 >>> 0 & $915 >>> 0 <= $$0288$lcssa$i$i >>> 0) {
         HEAP32[$914 + 12 >> 2] = $722; //@line 5756
         HEAP32[$913 >> 2] = $722; //@line 5757
         HEAP32[$722 + 8 >> 2] = $914; //@line 5759
         HEAP32[$722 + 12 >> 2] = $$0288$lcssa$i$i; //@line 5761
         HEAP32[$722 + 24 >> 2] = 0; //@line 5763
         break;
        } else {
         _abort(); //@line 5766
        }
       }
      } while (0);
      $$0 = $710 + 8 | 0; //@line 5772
      STACKTOP = sp; //@line 5773
      return $$0 | 0; //@line 5773
     }
    }
    $$0$i$i$i = 3600; //@line 5776
    while (1) {
     $923 = HEAP32[$$0$i$i$i >> 2] | 0; //@line 5778
     if ($923 >>> 0 <= $635 >>> 0) {
      $927 = $923 + (HEAP32[$$0$i$i$i + 4 >> 2] | 0) | 0; //@line 5783
      if ($927 >>> 0 > $635 >>> 0) {
       break;
      }
     }
     $$0$i$i$i = HEAP32[$$0$i$i$i + 8 >> 2] | 0; //@line 5791
    }
    $931 = $927 + -47 | 0; //@line 5793
    $933 = $931 + 8 | 0; //@line 5795
    $939 = $931 + (($933 & 7 | 0) == 0 ? 0 : 0 - $933 & 7) | 0; //@line 5801
    $940 = $635 + 16 | 0; //@line 5802
    $942 = $939 >>> 0 < $940 >>> 0 ? $635 : $939; //@line 5804
    $943 = $942 + 8 | 0; //@line 5805
    $944 = $942 + 24 | 0; //@line 5806
    $945 = $$723947$i + -40 | 0; //@line 5807
    $947 = $$748$i + 8 | 0; //@line 5809
    $952 = ($947 & 7 | 0) == 0 ? 0 : 0 - $947 & 7; //@line 5814
    $953 = $$748$i + $952 | 0; //@line 5815
    $954 = $945 - $952 | 0; //@line 5816
    HEAP32[794] = $953; //@line 5817
    HEAP32[791] = $954; //@line 5818
    HEAP32[$953 + 4 >> 2] = $954 | 1; //@line 5821
    HEAP32[$$748$i + $945 + 4 >> 2] = 40; //@line 5824
    HEAP32[795] = HEAP32[910]; //@line 5826
    $960 = $942 + 4 | 0; //@line 5827
    HEAP32[$960 >> 2] = 27; //@line 5828
    HEAP32[$943 >> 2] = HEAP32[900]; //@line 5829
    HEAP32[$943 + 4 >> 2] = HEAP32[901]; //@line 5829
    HEAP32[$943 + 8 >> 2] = HEAP32[902]; //@line 5829
    HEAP32[$943 + 12 >> 2] = HEAP32[903]; //@line 5829
    HEAP32[900] = $$748$i; //@line 5830
    HEAP32[901] = $$723947$i; //@line 5831
    HEAP32[903] = 0; //@line 5832
    HEAP32[902] = $943; //@line 5833
    $962 = $944; //@line 5834
    do {
     $962$looptemp = $962;
     $962 = $962 + 4 | 0; //@line 5836
     HEAP32[$962 >> 2] = 7; //@line 5837
    } while (($962$looptemp + 8 | 0) >>> 0 < $927 >>> 0);
    if (($942 | 0) != ($635 | 0)) {
     $968 = $942 - $635 | 0; //@line 5850
     HEAP32[$960 >> 2] = HEAP32[$960 >> 2] & -2; //@line 5853
     HEAP32[$635 + 4 >> 2] = $968 | 1; //@line 5856
     HEAP32[$942 >> 2] = $968; //@line 5857
     $973 = $968 >>> 3; //@line 5858
     if ($968 >>> 0 < 256) {
      $976 = 3192 + ($973 << 1 << 2) | 0; //@line 5862
      $977 = HEAP32[788] | 0; //@line 5863
      $978 = 1 << $973; //@line 5864
      if (!($977 & $978)) {
       HEAP32[788] = $977 | $978; //@line 5869
       $$0211$i$i = $976; //@line 5871
       $$pre$phi$i$iZ2D = $976 + 8 | 0; //@line 5871
      } else {
       $982 = $976 + 8 | 0; //@line 5873
       $983 = HEAP32[$982 >> 2] | 0; //@line 5874
       if ((HEAP32[792] | 0) >>> 0 > $983 >>> 0) {
        _abort(); //@line 5878
       } else {
        $$0211$i$i = $983; //@line 5881
        $$pre$phi$i$iZ2D = $982; //@line 5881
       }
      }
      HEAP32[$$pre$phi$i$iZ2D >> 2] = $635; //@line 5884
      HEAP32[$$0211$i$i + 12 >> 2] = $635; //@line 5886
      HEAP32[$635 + 8 >> 2] = $$0211$i$i; //@line 5888
      HEAP32[$635 + 12 >> 2] = $976; //@line 5890
      break;
     }
     $989 = $968 >>> 8; //@line 5893
     if (!$989) {
      $$0212$i$i = 0; //@line 5896
     } else {
      if ($968 >>> 0 > 16777215) {
       $$0212$i$i = 31; //@line 5900
      } else {
       $994 = ($989 + 1048320 | 0) >>> 16 & 8; //@line 5904
       $995 = $989 << $994; //@line 5905
       $998 = ($995 + 520192 | 0) >>> 16 & 4; //@line 5908
       $1000 = $995 << $998; //@line 5910
       $1003 = ($1000 + 245760 | 0) >>> 16 & 2; //@line 5913
       $1008 = 14 - ($998 | $994 | $1003) + ($1000 << $1003 >>> 15) | 0; //@line 5918
       $$0212$i$i = $968 >>> ($1008 + 7 | 0) & 1 | $1008 << 1; //@line 5924
      }
     }
     $1014 = 3456 + ($$0212$i$i << 2) | 0; //@line 5927
     HEAP32[$635 + 28 >> 2] = $$0212$i$i; //@line 5929
     HEAP32[$635 + 20 >> 2] = 0; //@line 5931
     HEAP32[$940 >> 2] = 0; //@line 5932
     $1017 = HEAP32[789] | 0; //@line 5933
     $1018 = 1 << $$0212$i$i; //@line 5934
     if (!($1017 & $1018)) {
      HEAP32[789] = $1017 | $1018; //@line 5939
      HEAP32[$1014 >> 2] = $635; //@line 5940
      HEAP32[$635 + 24 >> 2] = $1014; //@line 5942
      HEAP32[$635 + 12 >> 2] = $635; //@line 5944
      HEAP32[$635 + 8 >> 2] = $635; //@line 5946
      break;
     }
     $1025 = HEAP32[$1014 >> 2] | 0; //@line 5949
     L451 : do {
      if ((HEAP32[$1025 + 4 >> 2] & -8 | 0) == ($968 | 0)) {
       $$0207$lcssa$i$i = $1025; //@line 5956
      } else {
       $$02065$i$i = $968 << (($$0212$i$i | 0) == 31 ? 0 : 25 - ($$0212$i$i >>> 1) | 0); //@line 5963
       $$02074$i$i = $1025; //@line 5963
       while (1) {
        $1042 = $$02074$i$i + 16 + ($$02065$i$i >>> 31 << 2) | 0; //@line 5966
        $1037 = HEAP32[$1042 >> 2] | 0; //@line 5967
        if (!$1037) {
         break;
        }
        if ((HEAP32[$1037 + 4 >> 2] & -8 | 0) == ($968 | 0)) {
         $$0207$lcssa$i$i = $1037; //@line 5978
         break L451;
        } else {
         $$02065$i$i = $$02065$i$i << 1; //@line 5981
         $$02074$i$i = $1037; //@line 5981
        }
       }
       if ((HEAP32[792] | 0) >>> 0 > $1042 >>> 0) {
        _abort(); //@line 5987
       } else {
        HEAP32[$1042 >> 2] = $635; //@line 5990
        HEAP32[$635 + 24 >> 2] = $$02074$i$i; //@line 5992
        HEAP32[$635 + 12 >> 2] = $635; //@line 5994
        HEAP32[$635 + 8 >> 2] = $635; //@line 5996
        break L294;
       }
      }
     } while (0);
     $1049 = $$0207$lcssa$i$i + 8 | 0; //@line 6001
     $1050 = HEAP32[$1049 >> 2] | 0; //@line 6002
     $1051 = HEAP32[792] | 0; //@line 6003
     if ($1051 >>> 0 <= $1050 >>> 0 & $1051 >>> 0 <= $$0207$lcssa$i$i >>> 0) {
      HEAP32[$1050 + 12 >> 2] = $635; //@line 6009
      HEAP32[$1049 >> 2] = $635; //@line 6010
      HEAP32[$635 + 8 >> 2] = $1050; //@line 6012
      HEAP32[$635 + 12 >> 2] = $$0207$lcssa$i$i; //@line 6014
      HEAP32[$635 + 24 >> 2] = 0; //@line 6016
      break;
     } else {
      _abort(); //@line 6019
     }
    }
   }
  } while (0);
  $1060 = HEAP32[791] | 0; //@line 6025
  if ($1060 >>> 0 > $$0197 >>> 0) {
   $1062 = $1060 - $$0197 | 0; //@line 6028
   HEAP32[791] = $1062; //@line 6029
   $1063 = HEAP32[794] | 0; //@line 6030
   $1064 = $1063 + $$0197 | 0; //@line 6031
   HEAP32[794] = $1064; //@line 6032
   HEAP32[$1064 + 4 >> 2] = $1062 | 1; //@line 6035
   HEAP32[$1063 + 4 >> 2] = $$0197 | 3; //@line 6038
   $$0 = $1063 + 8 | 0; //@line 6040
   STACKTOP = sp; //@line 6041
   return $$0 | 0; //@line 6041
  }
 }
 $1070 = ___errno_location() | 0; //@line 6044
 HEAP32[$1070 >> 2] = 12; //@line 6045
 $$0 = 0; //@line 6046
 STACKTOP = sp; //@line 6047
 return $$0 | 0; //@line 6047
}
function _fmt_fp($0, $1, $2, $3, $4, $5) {
 $0 = $0 | 0;
 $1 = +$1;
 $2 = $2 | 0;
 $3 = $3 | 0;
 $4 = $4 | 0;
 $5 = $5 | 0;
 var $$0 = 0, $$0463$lcssa = 0, $$0463588 = 0, $$0464599 = 0, $$0471 = 0.0, $$0479 = 0, $$0487657 = 0, $$0488669 = 0, $$0488671 = 0, $$0497670 = 0, $$0498 = 0, $$0511586 = 0.0, $$0513 = 0, $$0516652 = 0, $$0522 = 0, $$0523 = 0, $$0525 = 0, $$0527 = 0, $$0529$in646 = 0, $$0532651 = 0, $$1465 = 0, $$1467 = 0.0, $$1469 = 0.0, $$1472 = 0.0, $$1480 = 0, $$1482$lcssa = 0, $$1482683 = 0, $$1489656 = 0, $$1499 = 0, $$1510587 = 0, $$1514$lcssa = 0, $$1514614 = 0, $$1517 = 0, $$1526 = 0, $$1530621 = 0, $$1533$lcssa = 0, $$1533645 = 0, $$1604 = 0, $$2 = 0, $$2473 = 0.0, $$2476 = 0, $$2483 = 0, $$2490$lcssa = 0, $$2490638 = 0, $$2500$lcssa = 0, $$2500682 = 0, $$2515 = 0, $$2518634 = 0, $$2531 = 0, $$2534633 = 0, $$3 = 0.0, $$3477 = 0, $$3484$lcssa = 0, $$3484663 = 0, $$3501$lcssa = 0, $$3501676 = 0, $$3535620 = 0, $$4 = 0.0, $$4478$lcssa = 0, $$4478594 = 0, $$4492 = 0, $$4502$lcssa = 0, $$4502662 = 0, $$4520 = 0, $$5$lcssa = 0, $$5486$lcssa = 0, $$5486639 = 0, $$5493603 = 0, $$5503 = 0, $$5521 = 0, $$5609 = 0, $$6 = 0, $$6494593 = 0, $$7495608 = 0, $$8 = 0, $$8506 = 0, $$9 = 0, $$9507$lcssa = 0, $$9507625 = 0, $$lcssa583 = 0, $$pn = 0, $$pr = 0, $$pr564 = 0, $$pre$phi717Z2D = 0, $$pre$phi718Z2D = 0, $$pre720 = 0, $$sink757 = 0, $10 = 0, $103 = 0, $104 = 0, $108 = 0, $109 = 0, $11 = 0, $113 = 0, $115 = 0, $116 = 0, $12 = 0, $123 = 0, $126 = 0, $13 = 0, $132 = 0, $135 = 0, $136 = 0, $139 = 0, $141 = 0, $142 = 0, $145 = 0, $147 = 0, $15 = 0.0, $151 = 0, $154 = 0, $158 = 0, $16 = 0, $163 = 0, $164 = 0, $165 = 0, $166 = 0, $168 = 0, $174 = 0, $175 = 0, $176 = 0, $188 = 0, $202 = 0, $203 = 0, $206 = 0, $211 = 0, $212 = 0, $214 = 0, $222 = 0, $223 = 0, $225 = 0, $227 = 0, $229 = 0, $231 = 0, $232 = 0, $234 = 0, $237 = 0, $240 = 0, $245 = 0, $248 = 0, $25 = 0, $251 = 0, $253 = 0, $255 = 0, $257 = 0, $262 = 0, $263 = 0, $266 = 0, $268 = 0, $270 = 0, $273 = 0, $286 = 0, $291 = 0, $30 = 0, $300 = 0, $301 = 0, $305 = 0, $308 = 0, $310 = 0, $312 = 0, $316 = 0, $319 = 0, $320 = 0, $324 = 0, $334 = 0, $339 = 0, $34 = 0, $342 = 0, $343 = 0, $344 = 0, $346 = 0, $351 = 0, $364 = 0, $368 = 0, $373 = 0, $38 = 0.0, $382 = 0, $384 = 0, $385 = 0, $386 = 0, $387 = 0, $389 = 0, $39 = 0, $393 = 0, $395 = 0, $398 = 0, $401 = 0, $412 = 0, $42 = 0, $44 = 0, $47 = 0, $49 = 0, $6 = 0, $63 = 0, $66 = 0, $69 = 0, $7 = 0, $71 = 0, $79 = 0, $8 = 0, $80 = 0, $82 = 0, $83 = 0, $89 = 0, $9 = 0, $spec$select = 0, $spec$select539 = 0, $spec$select540 = 0, $spec$select540723 = 0, $spec$select541 = 0, $spec$select544 = 0.0, $spec$select548 = 0, $spec$select549 = 0, $spec$select551 = 0, $spec$select554 = 0, $spec$select557 = 0, $spec$select567 = 0.0, label = 0, sp = 0;
 sp = STACKTOP; //@line 2518
 STACKTOP = STACKTOP + 560 | 0; //@line 2519
 $6 = sp + 32 | 0; //@line 2520
 $7 = sp + 536 | 0; //@line 2521
 $8 = sp; //@line 2522
 $9 = $8; //@line 2523
 $10 = sp + 540 | 0; //@line 2524
 HEAP32[$7 >> 2] = 0; //@line 2525
 $11 = $10 + 12 | 0; //@line 2526
 $12 = ___DOUBLE_BITS_662($1) | 0; //@line 2527
 $13 = getTempRet0() | 0; //@line 2528
 if (($13 | 0) < 0) {
  $15 = -$1; //@line 2531
  $16 = ___DOUBLE_BITS_662($15) | 0; //@line 2532
  $$0471 = $15; //@line 2534
  $$0522 = 1; //@line 2534
  $$0523 = 1944; //@line 2534
  $25 = getTempRet0() | 0; //@line 2534
  $412 = $16; //@line 2534
 } else {
  $$0471 = $1; //@line 2545
  $$0522 = ($4 & 2049 | 0) != 0 & 1; //@line 2545
  $$0523 = ($4 & 2048 | 0) == 0 ? ($4 & 1 | 0) == 0 ? 1945 : 1950 : 1947; //@line 2545
  $25 = $13; //@line 2545
  $412 = $12; //@line 2545
 }
 do {
  if (0 == 0 & ($25 & 2146435072 | 0) == 2146435072) {
   $30 = ($5 & 32 | 0) != 0; //@line 2554
   $34 = $$0522 + 3 | 0; //@line 2559
   _pad_661($0, 32, $2, $34, $4 & -65537); //@line 2561
   _out_655($0, $$0523, $$0522); //@line 2562
   _out_655($0, $$0471 != $$0471 | 0.0 != 0.0 ? $30 ? 1971 : 1975 : $30 ? 1963 : 1967, 3); //@line 2563
   _pad_661($0, 32, $2, $34, $4 ^ 8192); //@line 2565
   $$sink757 = $34; //@line 2566
  } else {
   $38 = +_frexpl($$0471, $7) * 2.0; //@line 2569
   $39 = $38 != 0.0; //@line 2570
   if ($39) {
    HEAP32[$7 >> 2] = (HEAP32[$7 >> 2] | 0) + -1; //@line 2574
   }
   $42 = $5 | 32; //@line 2576
   if (($42 | 0) == 97) {
    $44 = $5 & 32; //@line 2579
    $spec$select = ($44 | 0) == 0 ? $$0523 : $$0523 + 9 | 0; //@line 2582
    $47 = $$0522 | 2; //@line 2583
    $49 = 12 - $3 | 0; //@line 2585
    do {
     if ($3 >>> 0 > 11 | ($49 | 0) == 0) {
      $$1472 = $38; //@line 2590
     } else {
      $$0511586 = 8.0; //@line 2592
      $$1510587 = $49; //@line 2592
      do {
       $$1510587 = $$1510587 + -1 | 0; //@line 2594
       $$0511586 = $$0511586 * 16.0; //@line 2595
      } while (($$1510587 | 0) != 0);
      if ((HEAP8[$spec$select >> 0] | 0) == 45) {
       $$1472 = -($$0511586 + (-$38 - $$0511586)); //@line 2610
       break;
      } else {
       $$1472 = $38 + $$0511586 - $$0511586; //@line 2615
       break;
      }
     }
    } while (0);
    $63 = HEAP32[$7 >> 2] | 0; //@line 2620
    $66 = ($63 | 0) < 0 ? 0 - $63 | 0 : $63; //@line 2623
    $69 = _fmt_u($66, (($66 | 0) < 0) << 31 >> 31, $11) | 0; //@line 2626
    if (($69 | 0) == ($11 | 0)) {
     $71 = $10 + 11 | 0; //@line 2629
     HEAP8[$71 >> 0] = 48; //@line 2630
     $$0513 = $71; //@line 2631
    } else {
     $$0513 = $69; //@line 2633
    }
    HEAP8[$$0513 + -1 >> 0] = ($63 >> 31 & 2) + 43; //@line 2640
    $79 = $$0513 + -2 | 0; //@line 2643
    HEAP8[$79 >> 0] = $5 + 15; //@line 2644
    $80 = ($3 | 0) < 1; //@line 2645
    $82 = ($4 & 8 | 0) == 0; //@line 2647
    $$0525 = $8; //@line 2648
    $$2473 = $$1472; //@line 2648
    while (1) {
     $83 = ~~$$2473; //@line 2650
     $89 = $$0525 + 1 | 0; //@line 2656
     HEAP8[$$0525 >> 0] = $44 | HEAPU8[576 + $83 >> 0]; //@line 2657
     $$2473 = ($$2473 - +($83 | 0)) * 16.0; //@line 2660
     if (($89 - $9 | 0) == 1) {
      if ($82 & ($80 & $$2473 == 0.0)) {
       $$1526 = $89; //@line 2669
      } else {
       HEAP8[$89 >> 0] = 46; //@line 2672
       $$1526 = $$0525 + 2 | 0; //@line 2673
      }
     } else {
      $$1526 = $89; //@line 2676
     }
     if (!($$2473 != 0.0)) {
      break;
     } else {
      $$0525 = $$1526; //@line 2680
     }
    }
    $$pre720 = $$1526; //@line 2686
    if (!$3) {
     label = 25; //@line 2688
    } else {
     if ((-2 - $9 + $$pre720 | 0) < ($3 | 0)) {
      $103 = $11; //@line 2694
      $104 = $79; //@line 2695
      $$0527 = $3 + 2 + $103 - $104 | 0; //@line 2699
      $$pre$phi717Z2D = $103; //@line 2699
      $$pre$phi718Z2D = $104; //@line 2699
     } else {
      label = 25; //@line 2701
     }
    }
    if ((label | 0) == 25) {
     $108 = $11; //@line 2705
     $109 = $79; //@line 2706
     $$0527 = $108 - $9 - $109 + $$pre720 | 0; //@line 2710
     $$pre$phi717Z2D = $108; //@line 2710
     $$pre$phi718Z2D = $109; //@line 2710
    }
    $113 = $$0527 + $47 | 0; //@line 2712
    _pad_661($0, 32, $2, $113, $4); //@line 2713
    _out_655($0, $spec$select, $47); //@line 2714
    _pad_661($0, 48, $2, $113, $4 ^ 65536); //@line 2716
    $115 = $$pre720 - $9 | 0; //@line 2717
    _out_655($0, $8, $115); //@line 2718
    $116 = $$pre$phi717Z2D - $$pre$phi718Z2D | 0; //@line 2719
    _pad_661($0, 48, $$0527 - ($115 + $116) | 0, 0, 0); //@line 2722
    _out_655($0, $79, $116); //@line 2723
    _pad_661($0, 32, $2, $113, $4 ^ 8192); //@line 2725
    $$sink757 = $113; //@line 2726
    break;
   }
   $spec$select539 = ($3 | 0) < 0 ? 6 : $3; //@line 2730
   if ($39) {
    $123 = (HEAP32[$7 >> 2] | 0) + -28 | 0; //@line 2734
    HEAP32[$7 >> 2] = $123; //@line 2735
    $$3 = $38 * 268435456.0; //@line 2736
    $$pr = $123; //@line 2736
   } else {
    $$3 = $38; //@line 2739
    $$pr = HEAP32[$7 >> 2] | 0; //@line 2739
   }
   $$0498 = ($$pr | 0) < 0 ? $6 : $6 + 288 | 0; //@line 2743
   $$1499 = $$0498; //@line 2744
   $$4 = $$3; //@line 2744
   do {
    $126 = ~~$$4 >>> 0; //@line 2746
    HEAP32[$$1499 >> 2] = $126; //@line 2747
    $$1499 = $$1499 + 4 | 0; //@line 2748
    $$4 = ($$4 - +($126 >>> 0)) * 1.0e9; //@line 2751
   } while ($$4 != 0.0);
   $132 = $$0498; //@line 2759
   if (($$pr | 0) > 0) {
    $$1482683 = $$0498; //@line 2762
    $$2500682 = $$1499; //@line 2762
    $135 = $$pr; //@line 2762
    while (1) {
     $136 = ($135 | 0) < 29 ? $135 : 29; //@line 2765
     $$0488669 = $$2500682 + -4 | 0; //@line 2766
     if ($$0488669 >>> 0 < $$1482683 >>> 0) {
      $$2483 = $$1482683; //@line 2769
     } else {
      $$0488671 = $$0488669; //@line 2771
      $$0497670 = 0; //@line 2771
      do {
       $139 = _bitshift64Shl(HEAP32[$$0488671 >> 2] | 0, 0, $136 | 0) | 0; //@line 2774
       $141 = _i64Add($139 | 0, getTempRet0() | 0, $$0497670 | 0, 0) | 0; //@line 2776
       $142 = getTempRet0() | 0; //@line 2777
       $$0497670 = ___udivdi3($141 | 0, $142 | 0, 1e9, 0) | 0; //@line 2778
       $145 = ___muldi3($$0497670 | 0, getTempRet0() | 0, 1e9, 0) | 0; //@line 2780
       $147 = _i64Subtract($141 | 0, $142 | 0, $145 | 0, getTempRet0() | 0) | 0; //@line 2782
       getTempRet0() | 0; //@line 2783
       HEAP32[$$0488671 >> 2] = $147; //@line 2784
       $$0488671 = $$0488671 + -4 | 0; //@line 2785
      } while ($$0488671 >>> 0 >= $$1482683 >>> 0);
      if (!$$0497670) {
       $$2483 = $$1482683; //@line 2795
      } else {
       $151 = $$1482683 + -4 | 0; //@line 2797
       HEAP32[$151 >> 2] = $$0497670; //@line 2798
       $$2483 = $151; //@line 2799
      }
     }
     L57 : do {
      if ($$2500682 >>> 0 > $$2483 >>> 0) {
       $$3501676 = $$2500682; //@line 2805
       while (1) {
        $154 = $$3501676 + -4 | 0; //@line 2807
        if (HEAP32[$154 >> 2] | 0) {
         $$3501$lcssa = $$3501676; //@line 2811
         break L57;
        }
        if ($154 >>> 0 > $$2483 >>> 0) {
         $$3501676 = $154; //@line 2816
        } else {
         $$3501$lcssa = $154; //@line 2818
         break;
        }
       }
      } else {
       $$3501$lcssa = $$2500682; //@line 2823
      }
     } while (0);
     $158 = (HEAP32[$7 >> 2] | 0) - $136 | 0; //@line 2827
     HEAP32[$7 >> 2] = $158; //@line 2828
     if (($158 | 0) > 0) {
      $$1482683 = $$2483; //@line 2831
      $$2500682 = $$3501$lcssa; //@line 2831
      $135 = $158; //@line 2831
     } else {
      $$1482$lcssa = $$2483; //@line 2833
      $$2500$lcssa = $$3501$lcssa; //@line 2833
      $$pr564 = $158; //@line 2833
      break;
     }
    }
   } else {
    $$1482$lcssa = $$0498; //@line 2838
    $$2500$lcssa = $$1499; //@line 2838
    $$pr564 = $$pr; //@line 2838
   }
   if (($$pr564 | 0) < 0) {
    $163 = (($spec$select539 + 25 | 0) / 9 | 0) + 1 | 0; //@line 2844
    $164 = ($42 | 0) == 102; //@line 2845
    $$3484663 = $$1482$lcssa; //@line 2846
    $$4502662 = $$2500$lcssa; //@line 2846
    $166 = $$pr564; //@line 2846
    while (1) {
     $165 = 0 - $166 | 0; //@line 2848
     $168 = ($165 | 0) < 9 ? $165 : 9; //@line 2850
     if ($$3484663 >>> 0 < $$4502662 >>> 0) {
      $174 = (1 << $168) + -1 | 0; //@line 2854
      $175 = 1e9 >>> $168; //@line 2855
      $$0487657 = 0; //@line 2856
      $$1489656 = $$3484663; //@line 2856
      do {
       $176 = HEAP32[$$1489656 >> 2] | 0; //@line 2858
       HEAP32[$$1489656 >> 2] = ($176 >>> $168) + $$0487657; //@line 2862
       $$0487657 = Math_imul($176 & $174, $175) | 0; //@line 2863
       $$1489656 = $$1489656 + 4 | 0; //@line 2864
      } while ($$1489656 >>> 0 < $$4502662 >>> 0);
      $spec$select540 = (HEAP32[$$3484663 >> 2] | 0) == 0 ? $$3484663 + 4 | 0 : $$3484663; //@line 2875
      if (!$$0487657) {
       $$5503 = $$4502662; //@line 2878
       $spec$select540723 = $spec$select540; //@line 2878
      } else {
       HEAP32[$$4502662 >> 2] = $$0487657; //@line 2881
       $$5503 = $$4502662 + 4 | 0; //@line 2882
       $spec$select540723 = $spec$select540; //@line 2882
      }
     } else {
      $$5503 = $$4502662; //@line 2889
      $spec$select540723 = (HEAP32[$$3484663 >> 2] | 0) == 0 ? $$3484663 + 4 | 0 : $$3484663; //@line 2889
     }
     $188 = $164 ? $$0498 : $spec$select540723; //@line 2891
     $spec$select541 = ($$5503 - $188 >> 2 | 0) > ($163 | 0) ? $188 + ($163 << 2) | 0 : $$5503; //@line 2898
     $166 = (HEAP32[$7 >> 2] | 0) + $168 | 0; //@line 2900
     HEAP32[$7 >> 2] = $166; //@line 2901
     if (($166 | 0) >= 0) {
      $$3484$lcssa = $spec$select540723; //@line 2906
      $$4502$lcssa = $spec$select541; //@line 2906
      break;
     } else {
      $$3484663 = $spec$select540723; //@line 2904
      $$4502662 = $spec$select541; //@line 2904
     }
    }
   } else {
    $$3484$lcssa = $$1482$lcssa; //@line 2911
    $$4502$lcssa = $$2500$lcssa; //@line 2911
   }
   if ($$3484$lcssa >>> 0 < $$4502$lcssa >>> 0) {
    $202 = ($132 - $$3484$lcssa >> 2) * 9 | 0; //@line 2918
    $203 = HEAP32[$$3484$lcssa >> 2] | 0; //@line 2919
    if ($203 >>> 0 < 10) {
     $$1517 = $202; //@line 2922
    } else {
     $$0516652 = $202; //@line 2924
     $$0532651 = 10; //@line 2924
     while (1) {
      $$0532651 = $$0532651 * 10 | 0; //@line 2926
      $206 = $$0516652 + 1 | 0; //@line 2927
      if ($203 >>> 0 < $$0532651 >>> 0) {
       $$1517 = $206; //@line 2930
       break;
      } else {
       $$0516652 = $206; //@line 2933
      }
     }
    }
   } else {
    $$1517 = 0; //@line 2938
   }
   $211 = ($42 | 0) == 103; //@line 2943
   $212 = ($spec$select539 | 0) != 0; //@line 2944
   $214 = $spec$select539 - (($42 | 0) == 102 ? 0 : $$1517) + (($212 & $211) << 31 >> 31) | 0; //@line 2947
   if (($214 | 0) < ((($$4502$lcssa - $132 >> 2) * 9 | 0) + -9 | 0)) {
    $222 = $214 + 9216 | 0; //@line 2956
    $223 = ($222 | 0) / 9 | 0; //@line 2957
    $225 = $$0498 + 4 + ($223 + -1024 << 2) | 0; //@line 2959
    $227 = $222 - ($223 * 9 | 0) | 0; //@line 2961
    if (($227 | 0) < 8) {
     $$0529$in646 = $227; //@line 2964
     $$1533645 = 10; //@line 2964
     while (1) {
      $229 = $$1533645 * 10 | 0; //@line 2967
      if (($$0529$in646 | 0) < 7) {
       $$0529$in646 = $$0529$in646 + 1 | 0; //@line 2970
       $$1533645 = $229; //@line 2970
      } else {
       $$1533$lcssa = $229; //@line 2972
       break;
      }
     }
    } else {
     $$1533$lcssa = 10; //@line 2977
    }
    $231 = HEAP32[$225 >> 2] | 0; //@line 2979
    $232 = ($231 >>> 0) / ($$1533$lcssa >>> 0) | 0; //@line 2980
    $234 = $231 - (Math_imul($232, $$1533$lcssa) | 0) | 0; //@line 2982
    $237 = ($225 + 4 | 0) == ($$4502$lcssa | 0); //@line 2985
    if ($237 & ($234 | 0) == 0) {
     $$4492 = $225; //@line 2988
     $$4520 = $$1517; //@line 2988
     $$8 = $$3484$lcssa; //@line 2988
    } else {
     $spec$select544 = ($232 & 1 | 0) == 0 ? 9007199254740992.0 : 9007199254740994.0; //@line 2992
     $240 = $$1533$lcssa >>> 1; //@line 2993
     $spec$select567 = $234 >>> 0 < $240 >>> 0 ? .5 : $237 & ($234 | 0) == ($240 | 0) ? 1.0 : 1.5; //@line 2998
     if (!$$0522) {
      $$1467 = $spec$select567; //@line 3001
      $$1469 = $spec$select544; //@line 3001
     } else {
      $245 = (HEAP8[$$0523 >> 0] | 0) == 45; //@line 3004
      $$1467 = $245 ? -$spec$select567 : $spec$select567; //@line 3009
      $$1469 = $245 ? -$spec$select544 : $spec$select544; //@line 3009
     }
     $248 = $231 - $234 | 0; //@line 3011
     HEAP32[$225 >> 2] = $248; //@line 3012
     if ($$1469 + $$1467 != $$1469) {
      $251 = $248 + $$1533$lcssa | 0; //@line 3016
      HEAP32[$225 >> 2] = $251; //@line 3017
      if ($251 >>> 0 > 999999999) {
       $$2490638 = $225; //@line 3020
       $$5486639 = $$3484$lcssa; //@line 3020
       while (1) {
        $253 = $$2490638 + -4 | 0; //@line 3022
        HEAP32[$$2490638 >> 2] = 0; //@line 3023
        if ($253 >>> 0 < $$5486639 >>> 0) {
         $255 = $$5486639 + -4 | 0; //@line 3026
         HEAP32[$255 >> 2] = 0; //@line 3027
         $$6 = $255; //@line 3028
        } else {
         $$6 = $$5486639; //@line 3030
        }
        $257 = (HEAP32[$253 >> 2] | 0) + 1 | 0; //@line 3033
        HEAP32[$253 >> 2] = $257; //@line 3034
        if ($257 >>> 0 > 999999999) {
         $$2490638 = $253; //@line 3037
         $$5486639 = $$6; //@line 3037
        } else {
         $$2490$lcssa = $253; //@line 3039
         $$5486$lcssa = $$6; //@line 3039
         break;
        }
       }
      } else {
       $$2490$lcssa = $225; //@line 3044
       $$5486$lcssa = $$3484$lcssa; //@line 3044
      }
      $262 = ($132 - $$5486$lcssa >> 2) * 9 | 0; //@line 3049
      $263 = HEAP32[$$5486$lcssa >> 2] | 0; //@line 3050
      if ($263 >>> 0 < 10) {
       $$4492 = $$2490$lcssa; //@line 3053
       $$4520 = $262; //@line 3053
       $$8 = $$5486$lcssa; //@line 3053
      } else {
       $$2518634 = $262; //@line 3055
       $$2534633 = 10; //@line 3055
       while (1) {
        $$2534633 = $$2534633 * 10 | 0; //@line 3057
        $266 = $$2518634 + 1 | 0; //@line 3058
        if ($263 >>> 0 < $$2534633 >>> 0) {
         $$4492 = $$2490$lcssa; //@line 3061
         $$4520 = $266; //@line 3061
         $$8 = $$5486$lcssa; //@line 3061
         break;
        } else {
         $$2518634 = $266; //@line 3064
        }
       }
      }
     } else {
      $$4492 = $225; //@line 3069
      $$4520 = $$1517; //@line 3069
      $$8 = $$3484$lcssa; //@line 3069
     }
    }
    $268 = $$4492 + 4 | 0; //@line 3072
    $$5521 = $$4520; //@line 3075
    $$8506 = $$4502$lcssa >>> 0 > $268 >>> 0 ? $268 : $$4502$lcssa; //@line 3075
    $$9 = $$8; //@line 3075
   } else {
    $$5521 = $$1517; //@line 3077
    $$8506 = $$4502$lcssa; //@line 3077
    $$9 = $$3484$lcssa; //@line 3077
   }
   $270 = 0 - $$5521 | 0; //@line 3079
   L109 : do {
    if ($$8506 >>> 0 > $$9 >>> 0) {
     $$9507625 = $$8506; //@line 3083
     while (1) {
      $273 = $$9507625 + -4 | 0; //@line 3085
      if (HEAP32[$273 >> 2] | 0) {
       $$9507$lcssa = $$9507625; //@line 3089
       $$lcssa583 = 1; //@line 3089
       break L109;
      }
      if ($273 >>> 0 > $$9 >>> 0) {
       $$9507625 = $273; //@line 3094
      } else {
       $$9507$lcssa = $273; //@line 3096
       $$lcssa583 = 0; //@line 3096
       break;
      }
     }
    } else {
     $$9507$lcssa = $$8506; //@line 3101
     $$lcssa583 = 0; //@line 3101
    }
   } while (0);
   do {
    if ($211) {
     $spec$select548 = $spec$select539 + (($212 ^ 1) & 1) | 0; //@line 3108
     if (($spec$select548 | 0) > ($$5521 | 0) & ($$5521 | 0) > -5) {
      $$0479 = $5 + -1 | 0; //@line 3116
      $$2476 = $spec$select548 + -1 - $$5521 | 0; //@line 3116
     } else {
      $$0479 = $5 + -2 | 0; //@line 3120
      $$2476 = $spec$select548 + -1 | 0; //@line 3120
     }
     if (!($4 & 8)) {
      if ($$lcssa583) {
       $286 = HEAP32[$$9507$lcssa + -4 >> 2] | 0; //@line 3127
       if (!$286) {
        $$2531 = 9; //@line 3130
       } else {
        if (!(($286 >>> 0) % 10 | 0)) {
         $$1530621 = 0; //@line 3135
         $$3535620 = 10; //@line 3135
         while (1) {
          $$3535620 = $$3535620 * 10 | 0; //@line 3137
          $291 = $$1530621 + 1 | 0; //@line 3138
          if (($286 >>> 0) % ($$3535620 >>> 0) | 0 | 0) {
           $$2531 = $291; //@line 3144
           break;
          } else {
           $$1530621 = $291; //@line 3142
          }
         }
        } else {
         $$2531 = 0; //@line 3149
        }
       }
      } else {
       $$2531 = 9; //@line 3153
      }
      $300 = (($$9507$lcssa - $132 >> 2) * 9 | 0) + -9 | 0; //@line 3161
      if (($$0479 | 32 | 0) == 102) {
       $301 = $300 - $$2531 | 0; //@line 3163
       $spec$select549 = ($301 | 0) > 0 ? $301 : 0; //@line 3165
       $$1480 = $$0479; //@line 3168
       $$3477 = ($$2476 | 0) < ($spec$select549 | 0) ? $$2476 : $spec$select549; //@line 3168
       break;
      } else {
       $305 = $300 + $$5521 - $$2531 | 0; //@line 3172
       $spec$select551 = ($305 | 0) > 0 ? $305 : 0; //@line 3174
       $$1480 = $$0479; //@line 3177
       $$3477 = ($$2476 | 0) < ($spec$select551 | 0) ? $$2476 : $spec$select551; //@line 3177
       break;
      }
     } else {
      $$1480 = $$0479; //@line 3181
      $$3477 = $$2476; //@line 3181
     }
    } else {
     $$1480 = $5; //@line 3184
     $$3477 = $spec$select539; //@line 3184
    }
   } while (0);
   $308 = ($$3477 | 0) != 0; //@line 3187
   $310 = $308 ? 1 : $4 >>> 3 & 1; //@line 3190
   $312 = ($$1480 | 32 | 0) == 102; //@line 3192
   if ($312) {
    $$2515 = 0; //@line 3196
    $$pn = ($$5521 | 0) > 0 ? $$5521 : 0; //@line 3196
   } else {
    $316 = ($$5521 | 0) < 0 ? $270 : $$5521; //@line 3199
    $319 = _fmt_u($316, (($316 | 0) < 0) << 31 >> 31, $11) | 0; //@line 3202
    $320 = $11; //@line 3203
    if (($320 - $319 | 0) < 2) {
     $$1514614 = $319; //@line 3208
     while (1) {
      $324 = $$1514614 + -1 | 0; //@line 3210
      HEAP8[$324 >> 0] = 48; //@line 3211
      if (($320 - $324 | 0) < 2) {
       $$1514614 = $324; //@line 3216
      } else {
       $$1514$lcssa = $324; //@line 3218
       break;
      }
     }
    } else {
     $$1514$lcssa = $319; //@line 3223
    }
    HEAP8[$$1514$lcssa + -1 >> 0] = ($$5521 >> 31 & 2) + 43; //@line 3230
    $334 = $$1514$lcssa + -2 | 0; //@line 3232
    HEAP8[$334 >> 0] = $$1480; //@line 3233
    $$2515 = $334; //@line 3236
    $$pn = $320 - $334 | 0; //@line 3236
   }
   $339 = $$0522 + 1 + $$3477 + $310 + $$pn | 0; //@line 3241
   _pad_661($0, 32, $2, $339, $4); //@line 3242
   _out_655($0, $$0523, $$0522); //@line 3243
   _pad_661($0, 48, $2, $339, $4 ^ 65536); //@line 3245
   if ($312) {
    $spec$select554 = $$9 >>> 0 > $$0498 >>> 0 ? $$0498 : $$9; //@line 3248
    $342 = $8 + 9 | 0; //@line 3249
    $343 = $342; //@line 3250
    $344 = $8 + 8 | 0; //@line 3251
    $$5493603 = $spec$select554; //@line 3252
    do {
     $346 = _fmt_u(HEAP32[$$5493603 >> 2] | 0, 0, $342) | 0; //@line 3255
     if (($$5493603 | 0) == ($spec$select554 | 0)) {
      if (($346 | 0) == ($342 | 0)) {
       HEAP8[$344 >> 0] = 48; //@line 3260
       $$1465 = $344; //@line 3261
      } else {
       $$1465 = $346; //@line 3263
      }
     } else {
      if ($346 >>> 0 > $8 >>> 0) {
       _memset($8 | 0, 48, $346 - $9 | 0) | 0; //@line 3270
       $$0464599 = $346; //@line 3271
       while (1) {
        $351 = $$0464599 + -1 | 0; //@line 3273
        if ($351 >>> 0 > $8 >>> 0) {
         $$0464599 = $351; //@line 3276
        } else {
         $$1465 = $351; //@line 3278
         break;
        }
       }
      } else {
       $$1465 = $346; //@line 3283
      }
     }
     _out_655($0, $$1465, $343 - $$1465 | 0); //@line 3288
     $$5493603 = $$5493603 + 4 | 0; //@line 3289
    } while ($$5493603 >>> 0 <= $$0498 >>> 0);
    if (!(($4 & 8 | 0) == 0 & ($308 ^ 1))) {
     _out_655($0, 1979, 1); //@line 3302
    }
    if ($$5493603 >>> 0 < $$9507$lcssa >>> 0 & ($$3477 | 0) > 0) {
     $$4478594 = $$3477; //@line 3308
     $$6494593 = $$5493603; //@line 3308
     while (1) {
      $364 = _fmt_u(HEAP32[$$6494593 >> 2] | 0, 0, $342) | 0; //@line 3311
      if ($364 >>> 0 > $8 >>> 0) {
       _memset($8 | 0, 48, $364 - $9 | 0) | 0; //@line 3316
       $$0463588 = $364; //@line 3317
       while (1) {
        $368 = $$0463588 + -1 | 0; //@line 3319
        if ($368 >>> 0 > $8 >>> 0) {
         $$0463588 = $368; //@line 3322
        } else {
         $$0463$lcssa = $368; //@line 3324
         break;
        }
       }
      } else {
       $$0463$lcssa = $364; //@line 3329
      }
      _out_655($0, $$0463$lcssa, ($$4478594 | 0) < 9 ? $$4478594 : 9); //@line 3333
      $$6494593 = $$6494593 + 4 | 0; //@line 3334
      $373 = $$4478594 + -9 | 0; //@line 3335
      if (!($$6494593 >>> 0 < $$9507$lcssa >>> 0 & ($$4478594 | 0) > 9)) {
       $$4478$lcssa = $373; //@line 3342
       break;
      } else {
       $$4478594 = $373; //@line 3340
      }
     }
    } else {
     $$4478$lcssa = $$3477; //@line 3347
    }
    _pad_661($0, 48, $$4478$lcssa + 9 | 0, 9, 0); //@line 3350
   } else {
    $spec$select557 = $$lcssa583 ? $$9507$lcssa : $$9 + 4 | 0; //@line 3353
    if ($$9 >>> 0 < $spec$select557 >>> 0 & ($$3477 | 0) > -1) {
     $382 = $8 + 9 | 0; //@line 3358
     $384 = ($4 & 8 | 0) == 0; //@line 3360
     $385 = $382; //@line 3361
     $386 = 0 - $9 | 0; //@line 3362
     $387 = $8 + 8 | 0; //@line 3363
     $$5609 = $$3477; //@line 3364
     $$7495608 = $$9; //@line 3364
     while (1) {
      $389 = _fmt_u(HEAP32[$$7495608 >> 2] | 0, 0, $382) | 0; //@line 3367
      if (($389 | 0) == ($382 | 0)) {
       HEAP8[$387 >> 0] = 48; //@line 3370
       $$0 = $387; //@line 3371
      } else {
       $$0 = $389; //@line 3373
      }
      do {
       if (($$7495608 | 0) == ($$9 | 0)) {
        $395 = $$0 + 1 | 0; //@line 3378
        _out_655($0, $$0, 1); //@line 3379
        if ($384 & ($$5609 | 0) < 1) {
         $$2 = $395; //@line 3383
         break;
        }
        _out_655($0, 1979, 1); //@line 3386
        $$2 = $395; //@line 3387
       } else {
        if ($$0 >>> 0 <= $8 >>> 0) {
         $$2 = $$0; //@line 3391
         break;
        }
        _memset($8 | 0, 48, $$0 + $386 | 0) | 0; //@line 3396
        $$1604 = $$0; //@line 3397
        while (1) {
         $393 = $$1604 + -1 | 0; //@line 3399
         if ($393 >>> 0 > $8 >>> 0) {
          $$1604 = $393; //@line 3402
         } else {
          $$2 = $393; //@line 3404
          break;
         }
        }
       }
      } while (0);
      $398 = $385 - $$2 | 0; //@line 3411
      _out_655($0, $$2, ($$5609 | 0) > ($398 | 0) ? $398 : $$5609); //@line 3414
      $401 = $$5609 - $398 | 0; //@line 3415
      $$7495608 = $$7495608 + 4 | 0; //@line 3416
      if (!($$7495608 >>> 0 < $spec$select557 >>> 0 & ($401 | 0) > -1)) {
       $$5$lcssa = $401; //@line 3423
       break;
      } else {
       $$5609 = $401; //@line 3421
      }
     }
    } else {
     $$5$lcssa = $$3477; //@line 3428
    }
    _pad_661($0, 48, $$5$lcssa + 18 | 0, 18, 0); //@line 3431
    _out_655($0, $$2515, $11 - $$2515 | 0); //@line 3435
   }
   _pad_661($0, 32, $2, $339, $4 ^ 8192); //@line 3438
   $$sink757 = $339; //@line 3439
  }
 } while (0);
 STACKTOP = sp; //@line 3444
 return (($$sink757 | 0) < ($2 | 0) ? $2 : $$sink757) | 0; //@line 3444
}
function _printf_core($0, $1, $2, $3, $4) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 $3 = $3 | 0;
 $4 = $4 | 0;
 var $$0 = 0, $$0228 = 0, $$0229333 = 0, $$0231 = 0, $$0234 = 0, $$0236 = 0, $$0239312 = 0, $$0239312370 = 0, $$0239332 = 0, $$0242 = 0, $$0242$ph = 0, $$0242$ph$be = 0, $$0246 = 0, $$0246$ph = 0, $$0248$lcssa = 0, $$0248320 = 0, $$0251 = 0, $$0252 = 0, $$0253 = 0, $$0258 = 0, $$0261$lcssa = 0, $$0261327 = 0, $$0268$ph = 0, $$1 = 0, $$1230339 = 0, $$1232 = 0, $$1235 = 0, $$1237 = 0, $$1240338 = 0, $$1247 = 0, $$1254 = 0, $$1259 = 0, $$1262 = 0, $$1269 = 0, $$2233 = 0, $$2238 = 0, $$2241319 = 0, $$2255 = 0, $$2260 = 0, $$2270 = 0, $$3264 = 0, $$3271 = 0, $$3316 = 0, $$4257369 = 0, $$4265 = 0, $$5 = 0, $$6267 = 0, $$lcssa307 = 0, $$pre$phiZ2D = 0, $$pre359 = 0, $$pre362 = 0, $$sink = 0, $10 = 0, $102 = 0, $103 = 0, $106 = 0, $109 = 0, $11 = 0, $112 = 0, $114 = 0, $12 = 0, $122 = 0, $126 = 0, $13 = 0, $137 = 0, $14 = 0, $141 = 0, $148 = 0, $149 = 0, $151 = 0, $152 = 0, $154 = 0, $163 = 0, $164 = 0, $169 = 0, $172 = 0, $177 = 0, $178 = 0, $18 = 0, $183 = 0, $185 = 0, $192 = 0, $193 = 0, $20 = 0, $204 = 0, $21 = 0, $216 = 0, $223 = 0, $225 = 0, $228 = 0, $23 = 0, $230 = 0, $238 = 0, $24 = 0, $240 = 0, $243 = 0, $244 = 0, $248 = 0, $25 = 0, $252 = 0, $254 = 0, $257 = 0, $259 = 0, $260 = 0, $261 = 0, $27 = 0, $271 = 0, $272 = 0, $277 = 0, $279 = 0, $280 = 0, $286 = 0, $295 = 0, $297 = 0, $298 = 0, $299 = 0, $30 = 0, $312 = 0, $314 = 0, $315 = 0, $319 = 0, $323 = 0, $325 = 0, $336 = 0, $338 = 0, $345 = 0, $348 = 0, $355 = 0, $356 = 0, $43 = 0, $5 = 0, $51 = 0, $52 = 0, $54 = 0, $6 = 0, $60 = 0, $61 = 0, $62 = 0, $63 = 0, $7 = 0, $76 = 0, $8 = 0, $80 = 0, $9 = 0, $or$cond = 0, $or$cond277 = 0, $spec$select = 0, $spec$select283 = 0, $storemerge272$lcssa = 0, $storemerge272326 = 0, $storemerge273 = 0, label = 0, sp = 0, $154$looptemp = 0;
 sp = STACKTOP; //@line 1104
 STACKTOP = STACKTOP + 64 | 0; //@line 1105
 $5 = sp + 56 | 0; //@line 1106
 $6 = sp + 40 | 0; //@line 1107
 $7 = sp; //@line 1108
 $8 = sp + 48 | 0; //@line 1109
 $9 = sp + 60 | 0; //@line 1110
 HEAP32[$5 >> 2] = $1; //@line 1111
 $10 = ($0 | 0) != 0; //@line 1112
 $11 = $7 + 40 | 0; //@line 1113
 $12 = $11; //@line 1114
 $13 = $7 + 39 | 0; //@line 1115
 $14 = $8 + 4 | 0; //@line 1116
 $$0242$ph = 0; //@line 1117
 $$0246$ph = 0; //@line 1117
 $$0268$ph = 0; //@line 1117
 L1 : while (1) {
  $$0242 = $$0242$ph; //@line 1119
  $$0246 = $$0246$ph; //@line 1119
  while (1) {
   do {
    if (($$0246 | 0) > -1) {
     if (($$0242 | 0) > (2147483647 - $$0246 | 0)) {
      $18 = ___errno_location() | 0; //@line 1127
      HEAP32[$18 >> 2] = 75; //@line 1128
      $$1247 = -1; //@line 1129
      break;
     } else {
      $$1247 = $$0242 + $$0246 | 0; //@line 1133
      break;
     }
    } else {
     $$1247 = $$0246; //@line 1137
    }
   } while (0);
   $20 = HEAP32[$5 >> 2] | 0; //@line 1140
   $21 = HEAP8[$20 >> 0] | 0; //@line 1141
   if (!($21 << 24 >> 24)) {
    label = 92; //@line 1144
    break L1;
   }
   $23 = $21; //@line 1147
   $25 = $20; //@line 1147
   L12 : while (1) {
    switch ($23 << 24 >> 24) {
    case 37:
     {
      label = 10; //@line 1151
      break L12;
      break;
     }
    case 0:
     {
      $$0248$lcssa = $25; //@line 1156
      break L12;
      break;
     }
    default:
     {}
    }
    $24 = $25 + 1 | 0; //@line 1163
    HEAP32[$5 >> 2] = $24; //@line 1164
    $23 = HEAP8[$24 >> 0] | 0; //@line 1166
    $25 = $24; //@line 1166
   }
   L15 : do {
    if ((label | 0) == 10) {
     label = 0; //@line 1170
     $$0248320 = $25; //@line 1171
     $27 = $25; //@line 1171
     while (1) {
      if ((HEAP8[$27 + 1 >> 0] | 0) != 37) {
       $$0248$lcssa = $$0248320; //@line 1177
       break L15;
      }
      $30 = $$0248320 + 1 | 0; //@line 1180
      $27 = $27 + 2 | 0; //@line 1181
      HEAP32[$5 >> 2] = $27; //@line 1182
      if ((HEAP8[$27 >> 0] | 0) != 37) {
       $$0248$lcssa = $30; //@line 1188
       break;
      } else {
       $$0248320 = $30; //@line 1186
      }
     }
    }
   } while (0);
   $$0242 = $$0248$lcssa - $20 | 0; //@line 1196
   if ($10) {
    _out_655($0, $20, $$0242); //@line 1198
   }
   if (!$$0242) {
    break;
   } else {
    $$0246 = $$1247; //@line 1204
   }
  }
  $43 = (_isdigit(HEAP8[(HEAP32[$5 >> 2] | 0) + 1 >> 0] | 0) | 0) == 0; //@line 1212
  $$pre359 = HEAP32[$5 >> 2] | 0; //@line 1213
  if ($43) {
   $$0252 = -1; //@line 1215
   $$1269 = $$0268$ph; //@line 1215
   $$sink = 1; //@line 1215
  } else {
   if ((HEAP8[$$pre359 + 2 >> 0] | 0) == 36) {
    $$0252 = (HEAP8[$$pre359 + 1 >> 0] | 0) + -48 | 0; //@line 1225
    $$1269 = 1; //@line 1225
    $$sink = 3; //@line 1225
   } else {
    $$0252 = -1; //@line 1227
    $$1269 = $$0268$ph; //@line 1227
    $$sink = 1; //@line 1227
   }
  }
  $51 = $$pre359 + $$sink | 0; //@line 1230
  HEAP32[$5 >> 2] = $51; //@line 1231
  $52 = HEAP8[$51 >> 0] | 0; //@line 1232
  $54 = ($52 << 24 >> 24) + -32 | 0; //@line 1234
  if ($54 >>> 0 > 31 | (1 << $54 & 75913 | 0) == 0) {
   $$0261$lcssa = 0; //@line 1241
   $$lcssa307 = $52; //@line 1241
   $storemerge272$lcssa = $51; //@line 1241
  } else {
   $$0261327 = 0; //@line 1243
   $60 = $54; //@line 1243
   $storemerge272326 = $51; //@line 1243
   while (1) {
    $61 = 1 << $60 | $$0261327; //@line 1246
    $62 = $storemerge272326 + 1 | 0; //@line 1247
    HEAP32[$5 >> 2] = $62; //@line 1248
    $63 = HEAP8[$62 >> 0] | 0; //@line 1249
    $60 = ($63 << 24 >> 24) + -32 | 0; //@line 1251
    if ($60 >>> 0 > 31 | (1 << $60 & 75913 | 0) == 0) {
     $$0261$lcssa = $61; //@line 1258
     $$lcssa307 = $63; //@line 1258
     $storemerge272$lcssa = $62; //@line 1258
     break;
    } else {
     $$0261327 = $61; //@line 1261
     $storemerge272326 = $62; //@line 1261
    }
   }
  }
  if ($$lcssa307 << 24 >> 24 == 42) {
   if (!(_isdigit(HEAP8[$storemerge272$lcssa + 1 >> 0] | 0) | 0)) {
    label = 27; //@line 1273
   } else {
    $76 = HEAP32[$5 >> 2] | 0; //@line 1275
    if ((HEAP8[$76 + 2 >> 0] | 0) == 36) {
     $80 = $76 + 1 | 0; //@line 1280
     HEAP32[$4 + ((HEAP8[$80 >> 0] | 0) + -48 << 2) >> 2] = 10; //@line 1285
     $$0258 = HEAP32[$3 + ((HEAP8[$80 >> 0] | 0) + -48 << 3) >> 2] | 0; //@line 1297
     $$2270 = 1; //@line 1297
     $storemerge273 = $76 + 3 | 0; //@line 1297
    } else {
     label = 27; //@line 1299
    }
   }
   if ((label | 0) == 27) {
    label = 0; //@line 1303
    if ($$1269 | 0) {
     $$0 = -1; //@line 1306
     break;
    }
    if ($10) {
     $102 = (HEAP32[$2 >> 2] | 0) + (4 - 1) & ~(4 - 1); //@line 1321
     $103 = HEAP32[$102 >> 2] | 0; //@line 1322
     HEAP32[$2 >> 2] = $102 + 4; //@line 1324
     $355 = $103; //@line 1325
    } else {
     $355 = 0; //@line 1327
    }
    $$0258 = $355; //@line 1331
    $$2270 = 0; //@line 1331
    $storemerge273 = (HEAP32[$5 >> 2] | 0) + 1 | 0; //@line 1331
   }
   HEAP32[$5 >> 2] = $storemerge273; //@line 1333
   $106 = ($$0258 | 0) < 0; //@line 1334
   $$1259 = $106 ? 0 - $$0258 | 0 : $$0258; //@line 1339
   $$1262 = $106 ? $$0261$lcssa | 8192 : $$0261$lcssa; //@line 1339
   $$3271 = $$2270; //@line 1339
   $112 = $storemerge273; //@line 1339
  } else {
   $109 = _getint_656($5) | 0; //@line 1341
   if (($109 | 0) < 0) {
    $$0 = -1; //@line 1344
    break;
   }
   $$1259 = $109; //@line 1348
   $$1262 = $$0261$lcssa; //@line 1348
   $$3271 = $$1269; //@line 1348
   $112 = HEAP32[$5 >> 2] | 0; //@line 1348
  }
  do {
   if ((HEAP8[$112 >> 0] | 0) == 46) {
    $114 = $112 + 1 | 0; //@line 1354
    if ((HEAP8[$114 >> 0] | 0) != 42) {
     HEAP32[$5 >> 2] = $114; //@line 1358
     $152 = _getint_656($5) | 0; //@line 1359
     $$0253 = $152; //@line 1361
     $$pre362 = HEAP32[$5 >> 2] | 0; //@line 1361
     break;
    }
    if (_isdigit(HEAP8[$112 + 2 >> 0] | 0) | 0) {
     $122 = HEAP32[$5 >> 2] | 0; //@line 1370
     if ((HEAP8[$122 + 3 >> 0] | 0) == 36) {
      $126 = $122 + 2 | 0; //@line 1375
      HEAP32[$4 + ((HEAP8[$126 >> 0] | 0) + -48 << 2) >> 2] = 10; //@line 1380
      $137 = HEAP32[$3 + ((HEAP8[$126 >> 0] | 0) + -48 << 3) >> 2] | 0; //@line 1387
      $141 = $122 + 4 | 0; //@line 1391
      HEAP32[$5 >> 2] = $141; //@line 1392
      $$0253 = $137; //@line 1393
      $$pre362 = $141; //@line 1393
      break;
     }
    }
    if ($$3271 | 0) {
     $$0 = -1; //@line 1399
     break L1;
    }
    if ($10) {
     $148 = (HEAP32[$2 >> 2] | 0) + (4 - 1) & ~(4 - 1); //@line 1414
     $149 = HEAP32[$148 >> 2] | 0; //@line 1415
     HEAP32[$2 >> 2] = $148 + 4; //@line 1417
     $356 = $149; //@line 1418
    } else {
     $356 = 0; //@line 1420
    }
    $151 = (HEAP32[$5 >> 2] | 0) + 2 | 0; //@line 1423
    HEAP32[$5 >> 2] = $151; //@line 1424
    $$0253 = $356; //@line 1425
    $$pre362 = $151; //@line 1425
   } else {
    $$0253 = -1; //@line 1427
    $$pre362 = $112; //@line 1427
   }
  } while (0);
  $$0251 = 0; //@line 1430
  $154 = $$pre362; //@line 1430
  while (1) {
   if (((HEAP8[$154 >> 0] | 0) + -65 | 0) >>> 0 > 57) {
    $$0 = -1; //@line 1437
    break L1;
   }
   $154$looptemp = $154;
   $154 = $154 + 1 | 0; //@line 1440
   HEAP32[$5 >> 2] = $154; //@line 1441
   $163 = HEAP8[(HEAP8[$154$looptemp >> 0] | 0) + -65 + (112 + ($$0251 * 58 | 0)) >> 0] | 0; //@line 1446
   $164 = $163 & 255; //@line 1447
   if (($164 + -1 | 0) >>> 0 >= 8) {
    break;
   } else {
    $$0251 = $164; //@line 1451
   }
  }
  if (!($163 << 24 >> 24)) {
   $$0 = -1; //@line 1458
   break;
  }
  $169 = ($$0252 | 0) > -1; //@line 1462
  do {
   if ($163 << 24 >> 24 == 19) {
    if ($169) {
     $$0 = -1; //@line 1466
     break L1;
    } else {
     label = 54; //@line 1469
    }
   } else {
    if ($169) {
     HEAP32[$4 + ($$0252 << 2) >> 2] = $164; //@line 1474
     $172 = $3 + ($$0252 << 3) | 0; //@line 1476
     $177 = HEAP32[$172 + 4 >> 2] | 0; //@line 1481
     $178 = $6; //@line 1482
     HEAP32[$178 >> 2] = HEAP32[$172 >> 2]; //@line 1484
     HEAP32[$178 + 4 >> 2] = $177; //@line 1487
     label = 54; //@line 1488
     break;
    }
    if (!$10) {
     $$0 = 0; //@line 1492
     break L1;
    }
    _pop_arg_658($6, $164, $2); //@line 1495
    $183 = HEAP32[$5 >> 2] | 0; //@line 1497
    label = 55; //@line 1498
   }
  } while (0);
  if ((label | 0) == 54) {
   label = 0; //@line 1502
   if ($10) {
    $183 = $154; //@line 1504
    label = 55; //@line 1505
   } else {
    $$0242$ph$be = 0; //@line 1507
   }
  }
  L77 : do {
   if ((label | 0) == 55) {
    label = 0; //@line 1512
    $185 = HEAP8[$183 + -1 >> 0] | 0; //@line 1515
    $$0234 = ($$0251 | 0) != 0 & ($185 & 15 | 0) == 3 ? $185 & -33 : $185; //@line 1521
    $192 = $$1262 & -65537; //@line 1524
    $spec$select = ($$1262 & 8192 | 0) == 0 ? $$1262 : $192; //@line 1525
    L79 : do {
     switch ($$0234 | 0) {
     case 110:
      {
       switch (($$0251 & 255) << 24 >> 24) {
       case 0:
        {
         HEAP32[HEAP32[$6 >> 2] >> 2] = $$1247; //@line 1533
         $$0242$ph$be = 0; //@line 1534
         break L77;
         break;
        }
       case 1:
        {
         HEAP32[HEAP32[$6 >> 2] >> 2] = $$1247; //@line 1540
         $$0242$ph$be = 0; //@line 1541
         break L77;
         break;
        }
       case 2:
        {
         $204 = HEAP32[$6 >> 2] | 0; //@line 1549
         HEAP32[$204 >> 2] = $$1247; //@line 1551
         HEAP32[$204 + 4 >> 2] = (($$1247 | 0) < 0) << 31 >> 31; //@line 1554
         $$0242$ph$be = 0; //@line 1555
         break L77;
         break;
        }
       case 3:
        {
         HEAP16[HEAP32[$6 >> 2] >> 1] = $$1247; //@line 1562
         $$0242$ph$be = 0; //@line 1563
         break L77;
         break;
        }
       case 4:
        {
         HEAP8[HEAP32[$6 >> 2] >> 0] = $$1247; //@line 1570
         $$0242$ph$be = 0; //@line 1571
         break L77;
         break;
        }
       case 6:
        {
         HEAP32[HEAP32[$6 >> 2] >> 2] = $$1247; //@line 1577
         $$0242$ph$be = 0; //@line 1578
         break L77;
         break;
        }
       case 7:
        {
         $216 = HEAP32[$6 >> 2] | 0; //@line 1586
         HEAP32[$216 >> 2] = $$1247; //@line 1588
         HEAP32[$216 + 4 >> 2] = (($$1247 | 0) < 0) << 31 >> 31; //@line 1591
         $$0242$ph$be = 0; //@line 1592
         break L77;
         break;
        }
       default:
        {
         $$0242$ph$be = 0; //@line 1597
         break L77;
        }
       }
       break;
      }
     case 112:
      {
       $$1235 = 120; //@line 1607
       $$1254 = $$0253 >>> 0 > 8 ? $$0253 : 8; //@line 1607
       $$3264 = $spec$select | 8; //@line 1607
       label = 67; //@line 1608
       break;
      }
     case 88:
     case 120:
      {
       $$1235 = $$0234; //@line 1612
       $$1254 = $$0253; //@line 1612
       $$3264 = $spec$select; //@line 1612
       label = 67; //@line 1613
       break;
      }
     case 111:
      {
       $238 = $6; //@line 1617
       $240 = HEAP32[$238 >> 2] | 0; //@line 1619
       $243 = HEAP32[$238 + 4 >> 2] | 0; //@line 1622
       $244 = _fmt_o($240, $243, $11) | 0; //@line 1623
       $248 = $12 - $244 | 0; //@line 1627
       $$0228 = $244; //@line 1632
       $$1232 = 0; //@line 1632
       $$1237 = 1927; //@line 1632
       $$2255 = ($spec$select & 8 | 0) == 0 | ($$0253 | 0) > ($248 | 0) ? $$0253 : $248 + 1 | 0; //@line 1632
       $$4265 = $spec$select; //@line 1632
       $277 = $240; //@line 1632
       $279 = $243; //@line 1632
       label = 73; //@line 1633
       break;
      }
     case 105:
     case 100:
      {
       $252 = $6; //@line 1637
       $254 = HEAP32[$252 >> 2] | 0; //@line 1639
       $257 = HEAP32[$252 + 4 >> 2] | 0; //@line 1642
       if (($257 | 0) < 0) {
        $259 = _i64Subtract(0, 0, $254 | 0, $257 | 0) | 0; //@line 1645
        $260 = getTempRet0() | 0; //@line 1646
        $261 = $6; //@line 1647
        HEAP32[$261 >> 2] = $259; //@line 1649
        HEAP32[$261 + 4 >> 2] = $260; //@line 1652
        $$0231 = 1; //@line 1653
        $$0236 = 1927; //@line 1653
        $271 = $259; //@line 1653
        $272 = $260; //@line 1653
        label = 72; //@line 1654
        break L79;
       } else {
        $$0231 = ($spec$select & 2049 | 0) != 0 & 1; //@line 1666
        $$0236 = ($spec$select & 2048 | 0) == 0 ? ($spec$select & 1 | 0) == 0 ? 1927 : 1929 : 1928; //@line 1666
        $271 = $254; //@line 1666
        $272 = $257; //@line 1666
        label = 72; //@line 1667
        break L79;
       }
       break;
      }
     case 117:
      {
       $193 = $6; //@line 1673
       $$0231 = 0; //@line 1679
       $$0236 = 1927; //@line 1679
       $271 = HEAP32[$193 >> 2] | 0; //@line 1679
       $272 = HEAP32[$193 + 4 >> 2] | 0; //@line 1679
       label = 72; //@line 1680
       break;
      }
     case 99:
      {
       HEAP8[$13 >> 0] = HEAP32[$6 >> 2]; //@line 1691
       $$1 = $13; //@line 1692
       $$2233 = 0; //@line 1692
       $$2238 = 1927; //@line 1692
       $$5 = 1; //@line 1692
       $$6267 = $192; //@line 1692
       $$pre$phiZ2D = $12; //@line 1692
       break;
      }
     case 115:
      {
       $295 = HEAP32[$6 >> 2] | 0; //@line 1696
       $297 = ($295 | 0) == 0 ? 1937 : $295; //@line 1698
       $298 = _memchr($297, 0, $$0253) | 0; //@line 1699
       $299 = ($298 | 0) == 0; //@line 1700
       $$1 = $297; //@line 1708
       $$2233 = 0; //@line 1708
       $$2238 = 1927; //@line 1708
       $$5 = $299 ? $$0253 : $298 - $297 | 0; //@line 1708
       $$6267 = $192; //@line 1708
       $$pre$phiZ2D = $299 ? $297 + $$0253 | 0 : $298; //@line 1708
       break;
      }
     case 67:
      {
       HEAP32[$8 >> 2] = HEAP32[$6 >> 2]; //@line 1718
       HEAP32[$14 >> 2] = 0; //@line 1719
       HEAP32[$6 >> 2] = $8; //@line 1720
       $$4257369 = -1; //@line 1721
       label = 79; //@line 1722
       break;
      }
     case 83:
      {
       if (!$$0253) {
        _pad_661($0, 32, $$1259, 0, $spec$select); //@line 1728
        $$0239312370 = 0; //@line 1729
        label = 89; //@line 1730
       } else {
        $$4257369 = $$0253; //@line 1732
        label = 79; //@line 1733
       }
       break;
      }
     case 65:
     case 71:
     case 70:
     case 69:
     case 97:
     case 103:
     case 102:
     case 101:
      {
       $$0242$ph$be = _fmt_fp($0, +HEAPF64[$6 >> 3], $$1259, $$0253, $spec$select, $$0234) | 0; //@line 1740
       break L77;
       break;
      }
     default:
      {
       $$1 = $20; //@line 1745
       $$2233 = 0; //@line 1745
       $$2238 = 1927; //@line 1745
       $$5 = $$0253; //@line 1745
       $$6267 = $spec$select; //@line 1745
       $$pre$phiZ2D = $12; //@line 1745
      }
     }
    } while (0);
    L102 : do {
     if ((label | 0) == 67) {
      label = 0; //@line 1751
      $223 = $6; //@line 1752
      $225 = HEAP32[$223 >> 2] | 0; //@line 1754
      $228 = HEAP32[$223 + 4 >> 2] | 0; //@line 1757
      $230 = _fmt_x($225, $228, $11, $$1235 & 32) | 0; //@line 1759
      $or$cond277 = ($$3264 & 8 | 0) == 0 | ($225 | 0) == 0 & ($228 | 0) == 0; //@line 1765
      $$0228 = $230; //@line 1770
      $$1232 = $or$cond277 ? 0 : 2; //@line 1770
      $$1237 = $or$cond277 ? 1927 : 1927 + ($$1235 >>> 4) | 0; //@line 1770
      $$2255 = $$1254; //@line 1770
      $$4265 = $$3264; //@line 1770
      $277 = $225; //@line 1770
      $279 = $228; //@line 1770
      label = 73; //@line 1771
     } else if ((label | 0) == 72) {
      label = 0; //@line 1774
      $$0228 = _fmt_u($271, $272, $11) | 0; //@line 1776
      $$1232 = $$0231; //@line 1776
      $$1237 = $$0236; //@line 1776
      $$2255 = $$0253; //@line 1776
      $$4265 = $spec$select; //@line 1776
      $277 = $271; //@line 1776
      $279 = $272; //@line 1776
      label = 73; //@line 1777
     } else if ((label | 0) == 79) {
      label = 0; //@line 1780
      $$0229333 = HEAP32[$6 >> 2] | 0; //@line 1782
      $$0239332 = 0; //@line 1782
      while (1) {
       $312 = HEAP32[$$0229333 >> 2] | 0; //@line 1784
       if (!$312) {
        $$0239312 = $$0239332; //@line 1787
        break;
       }
       $314 = _wctomb($9, $312) | 0; //@line 1790
       $315 = ($314 | 0) < 0; //@line 1791
       if ($315 | $314 >>> 0 > ($$4257369 - $$0239332 | 0) >>> 0) {
        label = 83; //@line 1796
        break;
       }
       $319 = $314 + $$0239332 | 0; //@line 1800
       if ($$4257369 >>> 0 > $319 >>> 0) {
        $$0229333 = $$0229333 + 4 | 0; //@line 1803
        $$0239332 = $319; //@line 1803
       } else {
        $$0239312 = $319; //@line 1805
        break;
       }
      }
      if ((label | 0) == 83) {
       label = 0; //@line 1810
       if ($315) {
        $$0 = -1; //@line 1812
        break L1;
       } else {
        $$0239312 = $$0239332; //@line 1815
       }
      }
      _pad_661($0, 32, $$1259, $$0239312, $spec$select); //@line 1818
      if (!$$0239312) {
       $$0239312370 = 0; //@line 1821
       label = 89; //@line 1822
      } else {
       $$1230339 = HEAP32[$6 >> 2] | 0; //@line 1825
       $$1240338 = 0; //@line 1825
       while (1) {
        $323 = HEAP32[$$1230339 >> 2] | 0; //@line 1827
        if (!$323) {
         $$0239312370 = $$0239312; //@line 1830
         label = 89; //@line 1831
         break L102;
        }
        $325 = _wctomb($9, $323) | 0; //@line 1834
        $$1240338 = $325 + $$1240338 | 0; //@line 1835
        if (($$1240338 | 0) > ($$0239312 | 0)) {
         $$0239312370 = $$0239312; //@line 1838
         label = 89; //@line 1839
         break L102;
        }
        _out_655($0, $9, $325); //@line 1843
        if ($$1240338 >>> 0 >= $$0239312 >>> 0) {
         $$0239312370 = $$0239312; //@line 1848
         label = 89; //@line 1849
         break;
        } else {
         $$1230339 = $$1230339 + 4 | 0; //@line 1846
        }
       }
      }
     }
    } while (0);
    if ((label | 0) == 73) {
     label = 0; //@line 1857
     $280 = ($277 | 0) != 0 | ($279 | 0) != 0; //@line 1863
     $or$cond = ($$2255 | 0) != 0 | $280; //@line 1865
     $286 = $12 - $$0228 + (($280 ^ 1) & 1) | 0; //@line 1870
     $$1 = $or$cond ? $$0228 : $11; //@line 1875
     $$2233 = $$1232; //@line 1875
     $$2238 = $$1237; //@line 1875
     $$5 = $or$cond ? ($$2255 | 0) > ($286 | 0) ? $$2255 : $286 : 0; //@line 1875
     $$6267 = ($$2255 | 0) > -1 ? $$4265 & -65537 : $$4265; //@line 1875
     $$pre$phiZ2D = $12; //@line 1875
    } else if ((label | 0) == 89) {
     label = 0; //@line 1878
     _pad_661($0, 32, $$1259, $$0239312370, $spec$select ^ 8192); //@line 1880
     $$0242$ph$be = ($$1259 | 0) > ($$0239312370 | 0) ? $$1259 : $$0239312370; //@line 1883
     break;
    }
    $336 = $$pre$phiZ2D - $$1 | 0; //@line 1887
    $spec$select283 = ($$5 | 0) < ($336 | 0) ? $336 : $$5; //@line 1889
    $338 = $spec$select283 + $$2233 | 0; //@line 1890
    $$2260 = ($$1259 | 0) < ($338 | 0) ? $338 : $$1259; //@line 1892
    _pad_661($0, 32, $$2260, $338, $$6267); //@line 1893
    _out_655($0, $$2238, $$2233); //@line 1894
    _pad_661($0, 48, $$2260, $338, $$6267 ^ 65536); //@line 1896
    _pad_661($0, 48, $spec$select283, $336, 0); //@line 1897
    _out_655($0, $$1, $336); //@line 1898
    _pad_661($0, 32, $$2260, $338, $$6267 ^ 8192); //@line 1900
    $$0242$ph$be = $$2260; //@line 1901
   }
  } while (0);
  $$0242$ph = $$0242$ph$be; //@line 1904
  $$0246$ph = $$1247; //@line 1904
  $$0268$ph = $$3271; //@line 1904
 }
 L123 : do {
  if ((label | 0) == 92) {
   if (!$0) {
    if (!$$0268$ph) {
     $$0 = 0; //@line 1912
    } else {
     $$2241319 = 1; //@line 1914
     while (1) {
      $345 = HEAP32[$4 + ($$2241319 << 2) >> 2] | 0; //@line 1917
      if (!$345) {
       break;
      }
      _pop_arg_658($3 + ($$2241319 << 3) | 0, $345, $2); //@line 1923
      $348 = $$2241319 + 1 | 0; //@line 1924
      if ($348 >>> 0 < 10) {
       $$2241319 = $348; //@line 1927
      } else {
       $$0 = 1; //@line 1929
       break L123;
      }
     }
     $$3316 = $$2241319; //@line 1933
     while (1) {
      if (HEAP32[$4 + ($$3316 << 2) >> 2] | 0) {
       $$0 = -1; //@line 1940
       break L123;
      }
      $$3316 = $$3316 + 1 | 0; //@line 1938
      if ($$3316 >>> 0 >= 10) {
       $$0 = 1; //@line 1947
       break;
      }
     }
    }
   } else {
    $$0 = $$1247; //@line 1953
   }
  }
 } while (0);
 STACKTOP = sp; //@line 1957
 return $$0 | 0; //@line 1957
}
function _free($0) {
 $0 = $0 | 0;
 var $$0211$i = 0, $$0211$in$i = 0, $$0381438 = 0, $$0382$lcssa = 0, $$0382437 = 0, $$0394 = 0, $$0401 = 0, $$1 = 0, $$1380 = 0, $$1385 = 0, $$1385$be = 0, $$1385$ph = 0, $$1388 = 0, $$1388$be = 0, $$1388$ph = 0, $$1396 = 0, $$1396$be = 0, $$1396$ph = 0, $$1400 = 0, $$1400$be = 0, $$1400$ph = 0, $$2 = 0, $$3 = 0, $$3398 = 0, $$pre$phi444Z2D = 0, $$pre$phi446Z2D = 0, $$pre$phiZ2D = 0, $10 = 0, $105 = 0, $106 = 0, $114 = 0, $115 = 0, $116 = 0, $124 = 0, $13 = 0, $132 = 0, $137 = 0, $138 = 0, $141 = 0, $143 = 0, $145 = 0, $16 = 0, $160 = 0, $165 = 0, $167 = 0, $17 = 0, $170 = 0, $173 = 0, $176 = 0, $179 = 0, $180 = 0, $181 = 0, $183 = 0, $185 = 0, $186 = 0, $188 = 0, $189 = 0, $195 = 0, $196 = 0, $2 = 0, $205 = 0, $21 = 0, $210 = 0, $213 = 0, $214 = 0, $220 = 0, $235 = 0, $238 = 0, $239 = 0, $24 = 0, $240 = 0, $244 = 0, $245 = 0, $251 = 0, $256 = 0, $257 = 0, $26 = 0, $260 = 0, $262 = 0, $265 = 0, $270 = 0, $276 = 0, $28 = 0, $280 = 0, $281 = 0, $288 = 0, $3 = 0, $300 = 0, $305 = 0, $312 = 0, $313 = 0, $314 = 0, $323 = 0, $41 = 0, $46 = 0, $48 = 0, $51 = 0, $53 = 0, $56 = 0, $59 = 0, $6 = 0, $60 = 0, $61 = 0, $63 = 0, $65 = 0, $66 = 0, $68 = 0, $69 = 0, $7 = 0, $74 = 0, $75 = 0, $84 = 0, $89 = 0, $9 = 0, $92 = 0, $93 = 0, $99 = 0;
 if (!$0) {
  return;
 }
 $2 = $0 + -8 | 0; //@line 6075
 $3 = HEAP32[792] | 0; //@line 6076
 if ($2 >>> 0 < $3 >>> 0) {
  _abort(); //@line 6079
 }
 $6 = HEAP32[$0 + -4 >> 2] | 0; //@line 6083
 $7 = $6 & 3; //@line 6084
 if (($7 | 0) == 1) {
  _abort(); //@line 6087
 }
 $9 = $6 & -8; //@line 6090
 $10 = $2 + $9 | 0; //@line 6091
 L10 : do {
  if (!($6 & 1)) {
   $13 = HEAP32[$2 >> 2] | 0; //@line 6096
   if (!$7) {
    return;
   }
   $16 = $2 + (0 - $13) | 0; //@line 6102
   $17 = $13 + $9 | 0; //@line 6103
   if ($16 >>> 0 < $3 >>> 0) {
    _abort(); //@line 6106
   }
   if ((HEAP32[793] | 0) == ($16 | 0)) {
    $105 = $10 + 4 | 0; //@line 6112
    $106 = HEAP32[$105 >> 2] | 0; //@line 6113
    if (($106 & 3 | 0) != 3) {
     $$1 = $16; //@line 6117
     $$1380 = $17; //@line 6117
     $114 = $16; //@line 6117
     break;
    }
    HEAP32[790] = $17; //@line 6124
    HEAP32[$105 >> 2] = $106 & -2; //@line 6125
    HEAP32[$16 + 4 >> 2] = $17 | 1; //@line 6126
    HEAP32[$16 + $17 >> 2] = $17; //@line 6127
    return;
   }
   $21 = $13 >>> 3; //@line 6130
   if ($13 >>> 0 < 256) {
    $24 = HEAP32[$16 + 8 >> 2] | 0; //@line 6134
    $26 = HEAP32[$16 + 12 >> 2] | 0; //@line 6136
    $28 = 3192 + ($21 << 1 << 2) | 0; //@line 6138
    if (($24 | 0) != ($28 | 0)) {
     if ($3 >>> 0 > $24 >>> 0) {
      _abort(); //@line 6143
     }
     if ((HEAP32[$24 + 12 >> 2] | 0) != ($16 | 0)) {
      _abort(); //@line 6150
     }
    }
    if (($26 | 0) == ($24 | 0)) {
     HEAP32[788] = HEAP32[788] & ~(1 << $21); //@line 6160
     $$1 = $16; //@line 6161
     $$1380 = $17; //@line 6161
     $114 = $16; //@line 6161
     break;
    }
    if (($26 | 0) == ($28 | 0)) {
     $$pre$phi446Z2D = $26 + 8 | 0; //@line 6167
    } else {
     if ($3 >>> 0 > $26 >>> 0) {
      _abort(); //@line 6171
     }
     $41 = $26 + 8 | 0; //@line 6174
     if ((HEAP32[$41 >> 2] | 0) == ($16 | 0)) {
      $$pre$phi446Z2D = $41; //@line 6178
     } else {
      _abort(); //@line 6180
     }
    }
    HEAP32[$24 + 12 >> 2] = $26; //@line 6185
    HEAP32[$$pre$phi446Z2D >> 2] = $24; //@line 6186
    $$1 = $16; //@line 6187
    $$1380 = $17; //@line 6187
    $114 = $16; //@line 6187
    break;
   }
   $46 = HEAP32[$16 + 24 >> 2] | 0; //@line 6191
   $48 = HEAP32[$16 + 12 >> 2] | 0; //@line 6193
   do {
    if (($48 | 0) == ($16 | 0)) {
     $59 = $16 + 16 | 0; //@line 6197
     $60 = $59 + 4 | 0; //@line 6198
     $61 = HEAP32[$60 >> 2] | 0; //@line 6199
     if (!$61) {
      $63 = HEAP32[$59 >> 2] | 0; //@line 6202
      if (!$63) {
       $$3 = 0; //@line 6205
       break;
      } else {
       $$1385$ph = $63; //@line 6208
       $$1388$ph = $59; //@line 6208
      }
     } else {
      $$1385$ph = $61; //@line 6211
      $$1388$ph = $60; //@line 6211
     }
     $$1385 = $$1385$ph; //@line 6213
     $$1388 = $$1388$ph; //@line 6213
     while (1) {
      $65 = $$1385 + 20 | 0; //@line 6215
      $66 = HEAP32[$65 >> 2] | 0; //@line 6216
      if (!$66) {
       $68 = $$1385 + 16 | 0; //@line 6219
       $69 = HEAP32[$68 >> 2] | 0; //@line 6220
       if (!$69) {
        break;
       } else {
        $$1385$be = $69; //@line 6225
        $$1388$be = $68; //@line 6225
       }
      } else {
       $$1385$be = $66; //@line 6228
       $$1388$be = $65; //@line 6228
      }
      $$1385 = $$1385$be; //@line 6230
      $$1388 = $$1388$be; //@line 6230
     }
     if ($3 >>> 0 > $$1388 >>> 0) {
      _abort(); //@line 6234
     } else {
      HEAP32[$$1388 >> 2] = 0; //@line 6237
      $$3 = $$1385; //@line 6238
      break;
     }
    } else {
     $51 = HEAP32[$16 + 8 >> 2] | 0; //@line 6243
     if ($3 >>> 0 > $51 >>> 0) {
      _abort(); //@line 6246
     }
     $53 = $51 + 12 | 0; //@line 6249
     if ((HEAP32[$53 >> 2] | 0) != ($16 | 0)) {
      _abort(); //@line 6253
     }
     $56 = $48 + 8 | 0; //@line 6256
     if ((HEAP32[$56 >> 2] | 0) == ($16 | 0)) {
      HEAP32[$53 >> 2] = $48; //@line 6260
      HEAP32[$56 >> 2] = $51; //@line 6261
      $$3 = $48; //@line 6262
      break;
     } else {
      _abort(); //@line 6265
     }
    }
   } while (0);
   if (!$46) {
    $$1 = $16; //@line 6272
    $$1380 = $17; //@line 6272
    $114 = $16; //@line 6272
   } else {
    $74 = HEAP32[$16 + 28 >> 2] | 0; //@line 6275
    $75 = 3456 + ($74 << 2) | 0; //@line 6276
    do {
     if ((HEAP32[$75 >> 2] | 0) == ($16 | 0)) {
      HEAP32[$75 >> 2] = $$3; //@line 6281
      if (!$$3) {
       HEAP32[789] = HEAP32[789] & ~(1 << $74); //@line 6288
       $$1 = $16; //@line 6289
       $$1380 = $17; //@line 6289
       $114 = $16; //@line 6289
       break L10;
      }
     } else {
      if ((HEAP32[792] | 0) >>> 0 > $46 >>> 0) {
       _abort(); //@line 6296
      } else {
       $84 = $46 + 16 | 0; //@line 6299
       HEAP32[((HEAP32[$84 >> 2] | 0) == ($16 | 0) ? $84 : $46 + 20 | 0) >> 2] = $$3; //@line 6304
       if (!$$3) {
        $$1 = $16; //@line 6307
        $$1380 = $17; //@line 6307
        $114 = $16; //@line 6307
        break L10;
       } else {
        break;
       }
      }
     }
    } while (0);
    $89 = HEAP32[792] | 0; //@line 6315
    if ($89 >>> 0 > $$3 >>> 0) {
     _abort(); //@line 6318
    }
    HEAP32[$$3 + 24 >> 2] = $46; //@line 6322
    $92 = $16 + 16 | 0; //@line 6323
    $93 = HEAP32[$92 >> 2] | 0; //@line 6324
    do {
     if ($93 | 0) {
      if ($89 >>> 0 > $93 >>> 0) {
       _abort(); //@line 6330
      } else {
       HEAP32[$$3 + 16 >> 2] = $93; //@line 6334
       HEAP32[$93 + 24 >> 2] = $$3; //@line 6336
       break;
      }
     }
    } while (0);
    $99 = HEAP32[$92 + 4 >> 2] | 0; //@line 6342
    if (!$99) {
     $$1 = $16; //@line 6345
     $$1380 = $17; //@line 6345
     $114 = $16; //@line 6345
    } else {
     if ((HEAP32[792] | 0) >>> 0 > $99 >>> 0) {
      _abort(); //@line 6350
     } else {
      HEAP32[$$3 + 20 >> 2] = $99; //@line 6354
      HEAP32[$99 + 24 >> 2] = $$3; //@line 6356
      $$1 = $16; //@line 6357
      $$1380 = $17; //@line 6357
      $114 = $16; //@line 6357
      break;
     }
    }
   }
  } else {
   $$1 = $2; //@line 6363
   $$1380 = $9; //@line 6363
   $114 = $2; //@line 6363
  }
 } while (0);
 if ($114 >>> 0 >= $10 >>> 0) {
  _abort(); //@line 6368
 }
 $115 = $10 + 4 | 0; //@line 6371
 $116 = HEAP32[$115 >> 2] | 0; //@line 6372
 if (!($116 & 1)) {
  _abort(); //@line 6376
 }
 if (!($116 & 2)) {
  if ((HEAP32[794] | 0) == ($10 | 0)) {
   $124 = (HEAP32[791] | 0) + $$1380 | 0; //@line 6386
   HEAP32[791] = $124; //@line 6387
   HEAP32[794] = $$1; //@line 6388
   HEAP32[$$1 + 4 >> 2] = $124 | 1; //@line 6391
   if (($$1 | 0) != (HEAP32[793] | 0)) {
    return;
   }
   HEAP32[793] = 0; //@line 6397
   HEAP32[790] = 0; //@line 6398
   return;
  }
  if ((HEAP32[793] | 0) == ($10 | 0)) {
   $132 = (HEAP32[790] | 0) + $$1380 | 0; //@line 6405
   HEAP32[790] = $132; //@line 6406
   HEAP32[793] = $114; //@line 6407
   HEAP32[$$1 + 4 >> 2] = $132 | 1; //@line 6410
   HEAP32[$114 + $132 >> 2] = $132; //@line 6412
   return;
  }
  $137 = ($116 & -8) + $$1380 | 0; //@line 6416
  $138 = $116 >>> 3; //@line 6417
  L111 : do {
   if ($116 >>> 0 < 256) {
    $141 = HEAP32[$10 + 8 >> 2] | 0; //@line 6422
    $143 = HEAP32[$10 + 12 >> 2] | 0; //@line 6424
    $145 = 3192 + ($138 << 1 << 2) | 0; //@line 6426
    if (($141 | 0) != ($145 | 0)) {
     if ((HEAP32[792] | 0) >>> 0 > $141 >>> 0) {
      _abort(); //@line 6432
     }
     if ((HEAP32[$141 + 12 >> 2] | 0) != ($10 | 0)) {
      _abort(); //@line 6439
     }
    }
    if (($143 | 0) == ($141 | 0)) {
     HEAP32[788] = HEAP32[788] & ~(1 << $138); //@line 6449
     break;
    }
    if (($143 | 0) == ($145 | 0)) {
     $$pre$phi444Z2D = $143 + 8 | 0; //@line 6455
    } else {
     if ((HEAP32[792] | 0) >>> 0 > $143 >>> 0) {
      _abort(); //@line 6460
     }
     $160 = $143 + 8 | 0; //@line 6463
     if ((HEAP32[$160 >> 2] | 0) == ($10 | 0)) {
      $$pre$phi444Z2D = $160; //@line 6467
     } else {
      _abort(); //@line 6469
     }
    }
    HEAP32[$141 + 12 >> 2] = $143; //@line 6474
    HEAP32[$$pre$phi444Z2D >> 2] = $141; //@line 6475
   } else {
    $165 = HEAP32[$10 + 24 >> 2] | 0; //@line 6478
    $167 = HEAP32[$10 + 12 >> 2] | 0; //@line 6480
    do {
     if (($167 | 0) == ($10 | 0)) {
      $179 = $10 + 16 | 0; //@line 6484
      $180 = $179 + 4 | 0; //@line 6485
      $181 = HEAP32[$180 >> 2] | 0; //@line 6486
      if (!$181) {
       $183 = HEAP32[$179 >> 2] | 0; //@line 6489
       if (!$183) {
        $$3398 = 0; //@line 6492
        break;
       } else {
        $$1396$ph = $183; //@line 6495
        $$1400$ph = $179; //@line 6495
       }
      } else {
       $$1396$ph = $181; //@line 6498
       $$1400$ph = $180; //@line 6498
      }
      $$1396 = $$1396$ph; //@line 6500
      $$1400 = $$1400$ph; //@line 6500
      while (1) {
       $185 = $$1396 + 20 | 0; //@line 6502
       $186 = HEAP32[$185 >> 2] | 0; //@line 6503
       if (!$186) {
        $188 = $$1396 + 16 | 0; //@line 6506
        $189 = HEAP32[$188 >> 2] | 0; //@line 6507
        if (!$189) {
         break;
        } else {
         $$1396$be = $189; //@line 6512
         $$1400$be = $188; //@line 6512
        }
       } else {
        $$1396$be = $186; //@line 6515
        $$1400$be = $185; //@line 6515
       }
       $$1396 = $$1396$be; //@line 6517
       $$1400 = $$1400$be; //@line 6517
      }
      if ((HEAP32[792] | 0) >>> 0 > $$1400 >>> 0) {
       _abort(); //@line 6522
      } else {
       HEAP32[$$1400 >> 2] = 0; //@line 6525
       $$3398 = $$1396; //@line 6526
       break;
      }
     } else {
      $170 = HEAP32[$10 + 8 >> 2] | 0; //@line 6531
      if ((HEAP32[792] | 0) >>> 0 > $170 >>> 0) {
       _abort(); //@line 6535
      }
      $173 = $170 + 12 | 0; //@line 6538
      if ((HEAP32[$173 >> 2] | 0) != ($10 | 0)) {
       _abort(); //@line 6542
      }
      $176 = $167 + 8 | 0; //@line 6545
      if ((HEAP32[$176 >> 2] | 0) == ($10 | 0)) {
       HEAP32[$173 >> 2] = $167; //@line 6549
       HEAP32[$176 >> 2] = $170; //@line 6550
       $$3398 = $167; //@line 6551
       break;
      } else {
       _abort(); //@line 6554
      }
     }
    } while (0);
    if ($165 | 0) {
     $195 = HEAP32[$10 + 28 >> 2] | 0; //@line 6562
     $196 = 3456 + ($195 << 2) | 0; //@line 6563
     do {
      if ((HEAP32[$196 >> 2] | 0) == ($10 | 0)) {
       HEAP32[$196 >> 2] = $$3398; //@line 6568
       if (!$$3398) {
        HEAP32[789] = HEAP32[789] & ~(1 << $195); //@line 6575
        break L111;
       }
      } else {
       if ((HEAP32[792] | 0) >>> 0 > $165 >>> 0) {
        _abort(); //@line 6582
       } else {
        $205 = $165 + 16 | 0; //@line 6585
        HEAP32[((HEAP32[$205 >> 2] | 0) == ($10 | 0) ? $205 : $165 + 20 | 0) >> 2] = $$3398; //@line 6590
        if (!$$3398) {
         break L111;
        } else {
         break;
        }
       }
      }
     } while (0);
     $210 = HEAP32[792] | 0; //@line 6600
     if ($210 >>> 0 > $$3398 >>> 0) {
      _abort(); //@line 6603
     }
     HEAP32[$$3398 + 24 >> 2] = $165; //@line 6607
     $213 = $10 + 16 | 0; //@line 6608
     $214 = HEAP32[$213 >> 2] | 0; //@line 6609
     do {
      if ($214 | 0) {
       if ($210 >>> 0 > $214 >>> 0) {
        _abort(); //@line 6615
       } else {
        HEAP32[$$3398 + 16 >> 2] = $214; //@line 6619
        HEAP32[$214 + 24 >> 2] = $$3398; //@line 6621
        break;
       }
      }
     } while (0);
     $220 = HEAP32[$213 + 4 >> 2] | 0; //@line 6627
     if ($220 | 0) {
      if ((HEAP32[792] | 0) >>> 0 > $220 >>> 0) {
       _abort(); //@line 6633
      } else {
       HEAP32[$$3398 + 20 >> 2] = $220; //@line 6637
       HEAP32[$220 + 24 >> 2] = $$3398; //@line 6639
       break;
      }
     }
    }
   }
  } while (0);
  HEAP32[$$1 + 4 >> 2] = $137 | 1; //@line 6648
  HEAP32[$114 + $137 >> 2] = $137; //@line 6650
  if (($$1 | 0) == (HEAP32[793] | 0)) {
   HEAP32[790] = $137; //@line 6654
   return;
  } else {
   $$2 = $137; //@line 6657
  }
 } else {
  HEAP32[$115 >> 2] = $116 & -2; //@line 6661
  HEAP32[$$1 + 4 >> 2] = $$1380 | 1; //@line 6664
  HEAP32[$114 + $$1380 >> 2] = $$1380; //@line 6666
  $$2 = $$1380; //@line 6667
 }
 $235 = $$2 >>> 3; //@line 6669
 if ($$2 >>> 0 < 256) {
  $238 = 3192 + ($235 << 1 << 2) | 0; //@line 6673
  $239 = HEAP32[788] | 0; //@line 6674
  $240 = 1 << $235; //@line 6675
  if (!($239 & $240)) {
   HEAP32[788] = $239 | $240; //@line 6680
   $$0401 = $238; //@line 6682
   $$pre$phiZ2D = $238 + 8 | 0; //@line 6682
  } else {
   $244 = $238 + 8 | 0; //@line 6684
   $245 = HEAP32[$244 >> 2] | 0; //@line 6685
   if ((HEAP32[792] | 0) >>> 0 > $245 >>> 0) {
    _abort(); //@line 6689
   } else {
    $$0401 = $245; //@line 6692
    $$pre$phiZ2D = $244; //@line 6692
   }
  }
  HEAP32[$$pre$phiZ2D >> 2] = $$1; //@line 6695
  HEAP32[$$0401 + 12 >> 2] = $$1; //@line 6697
  HEAP32[$$1 + 8 >> 2] = $$0401; //@line 6699
  HEAP32[$$1 + 12 >> 2] = $238; //@line 6701
  return;
 }
 $251 = $$2 >>> 8; //@line 6704
 if (!$251) {
  $$0394 = 0; //@line 6707
 } else {
  if ($$2 >>> 0 > 16777215) {
   $$0394 = 31; //@line 6711
  } else {
   $256 = ($251 + 1048320 | 0) >>> 16 & 8; //@line 6715
   $257 = $251 << $256; //@line 6716
   $260 = ($257 + 520192 | 0) >>> 16 & 4; //@line 6719
   $262 = $257 << $260; //@line 6721
   $265 = ($262 + 245760 | 0) >>> 16 & 2; //@line 6724
   $270 = 14 - ($260 | $256 | $265) + ($262 << $265 >>> 15) | 0; //@line 6729
   $$0394 = $$2 >>> ($270 + 7 | 0) & 1 | $270 << 1; //@line 6735
  }
 }
 $276 = 3456 + ($$0394 << 2) | 0; //@line 6738
 HEAP32[$$1 + 28 >> 2] = $$0394; //@line 6740
 HEAP32[$$1 + 20 >> 2] = 0; //@line 6743
 HEAP32[$$1 + 16 >> 2] = 0; //@line 6744
 $280 = HEAP32[789] | 0; //@line 6745
 $281 = 1 << $$0394; //@line 6746
 L197 : do {
  if (!($280 & $281)) {
   HEAP32[789] = $280 | $281; //@line 6752
   HEAP32[$276 >> 2] = $$1; //@line 6753
   HEAP32[$$1 + 24 >> 2] = $276; //@line 6755
   HEAP32[$$1 + 12 >> 2] = $$1; //@line 6757
   HEAP32[$$1 + 8 >> 2] = $$1; //@line 6759
  } else {
   $288 = HEAP32[$276 >> 2] | 0; //@line 6761
   L200 : do {
    if ((HEAP32[$288 + 4 >> 2] & -8 | 0) == ($$2 | 0)) {
     $$0382$lcssa = $288; //@line 6768
    } else {
     $$0381438 = $$2 << (($$0394 | 0) == 31 ? 0 : 25 - ($$0394 >>> 1) | 0); //@line 6775
     $$0382437 = $288; //@line 6775
     while (1) {
      $305 = $$0382437 + 16 + ($$0381438 >>> 31 << 2) | 0; //@line 6778
      $300 = HEAP32[$305 >> 2] | 0; //@line 6779
      if (!$300) {
       break;
      }
      if ((HEAP32[$300 + 4 >> 2] & -8 | 0) == ($$2 | 0)) {
       $$0382$lcssa = $300; //@line 6790
       break L200;
      } else {
       $$0381438 = $$0381438 << 1; //@line 6793
       $$0382437 = $300; //@line 6793
      }
     }
     if ((HEAP32[792] | 0) >>> 0 > $305 >>> 0) {
      _abort(); //@line 6799
     } else {
      HEAP32[$305 >> 2] = $$1; //@line 6802
      HEAP32[$$1 + 24 >> 2] = $$0382437; //@line 6804
      HEAP32[$$1 + 12 >> 2] = $$1; //@line 6806
      HEAP32[$$1 + 8 >> 2] = $$1; //@line 6808
      break L197;
     }
    }
   } while (0);
   $312 = $$0382$lcssa + 8 | 0; //@line 6813
   $313 = HEAP32[$312 >> 2] | 0; //@line 6814
   $314 = HEAP32[792] | 0; //@line 6815
   if ($314 >>> 0 <= $313 >>> 0 & $314 >>> 0 <= $$0382$lcssa >>> 0) {
    HEAP32[$313 + 12 >> 2] = $$1; //@line 6821
    HEAP32[$312 >> 2] = $$1; //@line 6822
    HEAP32[$$1 + 8 >> 2] = $313; //@line 6824
    HEAP32[$$1 + 12 >> 2] = $$0382$lcssa; //@line 6826
    HEAP32[$$1 + 24 >> 2] = 0; //@line 6828
    break;
   } else {
    _abort(); //@line 6831
   }
  }
 } while (0);
 $323 = (HEAP32[796] | 0) + -1 | 0; //@line 6837
 HEAP32[796] = $323; //@line 6838
 if ($323 | 0) {
  return;
 }
 $$0211$in$i = 3608; //@line 6843
 while (1) {
  $$0211$i = HEAP32[$$0211$in$i >> 2] | 0; //@line 6845
  if (!$$0211$i) {
   break;
  } else {
   $$0211$in$i = $$0211$i + 8 | 0; //@line 6851
  }
 }
 HEAP32[796] = -1; //@line 6854
 return;
}
function ___udivmoddi4($a$0, $a$1, $b$0, $b$1, $rem) {
 $a$0 = $a$0 | 0;
 $a$1 = $a$1 | 0;
 $b$0 = $b$0 | 0;
 $b$1 = $b$1 | 0;
 $rem = $rem | 0;
 var $n_sroa_0_0_extract_trunc = 0, $n_sroa_1_4_extract_shift$0 = 0, $n_sroa_1_4_extract_trunc = 0, $d_sroa_0_0_extract_trunc = 0, $d_sroa_1_4_extract_shift$0 = 0, $d_sroa_1_4_extract_trunc = 0, $4 = 0, $17 = 0, $37 = 0, $51 = 0, $57 = 0, $58 = 0, $66 = 0, $78 = 0, $88 = 0, $89 = 0, $91 = 0, $92 = 0, $95 = 0, $105 = 0, $119 = 0, $125 = 0, $126 = 0, $130 = 0, $q_sroa_1_1_ph = 0, $q_sroa_0_1_ph = 0, $r_sroa_1_1_ph = 0, $r_sroa_0_1_ph = 0, $sr_1_ph = 0, $d_sroa_0_0_insert_insert99$0 = 0, $d_sroa_0_0_insert_insert99$1 = 0, $137$0 = 0, $137$1 = 0, $carry_0203 = 0, $sr_1202 = 0, $r_sroa_0_1201 = 0, $r_sroa_1_1200 = 0, $q_sroa_0_1199 = 0, $q_sroa_1_1198 = 0, $r_sroa_0_0_insert_insert42$0 = 0, $r_sroa_0_0_insert_insert42$1 = 0, $150$1 = 0, $151$0 = 0, $carry_0_lcssa$0 = 0, $carry_0_lcssa$1 = 0, $r_sroa_0_1_lcssa = 0, $r_sroa_1_1_lcssa = 0, $q_sroa_0_1_lcssa = 0, $q_sroa_1_1_lcssa = 0, $q_sroa_0_0_insert_ext75$0 = 0, $q_sroa_0_0_insert_ext75$1 = 0, $_0$0 = 0, $_0$1 = 0, $q_sroa_1_1198$looptemp = 0;
 $n_sroa_0_0_extract_trunc = $a$0; //@line 6982
 $n_sroa_1_4_extract_shift$0 = $a$1; //@line 6983
 $n_sroa_1_4_extract_trunc = $n_sroa_1_4_extract_shift$0; //@line 6984
 $d_sroa_0_0_extract_trunc = $b$0; //@line 6985
 $d_sroa_1_4_extract_shift$0 = $b$1; //@line 6986
 $d_sroa_1_4_extract_trunc = $d_sroa_1_4_extract_shift$0; //@line 6987
 if (!$n_sroa_1_4_extract_trunc) {
  $4 = ($rem | 0) != 0; //@line 6989
  if (!$d_sroa_1_4_extract_trunc) {
   if ($4) {
    HEAP32[$rem >> 2] = ($n_sroa_0_0_extract_trunc >>> 0) % ($d_sroa_0_0_extract_trunc >>> 0); //@line 6992
    HEAP32[$rem + 4 >> 2] = 0; //@line 6993
   }
   $_0$1 = 0; //@line 6995
   $_0$0 = ($n_sroa_0_0_extract_trunc >>> 0) / ($d_sroa_0_0_extract_trunc >>> 0) >>> 0; //@line 6996
   return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 6997
  } else {
   if (!$4) {
    $_0$1 = 0; //@line 7000
    $_0$0 = 0; //@line 7001
    return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7002
   }
   HEAP32[$rem >> 2] = $a$0 | 0; //@line 7004
   HEAP32[$rem + 4 >> 2] = $a$1 & 0; //@line 7005
   $_0$1 = 0; //@line 7006
   $_0$0 = 0; //@line 7007
   return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7008
  }
 }
 $17 = ($d_sroa_1_4_extract_trunc | 0) == 0; //@line 7011
 do {
  if (!$d_sroa_0_0_extract_trunc) {
   if ($17) {
    if ($rem | 0) {
     HEAP32[$rem >> 2] = ($n_sroa_1_4_extract_trunc >>> 0) % ($d_sroa_0_0_extract_trunc >>> 0); //@line 7016
     HEAP32[$rem + 4 >> 2] = 0; //@line 7017
    }
    $_0$1 = 0; //@line 7019
    $_0$0 = ($n_sroa_1_4_extract_trunc >>> 0) / ($d_sroa_0_0_extract_trunc >>> 0) >>> 0; //@line 7020
    return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7021
   }
   if (!$n_sroa_0_0_extract_trunc) {
    if ($rem | 0) {
     HEAP32[$rem >> 2] = 0; //@line 7025
     HEAP32[$rem + 4 >> 2] = ($n_sroa_1_4_extract_trunc >>> 0) % ($d_sroa_1_4_extract_trunc >>> 0); //@line 7026
    }
    $_0$1 = 0; //@line 7028
    $_0$0 = ($n_sroa_1_4_extract_trunc >>> 0) / ($d_sroa_1_4_extract_trunc >>> 0) >>> 0; //@line 7029
    return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7030
   }
   $37 = $d_sroa_1_4_extract_trunc - 1 | 0; //@line 7032
   if (!($37 & $d_sroa_1_4_extract_trunc)) {
    if ($rem | 0) {
     HEAP32[$rem >> 2] = $a$0 | 0; //@line 7035
     HEAP32[$rem + 4 >> 2] = $37 & $n_sroa_1_4_extract_trunc | $a$1 & 0; //@line 7036
    }
    $_0$1 = 0; //@line 7038
    $_0$0 = $n_sroa_1_4_extract_trunc >>> ((_llvm_cttz_i32($d_sroa_1_4_extract_trunc | 0) | 0) >>> 0); //@line 7039
    return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7040
   }
   $51 = (Math_clz32($d_sroa_1_4_extract_trunc | 0) | 0) - (Math_clz32($n_sroa_1_4_extract_trunc | 0) | 0) | 0; //@line 7043
   if ($51 >>> 0 <= 30) {
    $57 = $51 + 1 | 0; //@line 7045
    $58 = 31 - $51 | 0; //@line 7046
    $sr_1_ph = $57; //@line 7047
    $r_sroa_0_1_ph = $n_sroa_1_4_extract_trunc << $58 | $n_sroa_0_0_extract_trunc >>> ($57 >>> 0); //@line 7048
    $r_sroa_1_1_ph = $n_sroa_1_4_extract_trunc >>> ($57 >>> 0); //@line 7049
    $q_sroa_0_1_ph = 0; //@line 7050
    $q_sroa_1_1_ph = $n_sroa_0_0_extract_trunc << $58; //@line 7051
    break;
   }
   if (!$rem) {
    $_0$1 = 0; //@line 7055
    $_0$0 = 0; //@line 7056
    return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7057
   }
   HEAP32[$rem >> 2] = $a$0 | 0; //@line 7059
   HEAP32[$rem + 4 >> 2] = $n_sroa_1_4_extract_shift$0 | $a$1 & 0; //@line 7060
   $_0$1 = 0; //@line 7061
   $_0$0 = 0; //@line 7062
   return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7063
  } else {
   if (!$17) {
    $119 = (Math_clz32($d_sroa_1_4_extract_trunc | 0) | 0) - (Math_clz32($n_sroa_1_4_extract_trunc | 0) | 0) | 0; //@line 7067
    if ($119 >>> 0 <= 31) {
     $125 = $119 + 1 | 0; //@line 7069
     $126 = 31 - $119 | 0; //@line 7070
     $130 = $119 - 31 >> 31; //@line 7071
     $sr_1_ph = $125; //@line 7072
     $r_sroa_0_1_ph = $n_sroa_0_0_extract_trunc >>> ($125 >>> 0) & $130 | $n_sroa_1_4_extract_trunc << $126; //@line 7073
     $r_sroa_1_1_ph = $n_sroa_1_4_extract_trunc >>> ($125 >>> 0) & $130; //@line 7074
     $q_sroa_0_1_ph = 0; //@line 7075
     $q_sroa_1_1_ph = $n_sroa_0_0_extract_trunc << $126; //@line 7076
     break;
    }
    if (!$rem) {
     $_0$1 = 0; //@line 7080
     $_0$0 = 0; //@line 7081
     return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7082
    }
    HEAP32[$rem >> 2] = $a$0 | 0; //@line 7084
    HEAP32[$rem + 4 >> 2] = $n_sroa_1_4_extract_shift$0 | $a$1 & 0; //@line 7085
    $_0$1 = 0; //@line 7086
    $_0$0 = 0; //@line 7087
    return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7088
   }
   $66 = $d_sroa_0_0_extract_trunc - 1 | 0; //@line 7090
   if ($66 & $d_sroa_0_0_extract_trunc | 0) {
    $88 = (Math_clz32($d_sroa_0_0_extract_trunc | 0) | 0) + 33 - (Math_clz32($n_sroa_1_4_extract_trunc | 0) | 0) | 0; //@line 7093
    $89 = 64 - $88 | 0; //@line 7094
    $91 = 32 - $88 | 0; //@line 7095
    $92 = $91 >> 31; //@line 7096
    $95 = $88 - 32 | 0; //@line 7097
    $105 = $95 >> 31; //@line 7098
    $sr_1_ph = $88; //@line 7099
    $r_sroa_0_1_ph = $91 - 1 >> 31 & $n_sroa_1_4_extract_trunc >>> ($95 >>> 0) | ($n_sroa_1_4_extract_trunc << $91 | $n_sroa_0_0_extract_trunc >>> ($88 >>> 0)) & $105; //@line 7100
    $r_sroa_1_1_ph = $105 & $n_sroa_1_4_extract_trunc >>> ($88 >>> 0); //@line 7101
    $q_sroa_0_1_ph = $n_sroa_0_0_extract_trunc << $89 & $92; //@line 7102
    $q_sroa_1_1_ph = ($n_sroa_1_4_extract_trunc << $89 | $n_sroa_0_0_extract_trunc >>> ($95 >>> 0)) & $92 | $n_sroa_0_0_extract_trunc << $91 & $88 - 33 >> 31; //@line 7103
    break;
   }
   if ($rem | 0) {
    HEAP32[$rem >> 2] = $66 & $n_sroa_0_0_extract_trunc; //@line 7107
    HEAP32[$rem + 4 >> 2] = 0; //@line 7108
   }
   if (($d_sroa_0_0_extract_trunc | 0) == 1) {
    $_0$1 = $n_sroa_1_4_extract_shift$0 | $a$1 & 0; //@line 7111
    $_0$0 = $a$0 | 0 | 0; //@line 7112
    return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7113
   } else {
    $78 = _llvm_cttz_i32($d_sroa_0_0_extract_trunc | 0) | 0; //@line 7115
    $_0$1 = $n_sroa_1_4_extract_trunc >>> ($78 >>> 0) | 0; //@line 7116
    $_0$0 = $n_sroa_1_4_extract_trunc << 32 - $78 | $n_sroa_0_0_extract_trunc >>> ($78 >>> 0) | 0; //@line 7117
    return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7118
   }
  }
 } while (0);
 if (!$sr_1_ph) {
  $q_sroa_1_1_lcssa = $q_sroa_1_1_ph; //@line 7123
  $q_sroa_0_1_lcssa = $q_sroa_0_1_ph; //@line 7124
  $r_sroa_1_1_lcssa = $r_sroa_1_1_ph; //@line 7125
  $r_sroa_0_1_lcssa = $r_sroa_0_1_ph; //@line 7126
  $carry_0_lcssa$1 = 0; //@line 7127
  $carry_0_lcssa$0 = 0; //@line 7128
 } else {
  $d_sroa_0_0_insert_insert99$0 = $b$0 | 0 | 0; //@line 7130
  $d_sroa_0_0_insert_insert99$1 = $d_sroa_1_4_extract_shift$0 | $b$1 & 0; //@line 7131
  $137$0 = _i64Add($d_sroa_0_0_insert_insert99$0 | 0, $d_sroa_0_0_insert_insert99$1 | 0, -1, -1) | 0; //@line 7132
  $137$1 = getTempRet0() | 0; //@line 7133
  $q_sroa_1_1198 = $q_sroa_1_1_ph; //@line 7134
  $q_sroa_0_1199 = $q_sroa_0_1_ph; //@line 7135
  $r_sroa_1_1200 = $r_sroa_1_1_ph; //@line 7136
  $r_sroa_0_1201 = $r_sroa_0_1_ph; //@line 7137
  $sr_1202 = $sr_1_ph; //@line 7138
  $carry_0203 = 0; //@line 7139
  do {
   $q_sroa_1_1198$looptemp = $q_sroa_1_1198;
   $q_sroa_1_1198 = $q_sroa_0_1199 >>> 31 | $q_sroa_1_1198 << 1; //@line 7141
   $q_sroa_0_1199 = $carry_0203 | $q_sroa_0_1199 << 1; //@line 7142
   $r_sroa_0_0_insert_insert42$0 = $r_sroa_0_1201 << 1 | $q_sroa_1_1198$looptemp >>> 31 | 0; //@line 7143
   $r_sroa_0_0_insert_insert42$1 = $r_sroa_0_1201 >>> 31 | $r_sroa_1_1200 << 1 | 0; //@line 7144
   _i64Subtract($137$0 | 0, $137$1 | 0, $r_sroa_0_0_insert_insert42$0 | 0, $r_sroa_0_0_insert_insert42$1 | 0) | 0; //@line 7145
   $150$1 = getTempRet0() | 0; //@line 7146
   $151$0 = $150$1 >> 31 | (($150$1 | 0) < 0 ? -1 : 0) << 1; //@line 7147
   $carry_0203 = $151$0 & 1; //@line 7148
   $r_sroa_0_1201 = _i64Subtract($r_sroa_0_0_insert_insert42$0 | 0, $r_sroa_0_0_insert_insert42$1 | 0, $151$0 & $d_sroa_0_0_insert_insert99$0 | 0, ((($150$1 | 0) < 0 ? -1 : 0) >> 31 | (($150$1 | 0) < 0 ? -1 : 0) << 1) & $d_sroa_0_0_insert_insert99$1 | 0) | 0; //@line 7150
   $r_sroa_1_1200 = getTempRet0() | 0; //@line 7151
   $sr_1202 = $sr_1202 - 1 | 0; //@line 7152
  } while (($sr_1202 | 0) != 0);
  $q_sroa_1_1_lcssa = $q_sroa_1_1198; //@line 7164
  $q_sroa_0_1_lcssa = $q_sroa_0_1199; //@line 7165
  $r_sroa_1_1_lcssa = $r_sroa_1_1200; //@line 7166
  $r_sroa_0_1_lcssa = $r_sroa_0_1201; //@line 7167
  $carry_0_lcssa$1 = 0; //@line 7168
  $carry_0_lcssa$0 = $carry_0203; //@line 7169
 }
 $q_sroa_0_0_insert_ext75$0 = $q_sroa_0_1_lcssa; //@line 7171
 $q_sroa_0_0_insert_ext75$1 = 0; //@line 7172
 if ($rem | 0) {
  HEAP32[$rem >> 2] = $r_sroa_0_1_lcssa; //@line 7175
  HEAP32[$rem + 4 >> 2] = $r_sroa_1_1_lcssa; //@line 7176
 }
 $_0$1 = ($q_sroa_0_0_insert_ext75$0 | 0) >>> 31 | ($q_sroa_1_1_lcssa | $q_sroa_0_0_insert_ext75$1) << 1 | ($q_sroa_0_0_insert_ext75$1 << 1 | $q_sroa_0_0_insert_ext75$0 >>> 31) & 0 | $carry_0_lcssa$1; //@line 7178
 $_0$0 = ($q_sroa_0_0_insert_ext75$0 << 1 | 0 >>> 31) & -2 | $carry_0_lcssa$0; //@line 7179
 return (setTempRet0($_0$1 | 0), $_0$0) | 0; //@line 7180
}
function _pop_arg_658($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $10 = 0, $108 = 0, $109 = 0.0, $115 = 0, $116 = 0.0, $16 = 0, $17 = 0, $20 = 0, $29 = 0, $30 = 0, $31 = 0, $40 = 0, $41 = 0, $43 = 0, $46 = 0, $47 = 0, $56 = 0, $57 = 0, $59 = 0, $62 = 0, $71 = 0, $72 = 0, $73 = 0, $82 = 0, $83 = 0, $85 = 0, $88 = 0, $9 = 0, $97 = 0, $98 = 0, $99 = 0;
 L1 : do {
  if ($1 >>> 0 <= 20) {
   do {
    switch ($1 | 0) {
    case 9:
     {
      $9 = (HEAP32[$2 >> 2] | 0) + (4 - 1) & ~(4 - 1); //@line 2041
      $10 = HEAP32[$9 >> 2] | 0; //@line 2042
      HEAP32[$2 >> 2] = $9 + 4; //@line 2044
      HEAP32[$0 >> 2] = $10; //@line 2045
      break L1;
      break;
     }
    case 10:
     {
      $16 = (HEAP32[$2 >> 2] | 0) + (4 - 1) & ~(4 - 1); //@line 2061
      $17 = HEAP32[$16 >> 2] | 0; //@line 2062
      HEAP32[$2 >> 2] = $16 + 4; //@line 2064
      $20 = $0; //@line 2067
      HEAP32[$20 >> 2] = $17; //@line 2069
      HEAP32[$20 + 4 >> 2] = (($17 | 0) < 0) << 31 >> 31; //@line 2072
      break L1;
      break;
     }
    case 11:
     {
      $29 = (HEAP32[$2 >> 2] | 0) + (4 - 1) & ~(4 - 1); //@line 2088
      $30 = HEAP32[$29 >> 2] | 0; //@line 2089
      HEAP32[$2 >> 2] = $29 + 4; //@line 2091
      $31 = $0; //@line 2092
      HEAP32[$31 >> 2] = $30; //@line 2094
      HEAP32[$31 + 4 >> 2] = 0; //@line 2097
      break L1;
      break;
     }
    case 12:
     {
      $40 = (HEAP32[$2 >> 2] | 0) + (8 - 1) & ~(8 - 1); //@line 2113
      $41 = $40; //@line 2114
      $43 = HEAP32[$41 >> 2] | 0; //@line 2116
      $46 = HEAP32[$41 + 4 >> 2] | 0; //@line 2119
      HEAP32[$2 >> 2] = $40 + 8; //@line 2121
      $47 = $0; //@line 2122
      HEAP32[$47 >> 2] = $43; //@line 2124
      HEAP32[$47 + 4 >> 2] = $46; //@line 2127
      break L1;
      break;
     }
    case 13:
     {
      $56 = (HEAP32[$2 >> 2] | 0) + (4 - 1) & ~(4 - 1); //@line 2143
      $57 = HEAP32[$56 >> 2] | 0; //@line 2144
      HEAP32[$2 >> 2] = $56 + 4; //@line 2146
      $59 = ($57 & 65535) << 16 >> 16; //@line 2148
      $62 = $0; //@line 2151
      HEAP32[$62 >> 2] = $59; //@line 2153
      HEAP32[$62 + 4 >> 2] = (($59 | 0) < 0) << 31 >> 31; //@line 2156
      break L1;
      break;
     }
    case 14:
     {
      $71 = (HEAP32[$2 >> 2] | 0) + (4 - 1) & ~(4 - 1); //@line 2172
      $72 = HEAP32[$71 >> 2] | 0; //@line 2173
      HEAP32[$2 >> 2] = $71 + 4; //@line 2175
      $73 = $0; //@line 2177
      HEAP32[$73 >> 2] = $72 & 65535; //@line 2179
      HEAP32[$73 + 4 >> 2] = 0; //@line 2182
      break L1;
      break;
     }
    case 15:
     {
      $82 = (HEAP32[$2 >> 2] | 0) + (4 - 1) & ~(4 - 1); //@line 2198
      $83 = HEAP32[$82 >> 2] | 0; //@line 2199
      HEAP32[$2 >> 2] = $82 + 4; //@line 2201
      $85 = ($83 & 255) << 24 >> 24; //@line 2203
      $88 = $0; //@line 2206
      HEAP32[$88 >> 2] = $85; //@line 2208
      HEAP32[$88 + 4 >> 2] = (($85 | 0) < 0) << 31 >> 31; //@line 2211
      break L1;
      break;
     }
    case 16:
     {
      $97 = (HEAP32[$2 >> 2] | 0) + (4 - 1) & ~(4 - 1); //@line 2227
      $98 = HEAP32[$97 >> 2] | 0; //@line 2228
      HEAP32[$2 >> 2] = $97 + 4; //@line 2230
      $99 = $0; //@line 2232
      HEAP32[$99 >> 2] = $98 & 255; //@line 2234
      HEAP32[$99 + 4 >> 2] = 0; //@line 2237
      break L1;
      break;
     }
    case 17:
     {
      $108 = (HEAP32[$2 >> 2] | 0) + (8 - 1) & ~(8 - 1); //@line 2253
      $109 = +HEAPF64[$108 >> 3]; //@line 2254
      HEAP32[$2 >> 2] = $108 + 8; //@line 2256
      HEAPF64[$0 >> 3] = $109; //@line 2257
      break L1;
      break;
     }
    case 18:
     {
      $115 = (HEAP32[$2 >> 2] | 0) + (8 - 1) & ~(8 - 1); //@line 2273
      $116 = +HEAPF64[$115 >> 3]; //@line 2274
      HEAP32[$2 >> 2] = $115 + 8; //@line 2276
      HEAPF64[$0 >> 3] = $116; //@line 2277
      break L1;
      break;
     }
    default:
     {
      break L1;
     }
    }
   } while (0);
  }
 } while (0);
 return;
}
function _memchr($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $$0$lcssa = 0, $$035$lcssa = 0, $$035$lcssa65 = 0, $$03555 = 0, $$036$lcssa = 0, $$036$lcssa64 = 0, $$03654 = 0, $$046 = 0, $$137$lcssa = 0, $$137$lcssa66 = 0, $$13745 = 0, $$140 = 0, $$23839 = 0, $$in = 0, $$lcssa = 0, $11 = 0, $12 = 0, $16 = 0, $18 = 0, $20 = 0, $23 = 0, $29 = 0, $3 = 0, $30 = 0, $39 = 0, $7 = 0, $8 = 0, label = 0;
 $3 = $1 & 255; //@line 857
 $7 = ($2 | 0) != 0; //@line 861
 L1 : do {
  if ($7 & ($0 & 3 | 0) != 0) {
   $8 = $1 & 255; //@line 865
   $$03555 = $0; //@line 866
   $$03654 = $2; //@line 866
   while (1) {
    if ((HEAP8[$$03555 >> 0] | 0) == $8 << 24 >> 24) {
     $$035$lcssa65 = $$03555; //@line 871
     $$036$lcssa64 = $$03654; //@line 871
     label = 6; //@line 872
     break L1;
    }
    $11 = $$03555 + 1 | 0; //@line 875
    $12 = $$03654 + -1 | 0; //@line 876
    $16 = ($12 | 0) != 0; //@line 880
    if ($16 & ($11 & 3 | 0) != 0) {
     $$03555 = $11; //@line 883
     $$03654 = $12; //@line 883
    } else {
     $$035$lcssa = $11; //@line 885
     $$036$lcssa = $12; //@line 885
     $$lcssa = $16; //@line 885
     label = 5; //@line 886
     break;
    }
   }
  } else {
   $$035$lcssa = $0; //@line 891
   $$036$lcssa = $2; //@line 891
   $$lcssa = $7; //@line 891
   label = 5; //@line 892
  }
 } while (0);
 if ((label | 0) == 5) {
  if ($$lcssa) {
   $$035$lcssa65 = $$035$lcssa; //@line 897
   $$036$lcssa64 = $$036$lcssa; //@line 897
   label = 6; //@line 898
  } else {
   label = 16; //@line 900
  }
 }
 L8 : do {
  if ((label | 0) == 6) {
   $18 = $1 & 255; //@line 906
   if ((HEAP8[$$035$lcssa65 >> 0] | 0) == $18 << 24 >> 24) {
    if (!$$036$lcssa64) {
     label = 16; //@line 911
     break;
    } else {
     $39 = $$035$lcssa65; //@line 914
     break;
    }
   }
   $20 = Math_imul($3, 16843009) | 0; //@line 918
   L13 : do {
    if ($$036$lcssa64 >>> 0 > 3) {
     $$046 = $$035$lcssa65; //@line 922
     $$13745 = $$036$lcssa64; //@line 922
     while (1) {
      $23 = HEAP32[$$046 >> 2] ^ $20; //@line 925
      if (($23 & -2139062144 ^ -2139062144) & $23 + -16843009 | 0) {
       $$137$lcssa66 = $$13745; //@line 932
       $$in = $$046; //@line 932
       break L13;
      }
      $29 = $$046 + 4 | 0; //@line 935
      $30 = $$13745 + -4 | 0; //@line 936
      if ($30 >>> 0 > 3) {
       $$046 = $29; //@line 939
       $$13745 = $30; //@line 939
      } else {
       $$0$lcssa = $29; //@line 941
       $$137$lcssa = $30; //@line 941
       label = 11; //@line 942
       break;
      }
     }
    } else {
     $$0$lcssa = $$035$lcssa65; //@line 947
     $$137$lcssa = $$036$lcssa64; //@line 947
     label = 11; //@line 948
    }
   } while (0);
   if ((label | 0) == 11) {
    if (!$$137$lcssa) {
     label = 16; //@line 954
     break;
    } else {
     $$137$lcssa66 = $$137$lcssa; //@line 957
     $$in = $$0$lcssa; //@line 957
    }
   }
   $$140 = $$in; //@line 960
   $$23839 = $$137$lcssa66; //@line 960
   while (1) {
    if ((HEAP8[$$140 >> 0] | 0) == $18 << 24 >> 24) {
     $39 = $$140; //@line 965
     break L8;
    }
    $$23839 = $$23839 + -1 | 0; //@line 969
    if (!$$23839) {
     label = 16; //@line 972
     break;
    } else {
     $$140 = $$140 + 1 | 0; //@line 975
    }
   }
  }
 } while (0);
 if ((label | 0) == 16) {
  $39 = 0; //@line 981
 }
 return $39 | 0; //@line 983
}
function ___stdio_write($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $$0 = 0, $$04756 = 0, $$04855 = 0, $$04954 = 0, $$051 = 0, $$1 = 0, $$150 = 0, $12 = 0, $13 = 0, $17 = 0, $20 = 0, $25 = 0, $27 = 0, $3 = 0, $37 = 0, $38 = 0, $4 = 0, $44 = 0, $5 = 0, $7 = 0, $9 = 0, $vararg_buffer = 0, $vararg_buffer3 = 0, label = 0, sp = 0;
 sp = STACKTOP; //@line 312
 STACKTOP = STACKTOP + 48 | 0; //@line 313
 $vararg_buffer3 = sp + 32 | 0; //@line 314
 $vararg_buffer = sp + 16 | 0; //@line 315
 $3 = sp; //@line 316
 $4 = $0 + 28 | 0; //@line 317
 $5 = HEAP32[$4 >> 2] | 0; //@line 318
 HEAP32[$3 >> 2] = $5; //@line 319
 $7 = $0 + 20 | 0; //@line 321
 $9 = (HEAP32[$7 >> 2] | 0) - $5 | 0; //@line 323
 HEAP32[$3 + 4 >> 2] = $9; //@line 324
 HEAP32[$3 + 8 >> 2] = $1; //@line 326
 HEAP32[$3 + 12 >> 2] = $2; //@line 328
 $12 = $9 + $2 | 0; //@line 329
 $13 = $0 + 60 | 0; //@line 330
 HEAP32[$vararg_buffer >> 2] = HEAP32[$13 >> 2]; //@line 333
 HEAP32[$vararg_buffer + 4 >> 2] = $3; //@line 335
 HEAP32[$vararg_buffer + 8 >> 2] = 2; //@line 337
 $17 = ___syscall_ret(___syscall146(146, $vararg_buffer | 0) | 0) | 0; //@line 339
 L1 : do {
  if (($12 | 0) == ($17 | 0)) {
   label = 3; //@line 343
  } else {
   $$04756 = 2; //@line 345
   $$04855 = $12; //@line 345
   $$04954 = $3; //@line 345
   $27 = $17; //@line 345
   while (1) {
    if (($27 | 0) < 0) {
     break;
    }
    $$04855 = $$04855 - $27 | 0; //@line 351
    $37 = HEAP32[$$04954 + 4 >> 2] | 0; //@line 353
    $38 = $27 >>> 0 > $37 >>> 0; //@line 354
    $$150 = $38 ? $$04954 + 8 | 0 : $$04954; //@line 356
    $$1 = $$04756 + ($38 << 31 >> 31) | 0; //@line 358
    $$0 = $27 - ($38 ? $37 : 0) | 0; //@line 360
    HEAP32[$$150 >> 2] = (HEAP32[$$150 >> 2] | 0) + $$0; //@line 363
    $44 = $$150 + 4 | 0; //@line 364
    HEAP32[$44 >> 2] = (HEAP32[$44 >> 2] | 0) - $$0; //@line 367
    HEAP32[$vararg_buffer3 >> 2] = HEAP32[$13 >> 2]; //@line 370
    HEAP32[$vararg_buffer3 + 4 >> 2] = $$150; //@line 372
    HEAP32[$vararg_buffer3 + 8 >> 2] = $$1; //@line 374
    $27 = ___syscall_ret(___syscall146(146, $vararg_buffer3 | 0) | 0) | 0; //@line 376
    if (($$04855 | 0) == ($27 | 0)) {
     label = 3; //@line 379
     break L1;
    } else {
     $$04756 = $$1; //@line 382
     $$04954 = $$150; //@line 382
    }
   }
   HEAP32[$0 + 16 >> 2] = 0; //@line 386
   HEAP32[$4 >> 2] = 0; //@line 387
   HEAP32[$7 >> 2] = 0; //@line 388
   HEAP32[$0 >> 2] = HEAP32[$0 >> 2] | 32; //@line 391
   if (($$04756 | 0) == 2) {
    $$051 = 0; //@line 394
   } else {
    $$051 = $2 - (HEAP32[$$04954 + 4 >> 2] | 0) | 0; //@line 399
   }
  }
 } while (0);
 if ((label | 0) == 3) {
  $20 = HEAP32[$0 + 44 >> 2] | 0; //@line 405
  HEAP32[$0 + 16 >> 2] = $20 + (HEAP32[$0 + 48 >> 2] | 0); //@line 410
  $25 = $20; //@line 411
  HEAP32[$4 >> 2] = $25; //@line 412
  HEAP32[$7 >> 2] = $25; //@line 413
  $$051 = $2; //@line 414
 }
 STACKTOP = sp; //@line 416
 return $$051 | 0; //@line 416
}
function _memcpy(dest, src, num) {
 dest = dest | 0;
 src = src | 0;
 num = num | 0;
 var ret = 0, aligned_dest_end = 0, block_aligned_dest_end = 0, dest_end = 0;
 if ((num | 0) >= 8192) {
  _emscripten_memcpy_big(dest | 0, src | 0, num | 0) | 0; //@line 7221
  return dest | 0; //@line 7222
 }
 ret = dest | 0; //@line 7225
 dest_end = dest + num | 0; //@line 7226
 if ((dest & 3) == (src & 3)) {
  while (dest & 3) {
   if (!num) return ret | 0; //@line 7230
   HEAP8[dest >> 0] = HEAP8[src >> 0] | 0; //@line 7231
   dest = dest + 1 | 0; //@line 7232
   src = src + 1 | 0; //@line 7233
   num = num - 1 | 0; //@line 7234
  }
  aligned_dest_end = dest_end & -4 | 0; //@line 7236
  block_aligned_dest_end = aligned_dest_end - 64 | 0; //@line 7237
  while ((dest | 0) <= (block_aligned_dest_end | 0)) {
   HEAP32[dest >> 2] = HEAP32[src >> 2]; //@line 7239
   HEAP32[dest + 4 >> 2] = HEAP32[src + 4 >> 2]; //@line 7240
   HEAP32[dest + 8 >> 2] = HEAP32[src + 8 >> 2]; //@line 7241
   HEAP32[dest + 12 >> 2] = HEAP32[src + 12 >> 2]; //@line 7242
   HEAP32[dest + 16 >> 2] = HEAP32[src + 16 >> 2]; //@line 7243
   HEAP32[dest + 20 >> 2] = HEAP32[src + 20 >> 2]; //@line 7244
   HEAP32[dest + 24 >> 2] = HEAP32[src + 24 >> 2]; //@line 7245
   HEAP32[dest + 28 >> 2] = HEAP32[src + 28 >> 2]; //@line 7246
   HEAP32[dest + 32 >> 2] = HEAP32[src + 32 >> 2]; //@line 7247
   HEAP32[dest + 36 >> 2] = HEAP32[src + 36 >> 2]; //@line 7248
   HEAP32[dest + 40 >> 2] = HEAP32[src + 40 >> 2]; //@line 7249
   HEAP32[dest + 44 >> 2] = HEAP32[src + 44 >> 2]; //@line 7250
   HEAP32[dest + 48 >> 2] = HEAP32[src + 48 >> 2]; //@line 7251
   HEAP32[dest + 52 >> 2] = HEAP32[src + 52 >> 2]; //@line 7252
   HEAP32[dest + 56 >> 2] = HEAP32[src + 56 >> 2]; //@line 7253
   HEAP32[dest + 60 >> 2] = HEAP32[src + 60 >> 2]; //@line 7254
   dest = dest + 64 | 0; //@line 7255
   src = src + 64 | 0; //@line 7256
  }
  while ((dest | 0) < (aligned_dest_end | 0)) {
   HEAP32[dest >> 2] = HEAP32[src >> 2]; //@line 7259
   dest = dest + 4 | 0; //@line 7260
   src = src + 4 | 0; //@line 7261
  }
 } else {
  aligned_dest_end = dest_end - 4 | 0; //@line 7265
  while ((dest | 0) < (aligned_dest_end | 0)) {
   HEAP8[dest >> 0] = HEAP8[src >> 0] | 0; //@line 7267
   HEAP8[dest + 1 >> 0] = HEAP8[src + 1 >> 0] | 0; //@line 7268
   HEAP8[dest + 2 >> 0] = HEAP8[src + 2 >> 0] | 0; //@line 7269
   HEAP8[dest + 3 >> 0] = HEAP8[src + 3 >> 0] | 0; //@line 7270
   dest = dest + 4 | 0; //@line 7271
   src = src + 4 | 0; //@line 7272
  }
 }
 while ((dest | 0) < (dest_end | 0)) {
  HEAP8[dest >> 0] = HEAP8[src >> 0] | 0; //@line 7277
  dest = dest + 1 | 0; //@line 7278
  src = src + 1 | 0; //@line 7279
 }
 return ret | 0; //@line 7281
}
function _vfprintf($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $$0 = 0, $$1 = 0, $13 = 0, $14 = 0, $19 = 0, $23 = 0, $24 = 0, $25 = 0, $26 = 0, $28 = 0, $29 = 0, $3 = 0, $35 = 0, $4 = 0, $40 = 0, $5 = 0, $6 = 0, $spec$select = 0, dest = 0, sp = 0, stop = 0;
 sp = STACKTOP; //@line 992
 STACKTOP = STACKTOP + 224 | 0; //@line 993
 $3 = sp + 208 | 0; //@line 994
 $4 = sp + 160 | 0; //@line 995
 $5 = sp + 80 | 0; //@line 996
 $6 = sp; //@line 997
 dest = $4; //@line 998
 stop = dest + 40 | 0; //@line 998
 do {
  HEAP32[dest >> 2] = 0; //@line 998
  dest = dest + 4 | 0; //@line 998
 } while ((dest | 0) < (stop | 0));
 HEAP32[$3 >> 2] = HEAP32[$2 >> 2]; //@line 1000
 if ((_printf_core(0, $1, $3, $5, $4) | 0) < 0) {
  $$0 = -1; //@line 1004
 } else {
  if ((HEAP32[$0 + 76 >> 2] | 0) > -1) {
   $40 = ___lockfile($0) | 0; //@line 1011
  } else {
   $40 = 0; //@line 1013
  }
  $13 = HEAP32[$0 >> 2] | 0; //@line 1015
  $14 = $13 & 32; //@line 1016
  if ((HEAP8[$0 + 74 >> 0] | 0) < 1) {
   HEAP32[$0 >> 2] = $13 & -33; //@line 1022
  }
  $19 = $0 + 48 | 0; //@line 1024
  if (!(HEAP32[$19 >> 2] | 0)) {
   $23 = $0 + 44 | 0; //@line 1028
   $24 = HEAP32[$23 >> 2] | 0; //@line 1029
   HEAP32[$23 >> 2] = $6; //@line 1030
   $25 = $0 + 28 | 0; //@line 1031
   HEAP32[$25 >> 2] = $6; //@line 1032
   $26 = $0 + 20 | 0; //@line 1033
   HEAP32[$26 >> 2] = $6; //@line 1034
   HEAP32[$19 >> 2] = 80; //@line 1035
   $28 = $0 + 16 | 0; //@line 1037
   HEAP32[$28 >> 2] = $6 + 80; //@line 1038
   $29 = _printf_core($0, $1, $3, $5, $4) | 0; //@line 1039
   if (!$24) {
    $$1 = $29; //@line 1042
   } else {
    FUNCTION_TABLE_iiii[HEAP32[$0 + 36 >> 2] & 3]($0, 0, 0) | 0; //@line 1046
    $spec$select = (HEAP32[$26 >> 2] | 0) == 0 ? -1 : $29; //@line 1049
    HEAP32[$23 >> 2] = $24; //@line 1050
    HEAP32[$19 >> 2] = 0; //@line 1051
    HEAP32[$28 >> 2] = 0; //@line 1052
    HEAP32[$25 >> 2] = 0; //@line 1053
    HEAP32[$26 >> 2] = 0; //@line 1054
    $$1 = $spec$select; //@line 1055
   }
  } else {
   $$1 = _printf_core($0, $1, $3, $5, $4) | 0; //@line 1059
  }
  $35 = HEAP32[$0 >> 2] | 0; //@line 1061
  HEAP32[$0 >> 2] = $35 | $14; //@line 1066
  if ($40 | 0) {
   ___unlockfile($0); //@line 1069
  }
  $$0 = ($35 & 32 | 0) == 0 ? $$1 : -1; //@line 1071
 }
 STACKTOP = sp; //@line 1073
 return $$0 | 0; //@line 1073
}
function ___fwritex($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $$03846 = 0, $$1 = 0, $$139 = 0, $$141 = 0, $$143 = 0, $10 = 0, $12 = 0, $14 = 0, $23 = 0, $29 = 0, $3 = 0, $32 = 0, $4 = 0, $9 = 0, label = 0;
 $3 = $2 + 16 | 0; //@line 767
 $4 = HEAP32[$3 >> 2] | 0; //@line 768
 if (!$4) {
  if (!(___towrite($2) | 0)) {
   $12 = HEAP32[$3 >> 2] | 0; //@line 775
   label = 5; //@line 776
  } else {
   $$1 = 0; //@line 778
  }
 } else {
  $12 = $4; //@line 782
  label = 5; //@line 783
 }
 L5 : do {
  if ((label | 0) == 5) {
   $9 = $2 + 20 | 0; //@line 787
   $10 = HEAP32[$9 >> 2] | 0; //@line 788
   $14 = $10; //@line 791
   if (($12 - $10 | 0) >>> 0 < $1 >>> 0) {
    $$1 = FUNCTION_TABLE_iiii[HEAP32[$2 + 36 >> 2] & 3]($2, $0, $1) | 0; //@line 796
    break;
   }
   L10 : do {
    if ((HEAP8[$2 + 75 >> 0] | 0) < 0 | ($1 | 0) == 0) {
     $$139 = 0; //@line 806
     $$141 = $0; //@line 806
     $$143 = $1; //@line 806
     $32 = $14; //@line 806
    } else {
     $$03846 = $1; //@line 808
     while (1) {
      $23 = $$03846 + -1 | 0; //@line 810
      if ((HEAP8[$0 + $23 >> 0] | 0) == 10) {
       break;
      }
      if (!$23) {
       $$139 = 0; //@line 819
       $$141 = $0; //@line 819
       $$143 = $1; //@line 819
       $32 = $14; //@line 819
       break L10;
      } else {
       $$03846 = $23; //@line 822
      }
     }
     $29 = FUNCTION_TABLE_iiii[HEAP32[$2 + 36 >> 2] & 3]($2, $0, $$03846) | 0; //@line 827
     if ($29 >>> 0 < $$03846 >>> 0) {
      $$1 = $29; //@line 830
      break L5;
     }
     $$139 = $$03846; //@line 836
     $$141 = $0 + $$03846 | 0; //@line 836
     $$143 = $1 - $$03846 | 0; //@line 836
     $32 = HEAP32[$9 >> 2] | 0; //@line 836
    }
   } while (0);
   _memcpy($32 | 0, $$141 | 0, $$143 | 0) | 0; //@line 839
   HEAP32[$9 >> 2] = (HEAP32[$9 >> 2] | 0) + $$143; //@line 842
   $$1 = $$139 + $$143 | 0; //@line 844
  }
 } while (0);
 return $$1 | 0; //@line 847
}
function _createContext($0, $1, $2, $3) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = +$2;
 $3 = $3 | 0;
 var $10 = 0, $vararg_buffer = 0, $vararg_buffer1 = 0, $vararg_buffer4 = 0, sp = 0;
 sp = STACKTOP; //@line 155
 STACKTOP = STACKTOP + 80 | 0; //@line 156
 $vararg_buffer4 = sp + 56 | 0; //@line 157
 $vararg_buffer1 = sp + 8 | 0; //@line 158
 $vararg_buffer = sp; //@line 159
 HEAP32[$vararg_buffer >> 2] = $3; //@line 160
 _printf(1831, $vararg_buffer) | 0; //@line 161
 HEAP32[$vararg_buffer1 >> 2] = $3; //@line 162
 _printf(1635, $vararg_buffer1) | 0; //@line 163
 _puts(1897) | 0; //@line 164
 HEAP32[$vararg_buffer1 + 44 >> 2] = 0; //@line 166
 HEAP32[$vararg_buffer1 + 4 >> 2] = 1; //@line 168
 HEAP32[$vararg_buffer1 + 8 >> 2] = 1; //@line 170
 HEAP32[$vararg_buffer1 + 12 >> 2] = 1; //@line 172
 HEAP32[$vararg_buffer1 + 32 >> 2] = 1; //@line 174
 HEAP32[$vararg_buffer1 + 36 >> 2] = 0; //@line 176
 $10 = _emscripten_webgl_create_context($3 | 0, $vararg_buffer1 | 0) | 0; //@line 177
 HEAP32[$vararg_buffer4 >> 2] = $10; //@line 178
 _printf(1655, $vararg_buffer4) | 0; //@line 179
 _emscripten_webgl_make_context_current($10 | 0) | 0; //@line 180
 _glViewport(0, 0, $0 | 0, $1 | 0); //@line 181
 _build_invert_program($vararg_buffer4); //@line 182
 HEAP32[765] = HEAP32[$vararg_buffer4 >> 2]; //@line 183
 HEAP32[766] = HEAP32[$vararg_buffer4 + 4 >> 2]; //@line 183
 HEAP32[767] = HEAP32[$vararg_buffer4 + 8 >> 2]; //@line 183
 _build_blend_program($vararg_buffer4, $2); //@line 184
 HEAP32[768] = HEAP32[$vararg_buffer4 >> 2]; //@line 185
 HEAP32[769] = HEAP32[$vararg_buffer4 + 4 >> 2]; //@line 185
 HEAP32[770] = HEAP32[$vararg_buffer4 + 8 >> 2]; //@line 185
 _free($3); //@line 186
 STACKTOP = sp; //@line 187
 return;
}
function _memset(ptr, value, num) {
 ptr = ptr | 0;
 value = value | 0;
 num = num | 0;
 var end = 0, aligned_end = 0, block_aligned_end = 0, value4 = 0;
 end = ptr + num | 0; //@line 7286
 value = value & 255; //@line 7288
 if ((num | 0) >= 67) {
  while (ptr & 3) {
   HEAP8[ptr >> 0] = value; //@line 7291
   ptr = ptr + 1 | 0; //@line 7292
  }
  aligned_end = end & -4 | 0; //@line 7295
  value4 = value | value << 8 | value << 16 | value << 24; //@line 7296
  block_aligned_end = aligned_end - 64 | 0; //@line 7298
  while ((ptr | 0) <= (block_aligned_end | 0)) {
   HEAP32[ptr >> 2] = value4; //@line 7301
   HEAP32[ptr + 4 >> 2] = value4; //@line 7302
   HEAP32[ptr + 8 >> 2] = value4; //@line 7303
   HEAP32[ptr + 12 >> 2] = value4; //@line 7304
   HEAP32[ptr + 16 >> 2] = value4; //@line 7305
   HEAP32[ptr + 20 >> 2] = value4; //@line 7306
   HEAP32[ptr + 24 >> 2] = value4; //@line 7307
   HEAP32[ptr + 28 >> 2] = value4; //@line 7308
   HEAP32[ptr + 32 >> 2] = value4; //@line 7309
   HEAP32[ptr + 36 >> 2] = value4; //@line 7310
   HEAP32[ptr + 40 >> 2] = value4; //@line 7311
   HEAP32[ptr + 44 >> 2] = value4; //@line 7312
   HEAP32[ptr + 48 >> 2] = value4; //@line 7313
   HEAP32[ptr + 52 >> 2] = value4; //@line 7314
   HEAP32[ptr + 56 >> 2] = value4; //@line 7315
   HEAP32[ptr + 60 >> 2] = value4; //@line 7316
   ptr = ptr + 64 | 0; //@line 7317
  }
  while ((ptr | 0) < (aligned_end | 0)) {
   HEAP32[ptr >> 2] = value4; //@line 7321
   ptr = ptr + 4 | 0; //@line 7322
  }
 }
 while ((ptr | 0) < (end | 0)) {
  HEAP8[ptr >> 0] = value; //@line 7327
  ptr = ptr + 1 | 0; //@line 7328
 }
 return end - num | 0; //@line 7330
}
function _fmt_u($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $$010$lcssa$off0 = 0, $$012 = 0, $$09$lcssa = 0, $$0914 = 0, $$1$lcssa = 0, $$111 = 0, $12 = 0, $14 = 0, $30 = 0, $8 = 0, $9 = 0, $8$looptemp = 0, $9$looptemp = 0, $$012$looptemp = 0;
 if ($1 >>> 0 > 0 | ($1 | 0) == 0 & $0 >>> 0 > 4294967295) {
  $$0914 = $2; //@line 2376
  $8 = $0; //@line 2376
  $9 = $1; //@line 2376
  do {
   $8$looptemp = $8;
   $8 = ___udivdi3($8 | 0, $9 | 0, 10, 0) | 0; //@line 2378
   $9$looptemp = $9;
   $9 = getTempRet0() | 0; //@line 2379
   $12 = ___muldi3($8 | 0, $9 | 0, 10, 0) | 0; //@line 2380
   $14 = _i64Subtract($8$looptemp | 0, $9$looptemp | 0, $12 | 0, getTempRet0() | 0) | 0; //@line 2382
   getTempRet0() | 0; //@line 2383
   $$0914 = $$0914 + -1 | 0; //@line 2386
   HEAP8[$$0914 >> 0] = $14 & 255 | 48; //@line 2387
  } while ($9$looptemp >>> 0 > 9 | ($9$looptemp | 0) == 9 & $8$looptemp >>> 0 > 4294967295);
  $$010$lcssa$off0 = $8; //@line 2399
  $$09$lcssa = $$0914; //@line 2399
 } else {
  $$010$lcssa$off0 = $0; //@line 2401
  $$09$lcssa = $2; //@line 2401
 }
 if (!$$010$lcssa$off0) {
  $$1$lcssa = $$09$lcssa; //@line 2405
 } else {
  $$012 = $$010$lcssa$off0; //@line 2407
  $$111 = $$09$lcssa; //@line 2407
  while (1) {
   $$012$looptemp = $$012;
   $$012 = ($$012 >>> 0) / 10 | 0; //@line 2409
   $30 = $$111 + -1 | 0; //@line 2414
   HEAP8[$30 >> 0] = $$012$looptemp - ($$012 * 10 | 0) | 48; //@line 2415
   if ($$012$looptemp >>> 0 < 10) {
    $$1$lcssa = $30; //@line 2418
    break;
   } else {
    $$111 = $30; //@line 2421
   }
  }
 }
 return $$1$lcssa | 0; //@line 2425
}
function _wcrtomb($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $$0 = 0, $13 = 0, $57 = 0, $7 = 0;
 do {
  if (!$0) {
   $$0 = 1; //@line 3518
  } else {
   if ($1 >>> 0 < 128) {
    HEAP8[$0 >> 0] = $1; //@line 3523
    $$0 = 1; //@line 3524
    break;
   }
   $7 = (___pthread_self_888() | 0) + 188 | 0; //@line 3528
   if (!(HEAP32[HEAP32[$7 >> 2] >> 2] | 0)) {
    if (($1 & -128 | 0) == 57216) {
     HEAP8[$0 >> 0] = $1; //@line 3537
     $$0 = 1; //@line 3538
     break;
    } else {
     $13 = ___errno_location() | 0; //@line 3541
     HEAP32[$13 >> 2] = 84; //@line 3542
     $$0 = -1; //@line 3543
     break;
    }
   }
   if ($1 >>> 0 < 2048) {
    HEAP8[$0 >> 0] = $1 >>> 6 | 192; //@line 3553
    HEAP8[$0 + 1 >> 0] = $1 & 63 | 128; //@line 3557
    $$0 = 2; //@line 3558
    break;
   }
   if ($1 >>> 0 < 55296 | ($1 & -8192 | 0) == 57344) {
    HEAP8[$0 >> 0] = $1 >>> 12 | 224; //@line 3570
    HEAP8[$0 + 1 >> 0] = $1 >>> 6 & 63 | 128; //@line 3576
    HEAP8[$0 + 2 >> 0] = $1 & 63 | 128; //@line 3580
    $$0 = 3; //@line 3581
    break;
   }
   if (($1 + -65536 | 0) >>> 0 < 1048576) {
    HEAP8[$0 >> 0] = $1 >>> 18 | 240; //@line 3591
    HEAP8[$0 + 1 >> 0] = $1 >>> 12 & 63 | 128; //@line 3597
    HEAP8[$0 + 2 >> 0] = $1 >>> 6 & 63 | 128; //@line 3603
    HEAP8[$0 + 3 >> 0] = $1 & 63 | 128; //@line 3607
    $$0 = 4; //@line 3608
    break;
   } else {
    $57 = ___errno_location() | 0; //@line 3611
    HEAP32[$57 >> 2] = 84; //@line 3612
    $$0 = -1; //@line 3613
    break;
   }
  }
 } while (0);
 return $$0 | 0; //@line 3618
}
function __ZL12build_shaderPKcj($0, $1) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 var $$0 = 0, $$1 = 0, $11 = 0, $12 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $vararg_buffer = 0, sp = 0;
 sp = STACKTOP; //@line 221
 STACKTOP = STACKTOP + 16 | 0; //@line 222
 $vararg_buffer = sp; //@line 223
 $2 = sp + 8 | 0; //@line 224
 $3 = sp + 12 | 0; //@line 225
 $4 = sp + 4 | 0; //@line 226
 HEAP32[$2 >> 2] = $0; //@line 227
 $5 = _glCreateShader($1 | 0) | 0; //@line 228
 if (!$5) {
  $$1 = 0; //@line 231
  STACKTOP = sp; //@line 232
  return $$1 | 0; //@line 232
 }
 if (!((_glIsShader($5 | 0) | 0) << 24 >> 24)) {
  $$1 = 0; //@line 237
  STACKTOP = sp; //@line 238
  return $$1 | 0; //@line 238
 }
 _glShaderSource($5 | 0, 1, $2 | 0, 0); //@line 240
 _glCompileShader($5 | 0); //@line 241
 _glGetShaderiv($5 | 0, 35713, $3 | 0); //@line 242
 if ((HEAP32[$3 >> 2] | 0) == 1) {
  $$0 = $5; //@line 246
 } else {
  HEAP32[$4 >> 2] = 0; //@line 248
  _glGetShaderiv($5 | 0, 35716, $4 | 0); //@line 249
  $11 = HEAP32[$4 >> 2] | 0; //@line 250
  $12 = _calloc($11, 1) | 0; //@line 251
  _glGetShaderInfoLog($5 | 0, $11 | 0, 0, $12 | 0); //@line 252
  HEAP32[$vararg_buffer >> 2] = $12; //@line 253
  _printf(1876, $vararg_buffer) | 0; //@line 254
  _free($12); //@line 255
  $$0 = 0; //@line 256
 }
 $$1 = $$0; //@line 258
 STACKTOP = sp; //@line 259
 return $$1 | 0; //@line 259
}
function _build_blend_program($0, $1) {
 $0 = $0 | 0;
 $1 = +$1;
 var $10 = 0, $2 = 0, $3 = 0, $6 = 0, $7 = 0, $9 = 0, sp = 0;
 sp = STACKTOP; //@line 105
 STACKTOP = STACKTOP + 16 | 0; //@line 106
 $2 = sp; //@line 107
 $3 = __ZL13build_programPNSt3__212basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES6_(3048) | 0; //@line 108
 _glUseProgram($3 | 0); //@line 109
 _glUniform1f(_glGetUniformLocation($3 | 0, 1623) | 0, +$1); //@line 111
 _glGenBuffers(1, $2 | 0); //@line 112
 _glBindBuffer(34962, HEAP32[$2 >> 2] | 0); //@line 114
 _glBufferData(34962, 48, 16, 35044); //@line 115
 $6 = _glGetAttribLocation($3 | 0, 1879) | 0; //@line 116
 _glEnableVertexAttribArray($6 | 0); //@line 117
 _glVertexAttribPointer($6 | 0, 2, 5126, 0, 0, 0); //@line 118
 $7 = HEAP32[$2 >> 2] | 0; //@line 119
 _glGenBuffers(1, $2 | 0); //@line 120
 _glBindBuffer(34962, HEAP32[$2 >> 2] | 0); //@line 122
 _glBufferData(34962, 48, 64, 35044); //@line 123
 $9 = _glGetAttribLocation($3 | 0, 1888) | 0; //@line 124
 _glEnableVertexAttribArray($9 | 0); //@line 125
 _glVertexAttribPointer($9 | 0, 2, 5126, 0, 0, 0); //@line 126
 $10 = HEAP32[$2 >> 2] | 0; //@line 127
 HEAP32[$0 >> 2] = $3; //@line 128
 HEAP32[$0 + 4 >> 2] = $7; //@line 130
 HEAP32[$0 + 8 >> 2] = $10; //@line 132
 STACKTOP = sp; //@line 133
 return;
}
function _strlen($0) {
 $0 = $0 | 0;
 var $$0 = 0, $$015$lcssa = 0, $$01518 = 0, $$1$lcssa = 0, $$pn = 0, $$pn29 = 0, $1 = 0, $10 = 0, $19 = 0, $22 = 0, $6 = 0, label = 0;
 $1 = $0; //@line 529
 L1 : do {
  if (!($1 & 3)) {
   $$015$lcssa = $0; //@line 534
   label = 5; //@line 535
  } else {
   $$01518 = $0; //@line 537
   $22 = $1; //@line 537
   while (1) {
    if (!(HEAP8[$$01518 >> 0] | 0)) {
     $$pn = $22; //@line 542
     break L1;
    }
    $6 = $$01518 + 1 | 0; //@line 545
    $22 = $6; //@line 546
    if (!($22 & 3)) {
     $$015$lcssa = $6; //@line 550
     label = 5; //@line 551
     break;
    } else {
     $$01518 = $6; //@line 554
    }
   }
  }
 } while (0);
 if ((label | 0) == 5) {
  $$0 = $$015$lcssa; //@line 560
  while (1) {
   $10 = HEAP32[$$0 >> 2] | 0; //@line 562
   if (!(($10 & -2139062144 ^ -2139062144) & $10 + -16843009)) {
    $$0 = $$0 + 4 | 0; //@line 570
   } else {
    break;
   }
  }
  if (!(($10 & 255) << 24 >> 24)) {
   $$1$lcssa = $$0; //@line 578
  } else {
   $$pn29 = $$0; //@line 580
   while (1) {
    $19 = $$pn29 + 1 | 0; //@line 582
    if (!(HEAP8[$19 >> 0] | 0)) {
     $$1$lcssa = $19; //@line 586
     break;
    } else {
     $$pn29 = $19; //@line 589
    }
   }
  }
  $$pn = $$1$lcssa; //@line 594
 }
 return $$pn - $1 | 0; //@line 597
}
function _build_invert_program($0) {
 $0 = $0 | 0;
 var $1 = 0, $2 = 0, $4 = 0, $5 = 0, $7 = 0, $8 = 0, sp = 0;
 sp = STACKTOP; //@line 27
 STACKTOP = STACKTOP + 16 | 0; //@line 28
 $1 = sp; //@line 29
 $2 = __ZL13build_programPNSt3__212basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES6_(3036) | 0; //@line 30
 _glUseProgram($2 | 0); //@line 31
 _glGenBuffers(1, $1 | 0); //@line 32
 _glBindBuffer(34962, HEAP32[$1 >> 2] | 0); //@line 34
 _glBufferData(34962, 48, 16, 35044); //@line 35
 $4 = _glGetAttribLocation($2 | 0, 1879) | 0; //@line 36
 _glEnableVertexAttribArray($4 | 0); //@line 37
 _glVertexAttribPointer($4 | 0, 2, 5126, 0, 0, 0); //@line 38
 $5 = HEAP32[$1 >> 2] | 0; //@line 39
 _glGenBuffers(1, $1 | 0); //@line 40
 _glBindBuffer(34962, HEAP32[$1 >> 2] | 0); //@line 42
 _glBufferData(34962, 48, 64, 35044); //@line 43
 $7 = _glGetAttribLocation($2 | 0, 1888) | 0; //@line 44
 _glEnableVertexAttribArray($7 | 0); //@line 45
 _glVertexAttribPointer($7 | 0, 2, 5126, 0, 0, 0); //@line 46
 $8 = HEAP32[$1 >> 2] | 0; //@line 47
 HEAP32[$0 >> 2] = $2; //@line 48
 HEAP32[$0 + 4 >> 2] = $5; //@line 50
 HEAP32[$0 + 8 >> 2] = $8; //@line 52
 STACKTOP = sp; //@line 53
 return;
}
function ___overflow($0, $1) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 var $$0 = 0, $10 = 0, $12 = 0, $13 = 0, $2 = 0, $3 = 0, $4 = 0, $5 = 0, $9 = 0, label = 0, sp = 0;
 sp = STACKTOP; //@line 663
 STACKTOP = STACKTOP + 16 | 0; //@line 664
 $2 = sp; //@line 665
 $3 = $1 & 255; //@line 666
 HEAP8[$2 >> 0] = $3; //@line 667
 $4 = $0 + 16 | 0; //@line 668
 $5 = HEAP32[$4 >> 2] | 0; //@line 669
 if (!$5) {
  if (!(___towrite($0) | 0)) {
   $12 = HEAP32[$4 >> 2] | 0; //@line 676
   label = 4; //@line 677
  } else {
   $$0 = -1; //@line 679
  }
 } else {
  $12 = $5; //@line 682
  label = 4; //@line 683
 }
 do {
  if ((label | 0) == 4) {
   $9 = $0 + 20 | 0; //@line 687
   $10 = HEAP32[$9 >> 2] | 0; //@line 688
   if ($10 >>> 0 < $12 >>> 0) {
    $13 = $1 & 255; //@line 691
    if (($13 | 0) != (HEAP8[$0 + 75 >> 0] | 0)) {
     HEAP32[$9 >> 2] = $10 + 1; //@line 698
     HEAP8[$10 >> 0] = $3; //@line 699
     $$0 = $13; //@line 700
     break;
    }
   }
   if ((FUNCTION_TABLE_iiii[HEAP32[$0 + 36 >> 2] & 3]($0, $2, 1) | 0) == 1) {
    $$0 = HEAPU8[$2 >> 0] | 0; //@line 711
   } else {
    $$0 = -1; //@line 713
   }
  }
 } while (0);
 STACKTOP = sp; //@line 717
 return $$0 | 0; //@line 717
}
function __ZL13build_programPNSt3__212basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEES6_($0) {
 $0 = $0 | 0;
 var $$0 = 0, $1 = 0, $12 = 0, $13 = 0, $15 = 0, $6 = 0, $vararg_buffer = 0, sp = 0;
 sp = STACKTOP; //@line 59
 STACKTOP = STACKTOP + 16 | 0; //@line 60
 $vararg_buffer = sp; //@line 61
 $1 = sp + 4 | 0; //@line 62
 $6 = __ZL12build_shaderPKcj((HEAP8[3035] | 0) < 0 ? HEAP32[756] | 0 : 3024, 35633) | 0; //@line 67
 if ($6 | 0) {
  if ((HEAP8[$0 + 11 >> 0] | 0) < 0) {
   $12 = HEAP32[$0 >> 2] | 0; //@line 75
  } else {
   $12 = $0; //@line 77
  }
  $13 = __ZL12build_shaderPKcj($12, 35632) | 0; //@line 79
  if ($13 | 0) {
   $15 = _glCreateProgram() | 0; //@line 82
   _glAttachShader($15 | 0, $6 | 0); //@line 83
   _glAttachShader($15 | 0, $13 | 0); //@line 84
   _glLinkProgram($15 | 0); //@line 85
   _glGetProgramiv($15 | 0, 35714, $1 | 0); //@line 86
   if ((HEAP32[$1 >> 2] | 0) != 1) {
    _exit(1); //@line 90
   }
   $$0 = $15; //@line 93
   STACKTOP = sp; //@line 94
   return $$0 | 0; //@line 94
  }
 }
 _printf(1852, $vararg_buffer) | 0; //@line 97
 $$0 = -1; //@line 98
 STACKTOP = sp; //@line 99
 return $$0 | 0; //@line 99
}
function _frexp($0, $1) {
 $0 = +$0;
 $1 = $1 | 0;
 var $$0 = 0.0, $$016 = 0.0, $2 = 0, $3 = 0, $4 = 0, $9 = 0.0, $storemerge = 0;
 HEAPF64[tempDoublePtr >> 3] = $0; //@line 3469
 $2 = HEAP32[tempDoublePtr >> 2] | 0; //@line 3469
 $3 = HEAP32[tempDoublePtr + 4 >> 2] | 0; //@line 3470
 $4 = _bitshift64Lshr($2 | 0, $3 | 0, 52) | 0; //@line 3471
 getTempRet0() | 0; //@line 3472
 switch ($4 & 2047) {
 case 0:
  {
   if ($0 != 0.0) {
    $9 = +_frexp($0 * 18446744073709552000.0, $1); //@line 3480
    $$016 = $9; //@line 3483
    $storemerge = (HEAP32[$1 >> 2] | 0) + -64 | 0; //@line 3483
   } else {
    $$016 = $0; //@line 3485
    $storemerge = 0; //@line 3485
   }
   HEAP32[$1 >> 2] = $storemerge; //@line 3487
   $$0 = $$016; //@line 3488
   break;
  }
 case 2047:
  {
   $$0 = $0; //@line 3492
   break;
  }
 default:
  {
   HEAP32[$1 >> 2] = ($4 & 2047) + -1022; //@line 3498
   HEAP32[tempDoublePtr >> 2] = $2; //@line 3501
   HEAP32[tempDoublePtr + 4 >> 2] = $3 & -2146435073 | 1071644672; //@line 3501
   $$0 = +HEAPF64[tempDoublePtr >> 3]; //@line 3502
  }
 }
 return +$$0;
}
function __GLOBAL__sub_I_emscripten_cpp() {
 var $0 = 0, $2 = 0, $4 = 0;
 HEAP32[756] = 0; //@line 264
 HEAP32[757] = 0; //@line 264
 HEAP32[758] = 0; //@line 264
 $0 = __Znwm(176) | 0; //@line 265
 HEAP32[756] = $0; //@line 266
 HEAP32[758] = -2147483472; //@line 267
 HEAP32[757] = 160; //@line 268
 _memcpy($0 | 0, 964, 160) | 0; //@line 269
 HEAP8[$0 + 160 >> 0] = 0; //@line 271
 HEAP32[759] = 0; //@line 272
 HEAP32[760] = 0; //@line 272
 HEAP32[761] = 0; //@line 272
 $2 = __Znwm(192) | 0; //@line 273
 HEAP32[759] = $2; //@line 274
 HEAP32[761] = -2147483456; //@line 275
 HEAP32[760] = 187; //@line 276
 _memcpy($2 | 0, 1125, 187) | 0; //@line 277
 HEAP8[$2 + 187 >> 0] = 0; //@line 279
 HEAP32[762] = 0; //@line 280
 HEAP32[763] = 0; //@line 280
 HEAP32[764] = 0; //@line 280
 $4 = __Znwm(320) | 0; //@line 281
 HEAP32[762] = $4; //@line 282
 HEAP32[764] = -2147483328; //@line 283
 HEAP32[763] = 309; //@line 284
 _memcpy($4 | 0, 1313, 309) | 0; //@line 285
 HEAP8[$4 + 309 >> 0] = 0; //@line 287
 return;
}
function _pad_661($0, $1, $2, $3, $4) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 $3 = $3 | 0;
 $4 = $4 | 0;
 var $$0$lcssa = 0, $$011 = 0, $14 = 0, $5 = 0, $9 = 0, sp = 0;
 sp = STACKTOP; //@line 2434
 STACKTOP = STACKTOP + 256 | 0; //@line 2435
 $5 = sp; //@line 2436
 if (($2 | 0) > ($3 | 0) & ($4 & 73728 | 0) == 0) {
  $9 = $2 - $3 | 0; //@line 2442
  _memset($5 | 0, $1 << 24 >> 24 | 0, ($9 >>> 0 < 256 ? $9 : 256) | 0) | 0; //@line 2446
  if ($9 >>> 0 > 255) {
   $14 = $2 - $3 | 0; //@line 2449
   $$011 = $9; //@line 2450
   do {
    _out_655($0, $5, 256); //@line 2452
    $$011 = $$011 + -256 | 0; //@line 2453
   } while ($$011 >>> 0 > 255);
   $$0$lcssa = $14 & 255; //@line 2462
  } else {
   $$0$lcssa = $9; //@line 2464
  }
  _out_655($0, $5, $$0$lcssa); //@line 2466
 }
 STACKTOP = sp; //@line 2468
 return;
}
function _puts($0) {
 $0 = $0 | 0;
 var $1 = 0, $11 = 0, $12 = 0, $19 = 0, $20 = 0;
 $1 = HEAP32[148] | 0; //@line 3643
 if ((HEAP32[$1 + 76 >> 2] | 0) > -1) {
  $19 = ___lockfile($1) | 0; //@line 3649
 } else {
  $19 = 0; //@line 3651
 }
 do {
  if ((_fputs($0, $1) | 0) < 0) {
   $20 = -1; //@line 3657
  } else {
   if ((HEAP8[$1 + 75 >> 0] | 0) != 10) {
    $11 = $1 + 20 | 0; //@line 3663
    $12 = HEAP32[$11 >> 2] | 0; //@line 3664
    if ($12 >>> 0 < (HEAP32[$1 + 16 >> 2] | 0) >>> 0) {
     HEAP32[$11 >> 2] = $12 + 1; //@line 3670
     HEAP8[$12 >> 0] = 10; //@line 3671
     $20 = 0; //@line 3672
     break;
    }
   }
   $20 = (___overflow($1, 10) | 0) >> 31; //@line 3678
  }
 } while (0);
 if ($19 | 0) {
  ___unlockfile($1); //@line 3683
 }
 return $20 | 0; //@line 3685
}
function ___stdio_seek($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $10 = 0, $3 = 0, $vararg_buffer = 0, sp = 0;
 sp = STACKTOP; //@line 423
 STACKTOP = STACKTOP + 32 | 0; //@line 424
 $vararg_buffer = sp; //@line 425
 $3 = sp + 20 | 0; //@line 426
 HEAP32[$vararg_buffer >> 2] = HEAP32[$0 + 60 >> 2]; //@line 430
 HEAP32[$vararg_buffer + 4 >> 2] = 0; //@line 432
 HEAP32[$vararg_buffer + 8 >> 2] = $1; //@line 434
 HEAP32[$vararg_buffer + 12 >> 2] = $3; //@line 436
 HEAP32[$vararg_buffer + 16 >> 2] = $2; //@line 438
 if ((___syscall_ret(___syscall140(140, $vararg_buffer | 0) | 0) | 0) < 0) {
  HEAP32[$3 >> 2] = -1; //@line 443
  $10 = -1; //@line 444
 } else {
  $10 = HEAP32[$3 >> 2] | 0; //@line 447
 }
 STACKTOP = sp; //@line 449
 return $10 | 0; //@line 449
}
function _fwrite($0, $1, $2, $3) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 $3 = $3 | 0;
 var $11 = 0, $13 = 0, $15 = 0, $4 = 0, $phitmp = 0, $spec$select = 0;
 $4 = Math_imul($2, $1) | 0; //@line 617
 $spec$select = ($1 | 0) == 0 ? 0 : $2; //@line 619
 if ((HEAP32[$3 + 76 >> 2] | 0) > -1) {
  $phitmp = (___lockfile($3) | 0) == 0; //@line 625
  $11 = ___fwritex($0, $4, $3) | 0; //@line 626
  if ($phitmp) {
   $13 = $11; //@line 628
  } else {
   ___unlockfile($3); //@line 630
   $13 = $11; //@line 631
  }
 } else {
  $13 = ___fwritex($0, $4, $3) | 0; //@line 635
 }
 if (($13 | 0) == ($4 | 0)) {
  $15 = $spec$select; //@line 639
 } else {
  $15 = ($13 >>> 0) / ($1 >>> 0) | 0; //@line 642
 }
 return $15 | 0; //@line 644
}
function _sbrk(increment) {
 increment = increment | 0;
 var oldDynamicTop = 0, newDynamicTop = 0;
 oldDynamicTop = HEAP32[DYNAMICTOP_PTR >> 2] | 0; //@line 7338
 newDynamicTop = oldDynamicTop + increment | 0; //@line 7339
 if ((increment | 0) > 0 & (newDynamicTop | 0) < (oldDynamicTop | 0) | (newDynamicTop | 0) < 0) {
  abortOnCannotGrowMemory(newDynamicTop | 0) | 0; //@line 7343
  ___setErrNo(12); //@line 7344
  return -1;
 }
 if ((newDynamicTop | 0) <= (_emscripten_get_heap_size() | 0)) {
  HEAP32[DYNAMICTOP_PTR >> 2] = newDynamicTop; //@line 7350
 } else {
  if (!(_emscripten_resize_heap(newDynamicTop | 0) | 0)) {
   ___setErrNo(12); //@line 7353
   return -1;
  }
 }
 return oldDynamicTop | 0; //@line 7357
}
function _fmt_x($0, $1, $2, $3) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 $3 = $3 | 0;
 var $$05$lcssa = 0, $$056 = 0, $14 = 0, $15 = 0, $8 = 0;
 if (($0 | 0) == 0 & ($1 | 0) == 0) {
  $$05$lcssa = $2; //@line 2302
 } else {
  $$056 = $2; //@line 2304
  $15 = $1; //@line 2304
  $8 = $0; //@line 2304
  while (1) {
   $14 = $$056 + -1 | 0; //@line 2312
   HEAP8[$14 >> 0] = HEAPU8[576 + ($8 & 15) >> 0] | 0 | $3; //@line 2313
   $8 = _bitshift64Lshr($8 | 0, $15 | 0, 4) | 0; //@line 2314
   $15 = getTempRet0() | 0; //@line 2315
   if (($8 | 0) == 0 & ($15 | 0) == 0) {
    $$05$lcssa = $14; //@line 2320
    break;
   } else {
    $$056 = $14; //@line 2323
   }
  }
 }
 return $$05$lcssa | 0; //@line 2327
}
function ___stdout_write($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $14 = 0, $vararg_buffer = 0, sp = 0;
 sp = STACKTOP; //@line 482
 STACKTOP = STACKTOP + 32 | 0; //@line 483
 $vararg_buffer = sp; //@line 484
 HEAP32[$0 + 36 >> 2] = 3; //@line 487
 if (!(HEAP32[$0 >> 2] & 64)) {
  HEAP32[$vararg_buffer >> 2] = HEAP32[$0 + 60 >> 2]; //@line 495
  HEAP32[$vararg_buffer + 4 >> 2] = 21523; //@line 497
  HEAP32[$vararg_buffer + 8 >> 2] = sp + 16; //@line 499
  if (___syscall54(54, $vararg_buffer | 0) | 0) {
   HEAP8[$0 + 75 >> 0] = -1; //@line 504
  }
 }
 $14 = ___stdio_write($0, $1, $2) | 0; //@line 507
 STACKTOP = sp; //@line 508
 return $14 | 0; //@line 508
}
function ___towrite($0) {
 $0 = $0 | 0;
 var $$0 = 0, $1 = 0, $14 = 0, $3 = 0, $7 = 0;
 $1 = $0 + 74 | 0; //@line 724
 $3 = HEAP8[$1 >> 0] | 0; //@line 726
 HEAP8[$1 >> 0] = $3 + 255 | $3; //@line 730
 $7 = HEAP32[$0 >> 2] | 0; //@line 731
 if (!($7 & 8)) {
  HEAP32[$0 + 8 >> 2] = 0; //@line 736
  HEAP32[$0 + 4 >> 2] = 0; //@line 738
  $14 = HEAP32[$0 + 44 >> 2] | 0; //@line 740
  HEAP32[$0 + 28 >> 2] = $14; //@line 742
  HEAP32[$0 + 20 >> 2] = $14; //@line 744
  HEAP32[$0 + 16 >> 2] = $14 + (HEAP32[$0 + 48 >> 2] | 0); //@line 750
  $$0 = 0; //@line 751
 } else {
  HEAP32[$0 >> 2] = $7 | 32; //@line 754
  $$0 = -1; //@line 755
 }
 return $$0 | 0; //@line 757
}
function _fmt_o($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 var $$0$lcssa = 0, $$06 = 0, $10 = 0, $11 = 0, $7 = 0;
 if (($0 | 0) == 0 & ($1 | 0) == 0) {
  $$0$lcssa = $2; //@line 2339
 } else {
  $$06 = $2; //@line 2341
  $11 = $1; //@line 2341
  $7 = $0; //@line 2341
  while (1) {
   $10 = $$06 + -1 | 0; //@line 2346
   HEAP8[$10 >> 0] = $7 & 7 | 48; //@line 2347
   $7 = _bitshift64Lshr($7 | 0, $11 | 0, 3) | 0; //@line 2348
   $11 = getTempRet0() | 0; //@line 2349
   if (($7 | 0) == 0 & ($11 | 0) == 0) {
    $$0$lcssa = $10; //@line 2354
    break;
   } else {
    $$06 = $10; //@line 2357
   }
  }
 }
 return $$0$lcssa | 0; //@line 2361
}
function ___muldi3($a$0, $a$1, $b$0, $b$1) {
 $a$0 = $a$0 | 0;
 $a$1 = $a$1 | 0;
 $b$0 = $b$0 | 0;
 $b$1 = $b$1 | 0;
 var $x_sroa_0_0_extract_trunc = 0, $y_sroa_0_0_extract_trunc = 0, $1$0 = 0, $1$1 = 0;
 $x_sroa_0_0_extract_trunc = $a$0; //@line 6944
 $y_sroa_0_0_extract_trunc = $b$0; //@line 6945
 $1$0 = ___muldsi3($x_sroa_0_0_extract_trunc, $y_sroa_0_0_extract_trunc) | 0; //@line 6946
 $1$1 = getTempRet0() | 0; //@line 6947
 return (setTempRet0((Math_imul($a$1, $y_sroa_0_0_extract_trunc) | 0) + (Math_imul($b$1, $x_sroa_0_0_extract_trunc) | 0) + $1$1 | $1$1 & 0 | 0), $1$0 | 0 | 0) | 0; //@line 6949
}
function _getint_656($0) {
 $0 = $0 | 0;
 var $$0$lcssa = 0, $$04 = 0, $11 = 0, $12 = 0, $7 = 0;
 if (!(_isdigit(HEAP8[HEAP32[$0 >> 2] >> 0] | 0) | 0)) {
  $$0$lcssa = 0; //@line 1983
 } else {
  $$04 = 0; //@line 1985
  while (1) {
   $7 = HEAP32[$0 >> 2] | 0; //@line 1988
   $11 = ($$04 * 10 | 0) + -48 + (HEAP8[$7 >> 0] | 0) | 0; //@line 1992
   $12 = $7 + 1 | 0; //@line 1993
   HEAP32[$0 >> 2] = $12; //@line 1994
   if (!(_isdigit(HEAP8[$12 >> 0] | 0) | 0)) {
    $$0$lcssa = $11; //@line 2000
    break;
   } else {
    $$04 = $11; //@line 2003
   }
  }
 }
 return $$0$lcssa | 0; //@line 2007
}
function _calloc($0, $1) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 var $$0 = 0, $3 = 0, $8 = 0;
 if (!$0) {
  $$0 = 0; //@line 6864
 } else {
  $3 = Math_imul($1, $0) | 0; //@line 6866
  if (($1 | $0) >>> 0 > 65535) {
   $$0 = (($3 >>> 0) / ($0 >>> 0) | 0 | 0) == ($1 | 0) ? $3 : -1; //@line 6873
  } else {
   $$0 = $3; //@line 6875
  }
 }
 $8 = _malloc($$0) | 0; //@line 6878
 if (!$8) {
  return $8 | 0; //@line 6881
 }
 if (!(HEAP32[$8 + -4 >> 2] & 3)) {
  return $8 | 0; //@line 6888
 }
 _memset($8 | 0, 0, $$0 | 0) | 0; //@line 6890
 return $8 | 0; //@line 6891
}
function ___muldsi3($a, $b) {
 $a = $a | 0;
 $b = $b | 0;
 var $1 = 0, $2 = 0, $3 = 0, $6 = 0, $8 = 0, $11 = 0, $12 = 0;
 $1 = $a & 65535; //@line 6929
 $2 = $b & 65535; //@line 6930
 $3 = Math_imul($2, $1) | 0; //@line 6931
 $6 = $a >>> 16; //@line 6932
 $8 = ($3 >>> 16) + (Math_imul($2, $6) | 0) | 0; //@line 6933
 $11 = $b >>> 16; //@line 6934
 $12 = Math_imul($11, $1) | 0; //@line 6935
 return (setTempRet0(($8 >>> 16) + (Math_imul($11, $6) | 0) + ((($8 & 65535) + $12 | 0) >>> 16) | 0), $8 + $12 << 16 | $3 & 65535 | 0) | 0; //@line 6936
}
function __Znwm($0) {
 $0 = $0 | 0;
 var $$lcssa = 0, $2 = 0, $4 = 0, $spec$store$select = 0;
 $spec$store$select = ($0 | 0) == 0 ? 1 : $0; //@line 6898
 while (1) {
  $2 = _malloc($spec$store$select) | 0; //@line 6900
  if ($2 | 0) {
   $$lcssa = $2; //@line 6903
   break;
  }
  $4 = __ZSt15get_new_handlerv() | 0; //@line 6906
  if (!$4) {
   $$lcssa = 0; //@line 6909
   break;
  }
  FUNCTION_TABLE_v[$4 & 0](); //@line 6912
 }
 return $$lcssa | 0; //@line 6914
}
function ___stdio_close($0) {
 $0 = $0 | 0;
 var $3 = 0, $5 = 0, $vararg_buffer = 0, sp = 0;
 sp = STACKTOP; //@line 293
 STACKTOP = STACKTOP + 16 | 0; //@line 294
 $vararg_buffer = sp; //@line 295
 $3 = _dummy(HEAP32[$0 + 60 >> 2] | 0) | 0; //@line 298
 HEAP32[$vararg_buffer >> 2] = $3; //@line 299
 $5 = ___syscall_ret(___syscall6(6, $vararg_buffer | 0) | 0) | 0; //@line 301
 STACKTOP = sp; //@line 302
 return $5 | 0; //@line 302
}
function _printf($0, $varargs) {
 $0 = $0 | 0;
 $varargs = $varargs | 0;
 var $1 = 0, $3 = 0, sp = 0;
 sp = STACKTOP; //@line 3630
 STACKTOP = STACKTOP + 16 | 0; //@line 3631
 $1 = sp; //@line 3632
 HEAP32[$1 >> 2] = $varargs; //@line 3633
 $3 = _vfprintf(HEAP32[148] | 0, $0, $1) | 0; //@line 3635
 STACKTOP = sp; //@line 3636
 return $3 | 0; //@line 3636
}
function _bitshift64Shl(low, high, bits) {
 low = low | 0;
 high = high | 0;
 bits = bits | 0;
 if ((bits | 0) < 32) {
  setTempRet0(high << bits | (low & (1 << bits) - 1 << 32 - bits) >>> 32 - bits | 0); //@line 7207
  return low << bits; //@line 7208
 }
 setTempRet0(low << bits - 32 | 0); //@line 7210
 return 0; //@line 7211
}
function _blendTexturesRun($0, $1) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 _glUseProgram(HEAP32[768] | 0); //@line 207
 _glUniform1i(_glGetUniformLocation(HEAP32[768] | 0, 1678) | 0, $0 | 0); //@line 210
 _glUniform1i(_glGetUniformLocation(HEAP32[768] | 0, 1683) | 0, $1 | 0); //@line 213
 _glDrawArrays(4, 0, 6); //@line 214
 return;
}
function _bitshift64Lshr(low, high, bits) {
 low = low | 0;
 high = high | 0;
 bits = bits | 0;
 if ((bits | 0) < 32) {
  setTempRet0(high >>> bits | 0); //@line 7196
  return low >>> bits | (high & (1 << bits) - 1) << 32 - bits; //@line 7197
 }
 setTempRet0(0); //@line 7199
 return high >>> bits - 32 | 0; //@line 7200
}
function ___syscall_ret($0) {
 $0 = $0 | 0;
 var $$0 = 0, $3 = 0;
 if ($0 >>> 0 > 4294963200) {
  $3 = ___errno_location() | 0; //@line 458
  HEAP32[$3 >> 2] = 0 - $0; //@line 459
  $$0 = -1; //@line 460
 } else {
  $$0 = $0; //@line 462
 }
 return $$0 | 0; //@line 464
}
function ___DOUBLE_BITS_662($0) {
 $0 = +$0;
 var $1 = 0;
 HEAPF64[tempDoublePtr >> 3] = $0; //@line 3450
 $1 = HEAP32[tempDoublePtr >> 2] | 0; //@line 3450
 setTempRet0(HEAP32[tempDoublePtr + 4 >> 2] | 0); //@line 3452
 return $1 | 0; //@line 3453
}
function _i64Subtract(a, b, c, d) {
 a = a | 0;
 b = b | 0;
 c = c | 0;
 d = d | 0;
 var h = 0;
 h = b - d >>> 0; //@line 6967
 h = b - d - (c >>> 0 > a >>> 0 | 0) >>> 0; //@line 6968
 return (setTempRet0(h | 0), a - c >>> 0 | 0) | 0; //@line 6969
}
function _invertFrameRun($0) {
 $0 = $0 | 0;
 _glUseProgram(HEAP32[765] | 0); //@line 194
 _glUniform1i(_glGetUniformLocation(HEAP32[765] | 0, 1674) | 0, $0 | 0); //@line 197
 _glDrawArrays(4, 0, 6); //@line 198
 return;
}
function _i64Add(a, b, c, d) {
 a = a | 0;
 b = b | 0;
 c = c | 0;
 d = d | 0;
 var l = 0;
 l = a + c >>> 0; //@line 6959
 return (setTempRet0(b + d + (l >>> 0 < a >>> 0 | 0) >>> 0 | 0), l | 0) | 0; //@line 6961
}
function stackAlloc(size) {
 size = size | 0;
 var ret = 0;
 ret = STACKTOP; //@line 4
 STACKTOP = STACKTOP + size | 0; //@line 5
 STACKTOP = STACKTOP + 15 & -16; //@line 6
 return ret | 0; //@line 8
}
function _wctomb($0, $1) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 var $$0 = 0;
 if (!$0) {
  $$0 = 0; //@line 2477
 } else {
  $$0 = _wcrtomb($0, $1, 0) | 0; //@line 2480
 }
 return $$0 | 0; //@line 2482
}
function dynCall_iiii(index, a1, a2, a3) {
 index = index | 0;
 a1 = a1 | 0;
 a2 = a2 | 0;
 a3 = a3 | 0;
 return FUNCTION_TABLE_iiii[index & 3](a1 | 0, a2 | 0, a3 | 0) | 0; //@line 7371
}
function ___udivdi3($a$0, $a$1, $b$0, $b$1) {
 $a$0 = $a$0 | 0;
 $a$1 = $a$1 | 0;
 $b$0 = $b$0 | 0;
 $b$1 = $b$1 | 0;
 return ___udivmoddi4($a$0, $a$1, $b$0, $b$1, 0) | 0; //@line 7189
}
function _fputs($0, $1) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 var $2 = 0;
 $2 = _strlen($0) | 0; //@line 604
 return ((_fwrite($0, 1, $2, $1) | 0) != ($2 | 0)) << 31 >> 31 | 0; //@line 608
}
function establishStackSpace(stackBase, stackMax) {
 stackBase = stackBase | 0;
 stackMax = stackMax | 0;
 STACKTOP = stackBase; //@line 20
 STACK_MAX = stackMax; //@line 21
}
function _out_655($0, $1, $2) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 $2 = $2 | 0;
 if (!(HEAP32[$0 >> 2] & 32)) {
  ___fwritex($1, $2, $0) | 0; //@line 1969
 }
 return;
}
function _main($0, $1) {
 $0 = $0 | 0;
 $1 = $1 | 0;
 _puts(1913) | 0; //@line 140
 _emscripten_asm_const_i(0) | 0; //@line 141
 return 0; //@line 142
}
function __ZSt15get_new_handlerv() {
 var $0 = 0;
 $0 = HEAP32[912] | 0; //@line 6919
 HEAP32[912] = $0 + 0; //@line 6921
 return $0 | 0; //@line 6923
}
function dynCall_ii(index, a1) {
 index = index | 0;
 a1 = a1 | 0;
 return FUNCTION_TABLE_ii[index & 1](a1 | 0) | 0; //@line 7364
}
function b1(p0, p1, p2) {
 p0 = p0 | 0;
 p1 = p1 | 0;
 p2 = p2 | 0;
 abort(1); //@line 7385
 return 0; //@line 7385
}
function _llvm_cttz_i32(x) {
 x = x | 0;
 return (x ? 31 - (Math_clz32(x ^ x - 1) | 0) | 0 : 32) | 0; //@line 6973
}
function dynCall_v(index) {
 index = index | 0;
 FUNCTION_TABLE_v[index & 0](); //@line 7378
}
function _isdigit($0) {
 $0 = $0 | 0;
 return ($0 + -48 | 0) >>> 0 < 10 | 0; //@line 517
}
function b0(p0) {
 p0 = p0 | 0;
 abort(0); //@line 7382
 return 0; //@line 7382
}
function _frexpl($0, $1) {
 $0 = +$0;
 $1 = $1 | 0;
 return +(+_frexp($0, $1));
}
function ___pthread_self_888() {
 return _pthread_self() | 0; //@line 3624
}
function stackRestore(top) {
 top = top | 0;
 STACKTOP = top; //@line 15
}
function _dummy($0) {
 $0 = $0 | 0;
 return $0 | 0; //@line 475
}
function ___lockfile($0) {
 $0 = $0 | 0;
 return 1; //@line 656
}
function ___errno_location() {
 return 3148; //@line 469
}
function stackSave() {
 return STACKTOP | 0; //@line 11
}
function _pthread_self() {
 return 720; //@line 522
}
function ___unlockfile($0) {
 $0 = $0 | 0;
 return;
}
function b2() {
 abort(2); //@line 7388
}
function _clearContexts() {
 return;
}

// EMSCRIPTEN_END_FUNCS
var FUNCTION_TABLE_ii = [b0,___stdio_close];
var FUNCTION_TABLE_iiii = [b1,___stdout_write,___stdio_seek,___stdio_write];
var FUNCTION_TABLE_v = [b2];

  return { __GLOBAL__sub_I_emscripten_cpp: __GLOBAL__sub_I_emscripten_cpp, ___errno_location: ___errno_location, ___muldi3: ___muldi3, ___udivdi3: ___udivdi3, _bitshift64Lshr: _bitshift64Lshr, _bitshift64Shl: _bitshift64Shl, _blendTexturesRun: _blendTexturesRun, _clearContexts: _clearContexts, _createContext: _createContext, _emscripten_replace_memory: _emscripten_replace_memory, _free: _free, _i64Add: _i64Add, _i64Subtract: _i64Subtract, _invertFrameRun: _invertFrameRun, _main: _main, _malloc: _malloc, _memcpy: _memcpy, _memset: _memset, _sbrk: _sbrk, dynCall_ii: dynCall_ii, dynCall_iiii: dynCall_iiii, dynCall_v: dynCall_v, establishStackSpace: establishStackSpace, stackAlloc: stackAlloc, stackRestore: stackRestore, stackSave: stackSave };
})
// EMSCRIPTEN_END_ASM
(asmGlobalArg, asmLibraryArg, buffer);

var __GLOBAL__sub_I_emscripten_cpp = Module["__GLOBAL__sub_I_emscripten_cpp"] = asm["__GLOBAL__sub_I_emscripten_cpp"];
var ___errno_location = Module["___errno_location"] = asm["___errno_location"];
var ___muldi3 = Module["___muldi3"] = asm["___muldi3"];
var ___udivdi3 = Module["___udivdi3"] = asm["___udivdi3"];
var _bitshift64Lshr = Module["_bitshift64Lshr"] = asm["_bitshift64Lshr"];
var _bitshift64Shl = Module["_bitshift64Shl"] = asm["_bitshift64Shl"];
var _blendTexturesRun = Module["_blendTexturesRun"] = asm["_blendTexturesRun"];
var _clearContexts = Module["_clearContexts"] = asm["_clearContexts"];
var _createContext = Module["_createContext"] = asm["_createContext"];
var _emscripten_replace_memory = Module["_emscripten_replace_memory"] = asm["_emscripten_replace_memory"];
var _free = Module["_free"] = asm["_free"];
var _i64Add = Module["_i64Add"] = asm["_i64Add"];
var _i64Subtract = Module["_i64Subtract"] = asm["_i64Subtract"];
var _invertFrameRun = Module["_invertFrameRun"] = asm["_invertFrameRun"];
var _main = Module["_main"] = asm["_main"];
var _malloc = Module["_malloc"] = asm["_malloc"];
var _memcpy = Module["_memcpy"] = asm["_memcpy"];
var _memset = Module["_memset"] = asm["_memset"];
var _sbrk = Module["_sbrk"] = asm["_sbrk"];
var establishStackSpace = Module["establishStackSpace"] = asm["establishStackSpace"];
var stackAlloc = Module["stackAlloc"] = asm["stackAlloc"];
var stackRestore = Module["stackRestore"] = asm["stackRestore"];
var stackSave = Module["stackSave"] = asm["stackSave"];
var dynCall_ii = Module["dynCall_ii"] = asm["dynCall_ii"];
var dynCall_iiii = Module["dynCall_iiii"] = asm["dynCall_iiii"];
var dynCall_v = Module["dynCall_v"] = asm["dynCall_v"];
;



// === Auto-generated postamble setup entry stuff ===

Module['asm'] = asm;



Module["ccall"] = ccall;





































































if (memoryInitializer) {
  if (!isDataURI(memoryInitializer)) {
    memoryInitializer = locateFile(memoryInitializer);
  }
  if (ENVIRONMENT_IS_NODE || ENVIRONMENT_IS_SHELL) {
    var data = Module['readBinary'](memoryInitializer);
    HEAPU8.set(data, GLOBAL_BASE);
  } else {
    addRunDependency('memory initializer');
    var applyMemoryInitializer = function(data) {
      if (data.byteLength) data = new Uint8Array(data);
      HEAPU8.set(data, GLOBAL_BASE);
      // Delete the typed array that contains the large blob of the memory initializer request response so that
      // we won't keep unnecessary memory lying around. However, keep the XHR object itself alive so that e.g.
      // its .status field can still be accessed later.
      if (Module['memoryInitializerRequest']) delete Module['memoryInitializerRequest'].response;
      removeRunDependency('memory initializer');
    }
    var doBrowserLoad = function() {
      Module['readAsync'](memoryInitializer, applyMemoryInitializer, function() {
        throw 'could not load memory initializer ' + memoryInitializer;
      });
    }
    if (Module['memoryInitializerRequest']) {
      // a network request has already been created, just use that
      var useRequest = function() {
        var request = Module['memoryInitializerRequest'];
        var response = request.response;
        if (request.status !== 200 && request.status !== 0) {
            // If you see this warning, the issue may be that you are using locateFile and defining it in JS. That
            // means that the HTML file doesn't know about it, and when it tries to create the mem init request early, does it to the wrong place.
            // Look in your browser's devtools network console to see what's going on.
            console.warn('a problem seems to have happened with Module.memoryInitializerRequest, status: ' + request.status + ', retrying ' + memoryInitializer);
            doBrowserLoad();
            return;
        }
        applyMemoryInitializer(response);
      }
      if (Module['memoryInitializerRequest'].response) {
        setTimeout(useRequest, 0); // it's already here; but, apply it asynchronously
      } else {
        Module['memoryInitializerRequest'].addEventListener('load', useRequest); // wait for it
      }
    } else {
      // fetch it from the network ourselves
      doBrowserLoad();
    }
  }
}



/**
 * @constructor
 * @extends {Error}
 * @this {ExitStatus}
 */
function ExitStatus(status) {
  this.name = "ExitStatus";
  this.message = "Program terminated with exit(" + status + ")";
  this.status = status;
};
ExitStatus.prototype = new Error();
ExitStatus.prototype.constructor = ExitStatus;

var calledMain = false;

dependenciesFulfilled = function runCaller() {
  // If run has never been called, and we should call run (INVOKE_RUN is true, and Module.noInitialRun is not false)
  if (!Module['calledRun']) run();
  if (!Module['calledRun']) dependenciesFulfilled = runCaller; // try this again later, after new deps are fulfilled
}

Module['callMain'] = function callMain(args) {

  args = args || [];

  ensureInitRuntime();

  var argc = args.length+1;
  var argv = stackAlloc((argc + 1) * 4);
  HEAP32[argv >> 2] = allocateUTF8OnStack(Module['thisProgram']);
  for (var i = 1; i < argc; i++) {
    HEAP32[(argv >> 2) + i] = allocateUTF8OnStack(args[i - 1]);
  }
  HEAP32[(argv >> 2) + argc] = 0;


  try {

    var ret = Module['_main'](argc, argv, 0);


    // if we're not running an evented main loop, it's time to exit
      exit(ret, /* implicit = */ true);
  }
  catch(e) {
    if (e instanceof ExitStatus) {
      // exit() throws this once it's done to make sure execution
      // has been stopped completely
      return;
    } else if (e == 'SimulateInfiniteLoop') {
      // running an evented main loop, don't immediately exit
      Module['noExitRuntime'] = true;
      return;
    } else {
      var toLog = e;
      if (e && typeof e === 'object' && e.stack) {
        toLog = [e, e.stack];
      }
      err('exception thrown: ' + toLog);
      Module['quit'](1, e);
    }
  } finally {
    calledMain = true;
  }
}




/** @type {function(Array=)} */
function run(args) {
  args = args || Module['arguments'];

  if (runDependencies > 0) {
    return;
  }


  preRun();

  if (runDependencies > 0) return; // a preRun added a dependency, run will be called later
  if (Module['calledRun']) return; // run may have just been called through dependencies being fulfilled just in this very frame

  function doRun() {
    if (Module['calledRun']) return; // run may have just been called while the async setStatus time below was happening
    Module['calledRun'] = true;

    if (ABORT) return;

    ensureInitRuntime();

    preMain();

    if (Module['onRuntimeInitialized']) Module['onRuntimeInitialized']();

    if (Module['_main'] && shouldRunNow) Module['callMain'](args);

    postRun();
  }

  if (Module['setStatus']) {
    Module['setStatus']('Running...');
    setTimeout(function() {
      setTimeout(function() {
        Module['setStatus']('');
      }, 1);
      doRun();
    }, 1);
  } else {
    doRun();
  }
}
Module['run'] = run;


function exit(status, implicit) {

  // if this is just main exit-ing implicitly, and the status is 0, then we
  // don't need to do anything here and can just leave. if the status is
  // non-zero, though, then we need to report it.
  // (we may have warned about this earlier, if a situation justifies doing so)
  if (implicit && Module['noExitRuntime'] && status === 0) {
    return;
  }

  if (Module['noExitRuntime']) {
  } else {

    ABORT = true;
    EXITSTATUS = status;

    exitRuntime();

    if (Module['onExit']) Module['onExit'](status);
  }

  Module['quit'](status, new ExitStatus(status));
}

var abortDecorators = [];

function abort(what) {
  if (Module['onAbort']) {
    Module['onAbort'](what);
  }

  if (what !== undefined) {
    out(what);
    err(what);
    what = JSON.stringify(what)
  } else {
    what = '';
  }

  ABORT = true;
  EXITSTATUS = 1;

  throw 'abort(' + what + '). Build with -s ASSERTIONS=1 for more info.';
}
Module['abort'] = abort;

if (Module['preInit']) {
  if (typeof Module['preInit'] == 'function') Module['preInit'] = [Module['preInit']];
  while (Module['preInit'].length > 0) {
    Module['preInit'].pop()();
  }
}

// shouldRunNow refers to calling main(), not run().
var shouldRunNow = true;
if (Module['noInitialRun']) {
  shouldRunNow = false;
}

  Module["noExitRuntime"] = true;

run();





// {{MODULE_ADDITIONS}}






//# sourceMappingURL=appWASM.js.map