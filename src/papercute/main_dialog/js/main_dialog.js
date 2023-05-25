import Bridge from "./vendor/sketchup-bridge/bridge"
import PaperCore from "paper"

// console.log("Hello from PaperJS")
// console.log(PaperCore.version)

/**
 * @param  {paper.PathItem} returned
 * @param  {paper.PathItem} faceToAdd
 */
function unionize(returned, faceToAdd) {
    return returned.unite(faceToAdd, { insert: false });
}

/**
 * @param  {Clump} clump
 */
function renderClump(clump) {
    /** @var { paper.Path[]} savedForUnion */
    let savedForUnion = []
    for (let face of clump) {
        /** @type {{ children: paper.Path[]}} */
        let obj = { children: [] };
        let data = face.outerLoopPoints;
        /**
         * @var  {paper.Point[]} outerLoopSegments
         */
        let outerLoopSegments = data.map(mkpt);
        let outerLoopPath = new paper.Path(outerLoopSegments);
        // All properties and functions that expect color values in the form
        // of instances of paper.Color objects, also accept named colors and hex
        // values as strings which are then converted to instances of Color internally.
        // @ts-ignore
        outerLoopPath.strokeColor = face.edgeColor;
        // @ts-ignore
        outerLoopPath.fillColor = face.fillColor;
        outerLoopPath.closed = true;
        // console.log(face)
        obj[ "children" ].push(outerLoopPath);
        face.innerLoops.forEach(function (innerLoop) {
            let innerLoopSegments = innerLoop.map(mkpt);
            let innerLoopPath = new paper.Path(innerLoopSegments);
            innerLoopPath.closed = true;
            obj.children.push(innerLoopPath);
        });

        obj[ "fillColor" ] = face.fillColor;
        obj[ "strokeColor" ] = face.edgeColor;
        // console.log(`strokeColor: ${obj[ "strokeColor" ]}`)
        /** @var {paper.pathItem} cpath */
        let cpath = new paper.CompoundPath(obj);
        let colorObject = new paper.Color(face.fillColor)
        cpath[ "fillColor" ] = colorObject;
        cpath.fillColor.alpha = face.alpha;
        // console.log(`fillColor: ${colorObject}`)

        cpath.strokeWidth = 4;
        cpath.strokeCap = 'round';
        cpath.strokeJoin = 'round';
        // hoverJitter(cpath, -10, -10);
        savedForUnion.push(cpath);
    }

    if (savedForUnion.length == 0) {
        console.log('zero')
        console.log(savedForUnion[ 0 ])
        var unionItem = savedForUnion[ 0 ].clone({ insert: true, deep: true })
    } else if (savedForUnion.length == 1) {
        // console.log('one')
        // console.log(savedForUnion[ 0 ])
        var unionItem = savedForUnion[ 0 ].clone({ insert: true, deep: true })
    } else {
        // console.log('more than one')
        // console.log(savedForUnion)
        var unionItem = savedForUnion.reduce((previousValue, currentValue, currentIndex, array) => {
            // console.log(previousValue);
            // console.log(currentValue);
            // console.log(currentIndex);
            // console.log(array);

            return unionize(previousValue, currentValue)
        });
    }
    unionItem.strokeWidth = 7;
    var colorObject = new paper.Color("#ffff00");
    unionItem.strokeColor = colorObject;
    let clumpGroup = new paper.Group(savedForUnion);
    unionItem.insertBelow(savedForUnion[ 0 ]);
    let partialUnionItem = unionItem.clone({ insert: true, deep: true })

    var colorObject = new paper.Color("orange");
    partialUnionItem.strokeColor = colorObject;
    // partialUnionItem.fillColor = "#f00"
    // hoverJitter(partialUnionItem, 2, -2)
    // hoverJitter(unionItem, -5, 2)
    let clumpResults = { "clumpGroup": clumpGroup, "partialUnionItem": partialUnionItem }
    // console.log("clumpResults:")
    // console.log(clumpResults)
    // console.log("")
    return (clumpResults)
}

/**
 * @param  {PaperCuteNode} node
 * @returns nodeGroup
 */
