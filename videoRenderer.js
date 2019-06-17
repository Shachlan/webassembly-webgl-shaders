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
  var skiaTexture1 = Module.ccall(
    "renderTextRun",
    "number",
    [
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number"
    ],
    [idBuffer, 0, 0, 50, 57, 57, 57, 255]
  );
  var skiaTexture1 = Module.ccall(
    "renderTextRun",
    "number",
    [
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number"
    ],
    [idBuffer, 70, 70, 20, 0, 0, 250, 255]
  );
  var skiaTexture2 = Module.ccall(
    "renderTextRun",
    "number",
    [
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number"
    ],
    [idBuffer, 130, 130, 70, 0, 0, 0, 255]
  );
  var skiaTexture3 = Module.ccall(
    "renderTextRun",
    "number",
    [
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number"
    ],
    [idBuffer, 250, 250, 10, 100, 0, 100, 255]
  );
  var skiaTexture4 = Module.ccall(
    "renderTextRun",
    "number",
    [
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number"
    ],
    [idBuffer, 350, 370, 100, 255, 128, 0, 255]
  );
  var skiaTexture5 = Module.ccall(
    "renderTextRun",
    "number",
    [
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number"
    ],
    [idBuffer, 500, 500, 60, 255, 0, 0, 255]
  );

  // Module.ccall("invertFrameRun", null, ["number"], [skiaTexture]);
  Module.ccall(
    "blendTexturesRun",
    null,
    [
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number",
      "number"
    ],
    [
      6,
      textureId1,
      skiaTexture1,
      skiaTexture2,
      skiaTexture3,
      skiaTexture4,
      skiaTexture5
    ]
  );
}
