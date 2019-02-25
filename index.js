window.addEventListener("wasmLoaded", () => {
  console.log("wasmLoaded");

  /** @type {CanvasRenderingContext2D} */
  let previewCanvasContext;
  const canvasContainer = document.getElementById("canvasContainer");

  /** @type {HTMLInputElement} */
  const fileInput = document.getElementById("fileInput");
  const convert = document.getElementById("convert");

  const createCanvas = (id, index, width, height) => {
    const canvas = document.createElement("canvas");
    canvas.id = id;
    canvas.width = width;
    canvas.height = height;
    canvasContainer.appendChild(canvas);
    const context = canvas.getContext("webgl2");

    const idBuffer = Module._malloc(id.length + 1);
    stringToUTF8(id, idBuffer, id.length + 1);
    Module.ccall(
      "createContext",
      null,
      ["number", "number", "number", "number"],
      [width, height, idBuffer, index]
    );
  };

  const loadImage = src => {
    Module.ccall("clearContexts", null, null, null);

    const img = new Image();
    img.addEventListener("load", () => {
      const canvas = document.createElement("canvas");
      canvas.id = "previewCanvas";
      canvas.height = img.height;
      canvas.width = img.width;

      canvasContainer.innerHTML = "";
      previewCanvasContext = canvas.getContext("2d");
      previewCanvasContext.drawImage(img, 0, 0);
      canvasContainer.appendChild(canvas);

      createCanvas("textureLoad", 0, img.width, img.height);
      createCanvas("edgeDetect", 1, img.width, img.height);
    });

    img.src = src;
  };

  // Default image
  loadImage("image.png");

  // File input
  fileInput.addEventListener("change", event =>
    loadImage(URL.createObjectURL(event.target.files[0]))
  );

  convert.addEventListener("click", () => {
    /** @type {HTMLCanvasElement} */
    const previewCanvas = document.getElementById("previewCanvas");
    // Get imageData from the image
    const imageData = previewCanvasContext.getImageData(
      0,
      0,
      previewCanvas.width,
      previewCanvas.height
    ).data;

    // Pass the imageData to the C++ code
    ccallArrays("loadTexture", null, ["array"], [imageData], {
      heapIn: "HEAPU8"
    });
    ccallArrays("detectEdges", null, ["array"], [imageData], {
      heapIn: "HEAPU8"
    });
  });
});
