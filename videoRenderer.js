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

export function renderFrame(ctx, array1, array2, result_array) {
  for (let i = 0; i < result_array.length / 4; i++) {
    let target = i * 4;
    let source = i * 4;
    result_array[target] = 255 - array1[source];
    result_array[target + 1] = 255 - array1[source + 1];
    result_array[target + 2] = 255 - array1[source + 2];
    result_array[target + 3] = 255;
  }

  const img = new ImageData(result_array, globalSize.width, globalSize.height);
  ctx.putImageData(img, 0, 0);
}
