import Stats from "stats-js";

/**
 *
 * @param {number} fps
 */
export default function createFrameRenderer(fps) {
  var stats = new Stats();
  // stats.showPanel(1);
  // document.body.appendChild(stats.dom);
  let wasStopped = false;
  let frameCount = 0;
  const fpsInterval = 1000 / fps;
  let now, elapsed;
  let then = performance.now();
  let startTime = then;
  let count,
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
    stats.begin();
    if (wasStopped) {
      stats.end();
      return;
    }
    now = performance.now();
    elapsed = now - then;

    if (elapsed <= fpsInterval) {
      stats.end();
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
    stats.end();
    requestAnimationFrame(renderFrame);
  }
  function stop() {
    console.log("stopped. FPS was: ", fpsCount);
    wasStopped = true;
  }

  return {
    render,
    stop
  };
}
