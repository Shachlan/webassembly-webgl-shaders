import createFrameRenderer from "./frameRenderer";
import { Subject, zip } from "rxjs";
import size from "./globals.js";

import {
  startVideoStream,
  RegisterNativeTextureId,
  initTexture,
  updateTexture
} from "./createVideoStream";
import { clearContex, createContext, renderFrame } from "./videoRenderer";

window.addEventListener("wasmLoaded", () => {
  console.log("wasmLoaded");

  const worker = new Worker("./node_modules/webm-wasm/dist/webm-worker.js");
  // 2. Send the path to the `.wasm` file
  worker.postMessage("./node_modules/webm-wasm/dist/webm-wasm.wasm");

  /** @type {HTMLVideoElement} */
  const firstVideoElement = document.createElement("video");
  /** @type {HTMLVideoElement} */
  const secondVideoElement = document.createElement("video");
  const canvas = document.getElementById("renderTarget");
  canvas.width = 1920;
  canvas.height = 1080;
  const convert = document.getElementById("convert");

  function createCanvas(textureId1, textureId2) {
    createContext(canvas, 0, textureId1, textureId2);
  }

  function loadFirstVideo(src) {
    clearContex();
    firstVideoElement.src = src;
  }

  function loadSecondVideo(src) {
    secondVideoElement.src = src;
  }

  loadFirstVideo("./dog.mp4");
  loadSecondVideo("./race.mp4");

  convert.addEventListener("click", () => {
    const context = canvas.getContext("webgl");

    const texture1 = initTexture(context);
    const texture2 = initTexture(context);
    const textureId1 = RegisterNativeTextureId(texture1);
    const textureId2 = RegisterNativeTextureId(texture2);
    createCanvas(textureId1, textureId2);
    worker.postMessage({
      width: size.width,
      height: size.height
    });

    const frameRenderer = createFrameRenderer(30);
    frameRenderer.render(() => {
      updateTexture(context, texture1, firstVideoElement);
      updateTexture(context, texture2, secondVideoElement);
      renderFrame();
    });

    startVideoStream([firstVideoElement, secondVideoElement]);
    firstVideoElement.onended = frameRenderer.stop;
    secondVideoElement.onended = frameRenderer.stop;
  });
});
