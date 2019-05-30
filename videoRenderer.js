import { ccallArrays } from "./wasm-arrays";

/**
 *
 * @param {HTMLCanvasElement} canvas
 * @param {number} index
 */
export function createContext(canvas, index) {
  console.log(canvas.id);
  const idBuffer = Module._malloc(canvas.id.length + 1);
  stringToUTF8(canvas.id, idBuffer, canvas.id.length + 1);
  Module.ccall(
    "createContext",
    null,
    ["number", "number", "number"],
    [canvas.width, canvas.height, idBuffer]
  );
}

export function clearContex() {
  Module.ccall("clearContexts", null, null, null);
}

let i = 0;

/**
 *
 * @param {Uint8Array} firstImageData
 * @param {ImageData} secondImageData
 */
export function renderFrame(textureId1, textureId2) {
  // Module.ccall("passthroughFrameRun", null, ["number"], [textureId1]);
  const text = "Hello, World  " + ++i;
  const idBuffer = Module._malloc(text.length + 1);
  stringToUTF8(text, idBuffer, text.length + 1);
  var skiaTexture = Module.ccall(
    "renderTextRun",
    "number",
    ["number"],
    [idBuffer]
  );
  // Module.ccall("invertFrameRun", null, ["number"], [skiaTexture]);
  Module.ccall(
    "blendTexturesRun",
    null,
    ["number", "number", "number"],
    [textureId1, skiaTexture, 0.5]
  );
}
