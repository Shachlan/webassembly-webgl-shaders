import createFrameRenderer from "./frameRenderer";
import { Subject, zip } from "rxjs";

import { createVideoStreamFromElement } from "./createVideoStream";
import {
  clearContex,
  createContext,
  renderFrame,
  setup
} from "./videoRenderer";
import { size as globalSize } from "./globals";

window.addEventListener("wasmLoaded", () => {
  console.log("wasmLoaded");

  const canvasContainer = document.getElementById("canvasContainer");
  /** @type {HTMLVideoElement} */
  const firstVideoElement = document.createElement("video");
  /** @type {HTMLVideoElement} */
  const secondVideoElement = document.createElement("video");
  const canvas = document.createElement("canvas");
  const convert = document.getElementById("convert");

  firstVideoElement.addEventListener("loadeddata", () => {
    secondVideoElement.style.maxWidth = `${firstVideoElement.clientWidth}px`;
    secondVideoElement.style.maxHeight = `${firstVideoElement.clientHeight}px`;
  });

  secondVideoElement.addEventListener("loadeddata", () => {});

  function createCanvases() {
    canvasContainer.childNodes.forEach(c => canvasContainer.removeChild(c));
    const textureLoadCanvas = document.createElement("canvas");
    textureLoadCanvas.id = "textureLoad";
    textureLoadCanvas.width = globalSize.width;
    textureLoadCanvas.height = globalSize.height;
    canvasContainer.appendChild(textureLoadCanvas);

    createContext(textureLoadCanvas, 0);
  }

  function loadFirstVideo(src) {
    clearContex();
    firstVideoElement.src = src;
    createCanvases();
  }

  function loadSecondVideo(src) {
    secondVideoElement.src = src;
  }

  loadFirstVideo("./dog.mp4");
  loadSecondVideo("./race.mp4");

  convert.addEventListener("click", () => {
    const firstVideoSubject = new Subject();
    const secondVideoSubject = new Subject();
    const frameSubject = new Subject();
    const context = canvas.getContext("webgl");

    createFrameRenderer(30).render(() => frameSubject.next({}));

    setup();
    createVideoStreamFromElement(firstVideoElement, context, imageData => {
      firstVideoSubject.next(imageData);
    });
    createVideoStreamFromElement(secondVideoElement, context, imageData => {
      secondVideoSubject.next(imageData);
    });

    zip(firstVideoSubject, secondVideoSubject, frameSubject).subscribe(images =>
      renderFrame(images[0], images[1])
    );
  });
});
