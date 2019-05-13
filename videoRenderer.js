import { ccallArrays } from "./wasm-arrays";
import { size as globalSize } from "./globals";

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
    ["number", "number", "number", "number"],
    [canvas.width, canvas.height, 0.3, idBuffer]
  );
}

export function clearContex() {
  Module.ccall("clearContexts", null, null, null);
}

export function renderFrame(textureId1, textureId2, result, result_array) {
  Module.ccall(
    "invertFrameRun",
    null,
    ["number", "number"],
    [textureId1, result]
  );

  for (let i = 0; i < result_array.length; i++) {
    result_array.set([Module.HEAPU8[result + i]], i);
  }

  const img = new ImageData(result, globalSize.width, globalSize.height);
  ctx.putImageData(img, 0, 0);
}