function renderNode(node) {
    let children = node[ "children" ];
    let savedForNodeGroup = [];
    let savedForNodeUnion = [];
    children.forEach(function (child) {
        let nodeResults = renderNode(child);
        savedForNodeGroup.push(nodeResults[ "nodeWideGroup" ]);
        savedForNodeUnion.push(nodeResults[ "nodeWidePartialUnionItem" ]);
    })
    var clumps = node[ 'clumps' ];
    clumps.forEach(function (clump) {
        let clumpResults = renderClump(clump);
        // savedForUnion is just getting the outlines of clumps
        savedForNodeGroup.push(clumpResults[ "clumpGroup" ]);
        savedForNodeUnion.push(clumpResults[ "partialUnionItem" ]);
    })
    var nodeGroup = new paper.Group(savedForNodeGroup);

    if (savedForNodeUnion.length == 0) {
        console.log('zero')
        console.log(savedForNodeUnion[ 0 ])
        var nodeWideUnionItem = savedForNodeUnion[ 0 ].clone({ insert: true, deep: true })
    } else if (savedForNodeUnion.length == 1) {
        // console.log('one')
        // console.log(savedForNodeUnion[ 0 ])
        var nodeWideUnionItem = savedForNodeUnion[ 0 ].clone({ insert: true, deep: true })
    } else {
        // console.log('more than one')
        // console.log(savedForNodeUnion)
        var nodeWideUnionItem = savedForNodeUnion.reduce((previousValue, currentValue, currentIndex, array) => {
            // console.log(previousValue);
            // console.log(currentValue);
            // console.log(currentIndex);
            // console.log(array);

            return unionize(previousValue, currentValue)
        });
    }


    nodeWideUnionItem.strokeWidth = 21;
    nodeWideUnionItem.strokeColor = "#cf3300";
    // hoverJitter(nodeWideUnionItem, 3,3);
    // console.log("");
    // console.log("nodeWideUnionItem:");
    // console.log(nodeWideUnionItem);
    let lastInStack = savedForNodeUnion[ 0 ];
    // console.log("lastInStack:");
    // console.log(lastInStack);
    // console.log("");
    nodeWideUnionItem.insertBelow(lastInStack);
    let nodeWidePartialUnionItem = nodeWideUnionItem.clone({ insert: false, deep: true });
    var renderNodeOutput = { "nodeWidePartialUnionItem": nodeWidePartialUnionItem, "nodeWideGroup": nodeGroup }
    return renderNodeOutput
}
/**
* Represents a 2D point as an array.
* @typedef {number[]} Point - [x,y]
*/

/**
* Represents a polyline with a minimum of 3 vertices.
* @typedef {Point[]} Polyline
*/

/**
* Represents a face.
* @typedef {Object} Face - represents a 2D projection of a SketchUp Face
* @property {Polyline} outerLoopPoints - the outline of the shape
* @property {Polyline[]} innerLoops - zero or more holes in the outerloop
* @property {Number} alpha - 0.0 to 1.0, transparent to opaque
* @property {String} edgeColor - '#FF0000' for example
* @property {String} fillColor - '#FF0000' for example
*/

/**
* Represents a Clump, which is a set of contiguous faces within a Model,
* Group, or ComponentInstance
* @typedef  {Face[]} Clump
*/

/**
* Nodes unifiy SketchUp Models, Groups, and ComponentInstances for
* the purpose of rendering in 2D
* @typedef {Object} PaperCuteNode
* @property {PaperCuteNode[]} children
* @property {Clump[]} clumps - An array of <Clump>
* @property {String} nodeEdgeColor - '#FF0000' for example
* @property {String} nodeFillColor - '#FF0000' for example
/*

/**
* @param {Point} pt
*/
function mkpt(pt) {
    return new paper.Point(pt)
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
            // console.log("\n");
            // console.log(result);
        });
}

export function renderToPaper() {
    Bridge.get('getRenderData')
        .then(
            /**
             * @param {PaperCuteNode} renderData
             */
            function (renderData) {
                // console.log(renderData)
                renderNode(renderData);
                // console.log("end renderToPaper");
            });
}

// ready to go, var paper = PaperCore FTW! (and paper.Raster)
function initLibs() {
    // console.log("initialized PaperJS")
    let canvas = document.getElementsByTagName("canvas")[ 0 ];
    Bridge.get('settings').then(function (settings) {
        var paper = PaperCore
        canvas.width = settings.width;
        canvas.height = settings.height;
        canvas.style.backgroundColor = settings.backgroundColor;
        paper.install(window);
        paper.setup('canvas');
        var vectorLayer = new paper.Layer({ "name": 'vectorLayer' });
        vectorLayer.activate();
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
