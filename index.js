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
  const canvas = document.getElementById("renderTarget");
  canvas.width = 1920;
  canvas.height = 1080;
  const convert = document.getElementById("convert");

  function createCanvas(textureId1) {
    createContext(canvas, 0, textureId1);
  }

  function loadFirstVideo(src) {
    clearContex();
    firstVideoElement.src = src;
  }

  loadFirstVideo("./dog.mp4");

  convert.addEventListener("click", () => {
    const context = canvas.getContext("webgl");

    const texture1 = initTexture(context);
    const textureId1 = RegisterNativeTextureId(texture1);
    createCanvas(textureId1);

    createFrameRenderer(30).render(() => {
      updateTexture(context, texture1, firstVideoElement);
      renderFrame();
    });

    startVideoStream([firstVideoElement]);
  });
});
