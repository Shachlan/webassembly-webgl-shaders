import { size as globalSize } from "./globals";

//
// copy the video texture
//
export function update_buffer(renderContext, buffer, video, array, tex) {
  renderContext.texImage2D(
    renderContext.TEXTURE_2D,
    0,
    renderContext.RGBA,
    renderContext.RGBA,
    renderContext.UNSIGNED_BYTE,
    video
  );
}

/**
 *
 * @param {HTMLVideoElement[]} videoElements
 * @param {function} frameCallback
 */
export function startVideoStream(videoElements) {
  const playPromises = videoElements.map(v => {
    return new Promise((resolve, reject) => {
      if (v.readyState === 4) {
        console.log("ready to play");
        resolve();
      } else {
        videoElement.onloadeddata = () => {
          resolve();
        };
      }
    });
  });
  Promise.all(playPromises).then(() => videoElements.forEach(v => v.play()));
}
