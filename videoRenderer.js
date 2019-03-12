import { ccallArrays } from "./wasm-arrays";

/**
 *
 * @param {HTMLCanvasElement} canvas
 * @param {number} index
 */
export function createContext(canvas, index, textureId1) {
  console.log(canvas.id);
  const idBuffer = Module._malloc(canvas.id.length + 1);
  stringToUTF8(canvas.id, idBuffer, canvas.id.length + 1);
  Module.ccall(
    "createContext",
    null,
    ["number", "number", "number", "number", "number"],
    [canvas.width, canvas.height, idBuffer, index, textureId1]
  );
}

export function clearContex() {
  Module.ccall("clearContexts", null, null, null);
}

/**
 *
 * @param {Uint8Array} firstImageData
 * @param {ImageData} secondImageData
 */
export function renderFrame() {
  Module.ccall("blendTexturesRun");
}
