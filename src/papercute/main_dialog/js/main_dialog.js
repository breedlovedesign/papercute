import Bridge from "./vendor/sketchup-bridge/bridge"
import PaperCore from "paper"

console.log("Hello from PaperJS")
console.log(PaperCore.version)


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
