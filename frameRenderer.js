/**
 *
 * @param {number} fps
 */
export default function createFrameRenderer(fps) {
  let stop = false;
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
    if (!stop) {
      requestAnimationFrame(renderFrame);
    }
    now = performance.now();
    elapsed = now - then;
    // console.log(`elapsed`, elapsed, now, then, fpsInterval);
    if (elapsed > fpsInterval) {
      count += 1;
      if ((now - startTime) / 1000 > seconds) {
        seconds += 1;
        console.log(`frames in latest second is ${count}`);
        count = 0;
      }
      then = now - (elapsed % fpsInterval);
      drawCallback();
    }
  }

  return {
    render
  };
}
