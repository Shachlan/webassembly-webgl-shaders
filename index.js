import {
  startVideoStream,
  RegisterNativeTextureId,
  initTexture,
  updateTexture
} from "./createVideoStream";
import { clearContex, createContext, renderFrame } from "./videoRenderer";

let copyVideo = false;

/**
 *
 * @param {number} fps
 */
function createFrameRenderer(fps) {
  let wasStopped = false;
  let frameCount = 0;
  const fpsInterval = 1000 / fps;
  let now, elapsed;
  let then = performance.now();
  let startTime = then;
  let count = 0,
    seconds = 0;
  let drawCallback = () => {
    throw new Error("no draw callback provided!");
    return undefined;
  };
  let fpsCount = [];

  /**
   *
   * @param {() => any} callback - The drawing code.
   */
  function render(callback) {
    drawCallback = callback;
    renderFrame();
  }

  function renderFrame() {
    if (wasStopped) {
      return;
    }
    now = performance.now();
    elapsed = now - then;

    if (elapsed <= fpsInterval) {
      requestAnimationFrame(renderFrame);
      return;
    }
    count += 1;
    if ((now - startTime) / 1000 > seconds) {
      seconds += 1;
      fpsCount.push(count);
      count = 0;
    }
    then = now - (elapsed % fpsInterval);
    drawCallback();
    requestAnimationFrame(renderFrame);
  }
  function stop() {
    let sum = fpsCount.reduce((a, b) => {
      return a + b;
    });
    let average = sum / fpsCount.length;
    console.log(
      "stopped. average FPS was: ",
      average,
      " for: ",
      fpsCount.length,
      " frames"
    );
    wasStopped = true;
  }

  return {
    render,
    stop
  };
}

window.addEventListener("wasmLoaded", () => {
  console.log("wasmLoaded");

  /** @type {HTMLVideoElement} */
  const video1 = setupVideo("./dog.mp4");
  const canvas = document.getElementById("renderTarget");
  const gl = canvas.getContext("webgl");
  canvas.width = 1920;
  canvas.height = 1200;

  function createCanvas(textureId1) {
    createContext(canvas, 0, textureId1);
  }

  const texture1 = initTexture(gl);
  const textureId1 = RegisterNativeTextureId(texture1);
  createCanvas(textureId1);

  function render() {
    if (!copyVideo) {
      return;
    }
    updateTexture(gl, texture1, video1);

    renderFrame();
  }

  let frameRenderer = createFrameRenderer(30);
  video1.onended = frameRenderer.stop;
  frameRenderer.render(render);
});

function setupVideo(url) {
  const video = document.createElement("video");

  var playing = false;
  var timeupdate = false;

  video.autoplay = true;
  video.muted = true;
  video.loop = false;

  // Waiting for these 2 events ensures
  // there is data in the video

  video.addEventListener(
    "playing",
    function() {
      playing = true;
      checkReady();
    },
    true
  );

  video.addEventListener(
    "timeupdate",
    function() {
      timeupdate = true;
      checkReady();
    },
    true
  );

  video.src = url;
  video.play();

  function checkReady() {
    if (playing && timeupdate) {
      copyVideo = true;
    }
  }

  return video;
}
