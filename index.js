import createFrameRenderer from "./frameRenderer";
import { Subject, zip } from "rxjs";

import { createVideoStreamFromElement } from "./createVideoStream";
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
    const firstVideoSubject = new Subject();
    const secondVideoSubject = new Subject();
    const frameSubject = new Subject();
    const context = canvas.getContext("webgl");

    createFrameRenderer(30).render(() => frameSubject.next({}));

    const textureId1 = createVideoStreamFromElement(
      firstVideoElement,
      context,
      () => {
        firstVideoSubject.next({});
      }
    );
    const textureId2 = createVideoStreamFromElement(
      secondVideoElement,
      context,
      () => {
        secondVideoSubject.next({});
      }
    );

    zip(firstVideoSubject, secondVideoSubject, frameSubject).subscribe(images =>
      renderFrame()
    );
    createCanvas(textureId1, textureId2);
  });
});
