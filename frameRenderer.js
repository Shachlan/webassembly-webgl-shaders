/**
 *
 * @param {number} fps
 */
export default function createFrameRenderer(fps) {
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
      console.log(`frames in latest second is ${count}`);
      count = 0;
    }
    then = now - (elapsed % fpsInterval);
    drawCallback();
    requestAnimationFrame(renderFrame);
  }
  function stop() {
    console.log("stopped");
    wasStopped = true;
  }

  return {
    render,
    stop
  };
}
