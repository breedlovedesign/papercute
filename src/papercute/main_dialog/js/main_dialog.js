import Bridge from "./vendor/sketchup-bridge/bridge"
import PaperCore from "paper"

console.log("Hello from PaperJS")
console.log(PaperCore.version)

function renderClump(clump) {
  let saved_for_union = []
  for (let face of clump) {
    let obj = { "children": [] };
    let data = face.outer_loop_points;
    let olSegs = data.map(mkpt);
    let olPath = new paper.Path(olSegs);
    olPath.strokeColor = 'black';
    olPath.fillColor = 'green';
    olPath.closed = true;
    obj[ "children" ].push(olPath);
    let inners = face.inner_loops;
    for (let inner of inners) {
      let ilSegs = inner.map(mkpt);
      let ilPath = new paper.Path(ilSegs);
      ilPath.closed = true;
      obj.children.push(ilPath);
    };
    obj[ "fillColor" ] = face.fill_color;
    obj[ "strokeColor" ] = face.edge_color;
    console.log(`strokeColor: ${obj["strokeColor"]}`)
    let cpath = new paper.CompoundPath(obj);
    cpath.fillColor.alpha = face.alpha;
    cpath.strokeWidth = 4;
    cpath.strokeCap = 'round';
    cpath.strokeJoin = 'round';
    // hoverJitter(cpath, -10, -10);
    saved_for_union.push(cpath);
  }


  if (saved_for_union.length == 1){
    // console.log('one')
    var union_item = saved_for_union[0].clone({insert: true, deep: true})
  } else {
    console.log('more than one')
    var union_item = saved_for_union.reduce(unionize);
  }
  union_item.strokeWidth = 7;
  union_item.strokeColor = "#ffff00";
  let clump_group = new Group(saved_for_union);
  union_item.insertBelow(saved_for_union[ 0 ]);
  let partial_union_item = union_item.clone({ insert: true, deep: true })
  partial_union_item.strokeColor = ("orange");
  // partial_union_item.fillColor = "#f00"
  // hoverJitter(partial_union_item, 2, -2)
  // hoverJitter(union_item, -5, 2)
  let clump_results = { "clump_group": clump_group, "partial_union_item": partial_union_item }
  // console.log("clump_results:")
  // console.log(clump_results)
  // console.log("")
  return (clump_results)
}

function renderNode(node) {
  let children = node[ "children" ];
  let saved_for_node_group = [];
  let saved_for_node_union = [];
  children.forEach(function (child) {
    node_results = renderNode(child);
    saved_for_node_group.push(node_results[ "node_wide_group" ]);
    saved_for_node_union.push(node_results[ "node_wide_partial_union_item" ]);
  })
  var clumps = node[ 'clumps' ];
  clumps.forEach(function (clump) {
    let clump_results = renderClump(clump);
    // saved_for_union is just getting the outlines of clumps
    saved_for_node_group.push(clump_results[ "clump_group" ]);
    saved_for_node_union.push(clump_results[ "partial_union_item" ]);
  })
  var node_group = new Group(saved_for_node_group);
  let node_wide_union_item = saved_for_node_union.reduce(unionize);
  node_wide_union_item.strokeWidth = 21;
  node_wide_union_item.strokeColor = "#cf3300";
  // hoverJitter(node_wide_union_item, 3,3);
  console.log("");
  console.log("node_wide_union_item:");
  console.log(node_wide_union_item);
  let last_in_stack = saved_for_node_union[ 0 ];
  console.log("last_in_stack:");
  console.log(last_in_stack);
  console.log("");
  node_wide_union_item.insertBelow(last_in_stack);
  let node_wide_partial_union_item = node_wide_union_item.clone({ insert: false, deep: true });
  // node_wide_partial_union_item.st
  return { "node_wide_partial_union_item": node_wide_partial_union_item, "node_wide_group": node_group }
}

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
