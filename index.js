import createFrameRenderer from "./frameRenderer";
import { Subject, zip } from "rxjs";

import {
  startVideoStream,
  RegisterNativeTextureId,
  initTexture,
  updateTexture
} from "./createVideoStream";
import { clearContex, createContext, renderFrame } from "./videoRenderer";

window.addEventListener("wasmLoaded", () => {
  console.log("wasmLoaded");

  /** @type {HTMLVideoElement} */
  const firstVideoElement = document.createElement("video");
  /** @type {HTMLVideoElement} */
  const secondVideoElement = document.createElement("video");
  const canvas = document.getElementById("renderTarget");
  canvas.width = 1920;
  canvas.height = 1080;
  const convert = document.getElementById("convert");

  function createCanvas() {
    createContext(canvas, 0);
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

    const texture1 = initTexture(context, context.TEXTURE0);
    const texture2 = initTexture(context, context.TEXTURE1);
    const textureId1 = RegisterNativeTextureId(texture1);
    const textureId2 = RegisterNativeTextureId(texture2);
    createCanvas();

    const frameRenderer = createFrameRenderer(60);
    frameRenderer.render(() => {
      updateTexture(context, texture1, firstVideoElement);
      updateTexture(context, texture2, secondVideoElement);
      renderFrame(textureId1 - 1, textureId2 - 1);
    });

    startVideoStream([firstVideoElement, secondVideoElement]);
    firstVideoElement.onended = frameRenderer.stop;
    secondVideoElement.onended = frameRenderer.stop;
  });
});
