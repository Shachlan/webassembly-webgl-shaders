import { size as globalSize } from "./globals";
import createFrameRenderer from "./frameRenderer";

import { startVideoStream, update_buffer } from "./createVideoStream";
import { clearContex, createContext, renderFrame } from "./videoRenderer";

window.addEventListener("wasmLoaded", () => {
  console.log("wasmLoaded");

  /** @type {HTMLVideoElement} */
  const firstVideoElement = document.createElement("video");
  /** @type {HTMLVideoElement} */
  const secondVideoElement = document.createElement("video");
  const canvas = document.getElementById("renderTarget");
  canvas.width = globalSize.width;
  canvas.height = globalSize.height;
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

  const array_size = globalSize.width * globalSize.height * 3;

  function make_array() {
    return new Uint8Array(globalSize.width * globalSize.height * 3);
  }

  function make_clamped_array() {
    return new Uint8ClampedArray(globalSize.width * globalSize.height * 4);
  }

  function make_buffer() {
    return Module._malloc(array_size);
  }

  function make_webgl_context(canvas) {
    const renderContext = canvas.getContext("webgl");
    const tex = renderContext.createTexture();
    renderContext.bindTexture(renderContext.TEXTURE_2D, tex);
    const fbo = renderContext.createFramebuffer();
    renderContext.bindFramebuffer(renderContext.FRAMEBUFFER, fbo);
    renderContext.viewport(0, 0, globalSize.width, globalSize.height);
    renderContext.framebufferTexture2D(
      renderContext.FRAMEBUFFER,
      renderContext.COLOR_ATTACHMENT0,
      renderContext.TEXTURE_2D,
      tex,
      0
    );
    return renderContext;
  }

  const canvas1 = document.createElement("canvas");
  canvas1.width = globalSize.width;
  canvas1.height = globalSize.height;
  const context1 = make_webgl_context(canvas1);
  const canvas2 = document.createElement("canvas");
  canvas2.width = globalSize.width;
  canvas2.height = globalSize.height;
  const context2 = make_webgl_context(canvas2);

  convert.addEventListener("click", () => {
    const context = canvas.getContext("2d");
    const buffer1 = make_buffer();
    const array1 = make_array();
    const buffer2 = make_buffer();
    const array2 = make_array();
    const result_buffer = make_buffer();
    const result_array = make_clamped_array();
    createCanvas();

    const frameRenderer = createFrameRenderer(60);
    frameRenderer.render(() => {
      update_buffer(context1, buffer1, firstVideoElement, array1);
      update_buffer(context2, buffer2, secondVideoElement, array2);
      renderFrame(context, buffer1, buffer2, result_buffer, result_array);
    });

    startVideoStream([firstVideoElement, secondVideoElement]);
    firstVideoElement.onended = frameRenderer.stop;
    secondVideoElement.onended = frameRenderer.stop;
  });
});
