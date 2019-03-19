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
  canvas.width = 640;
  canvas.height = 480;
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
