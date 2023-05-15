import Bridge from "./vendor/sketchup-bridge/bridge"
import PaperCore from "paper"

console.log("Hello from PaperJS")
console.log(PaperCore.version)

// write a support function here not exported but used in
// an exported function below
/**
 * @param {Object} renderData
 */
function drawStuff(renderData) {
  console.log(renderData)
}

/**
 * @param {Array} item
 */
function mkpt(item) {
  return new paper.Point(item)
}


export function setCanvasBackgroundColor() {
  Bridge.get('getBackgroundColor')
    .then(function (result) {
      let canv = document.getElementById('canvas');
      if (canv) {
        canv.style.backgroundColor = result
      } else {
        console.log("Missing canvas?");
      }
    });
}
// notice the exported function's name can, but is not required to
// match the parameter provided to Bridge.get
// this doesn't look DRY, Bridge.get('getRenderData'), get get?
// true enough but getRenderData has to appear on the ruby side
// as well, and there it is very helpful to emphasize
export function logRenderData() {
  Bridge.get('getRenderData')
    .then(function (result) {
        console.log("\n");
        console.log(result);
    });
}

export function renderToPaper() {
  Bridge.get('getRenderData').then(
    function (renderData) {
      drawStuff(renderData);
        console.log("end renderToPaper");
    }
  )
}

// ready to go, var paper = PaperCore FTW! (and paper.Raster)
function initLibs() {
  console.log("initialized PaperJS")
  let canvas = document.getElementsByTagName("canvas")[ 0 ];
  Bridge.get('settings').then(function (settings) {
    var paper = PaperCore
    canvas.width = settings.width;
    canvas.height = settings.height;
    canvas.style.backgroundColor = settings.backgroundColor;
    paper.install(window);
    paper.setup('canvas');
    var vector_layer = new paper.Layer({ "name": 'vector_layer' });
    vector_layer.activate();
    // renderAll();

  }).then(function () {
    // injectRasterToCanvas() // toggled off to facilitate evaluation of grouping and line width shenanigans
  })
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initLibs);
} else {
  initLibs();
}
