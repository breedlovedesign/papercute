import Bridge from "./vendor/sketchup-bridge/bridge"
import PaperCore from "paper"

// TODO: get node-wide unions to render for all nodes, not just the last node processed
// TODO: sort out transformation code in ruby so stuff ends up in the right places

// console.log("Hello from PaperJS")
// console.log(PaperCore.version)

/**
 * Creates, but does not insert, a PaperJS polyline
 * @param  {paper.PathItem} returned
 * @param  {paper.PathItem} faceToAdd
 */
function unionize(returned, faceToAdd) {
    return returned.unite(faceToAdd, { insert: false });
}

/**
 * This does 3 things. Please refactor.
 * 1. renders each face of a clump to a polyline
 * 2. boolean unions those faces to a new polyline
 * 3. delivers the output to be used in further boolean operations
 * @param  {Clump} clump
 * @param  {paper.Color} ambientFillColor
 * @param  {paper.Color} ambientEdgeColor
 * @param  {Number} ambientAlpha
 */
function renderClump(clump, ambientFillColor, ambientEdgeColor, ambientAlpha) {
    /** @var { paper.Path[] } savedForUnion */
    let savedForUnion = []
    for (let face of clump) {
        /** @type {{ children: paper.Path[] }} */
        let obj = { children: [] };
        let data = face.outerLoopPoints;
        let clumpDefaultFillColor = ambientFillColor
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
        // cpath.fillColor.alpha = 0.1;
        // console.log(`fillColor: ${colorObject}`)

        cpath.strokeWidth = 4;
        cpath.strokeCap = 'round';
        cpath.strokeJoin = 'round';
        // hoverJitter(cpath, -10, -10);
        savedForUnion.push(cpath);
    }

    if (savedForUnion.length > 1) {
        console.log('clump savedForUnion length more than one')
        console.log(savedForUnion)
        // @ts-ignore
        var unionItem = savedForUnion.reduce((previousValue, currentValue) => {
            return unionize(previousValue, currentValue)
        });
    } else {
        console.log('clump savedForUnion length one')
        console.log(savedForUnion[ 0 ])
        var unionItem = savedForUnion[ 0 ].clone({ insert: true, deep: true })
    }
    unionItem.strokeWidth = 7;
    // var colorObject = new paper.Color("#ffff00");
    unionItem.strokeColor = ambientEdgeColor;
    let clumpGroup = new paper.Group(savedForUnion);
    unionItem.insertBelow(savedForUnion[ 0 ]);
    let partialUnionItem = unionItem.clone({ insert: true, deep: true })

    // var colorObject = new paper.Color("purple");
    partialUnionItem.strokeColor = ambientFillColor;
    // @ts-ignore
    partialUnionItem.alpha = ambientAlpha
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
    let noclumps = node.clumps.length == 0
    let nochildren = node.children.length == 0
    if (noclumps && nochildren) {
        console.log('empty model')
        return
    } else {
        console.log(`clumps: ${node.clumps.length}, children: ${node.children.length}`)
    }

    let nodeWideStrokeColor = node.nodeEdgeColor;
    let nodeWideFillColor = node.nodeFillColor;
    let children = node[ "children" ];
    let savedForNodeGroup = [];
    let savedForNodeUnion = [];
    children.forEach(function (child) {
        let nodeResults = renderNode(child);
        if (nodeResults != undefined) {
            savedForNodeGroup.push(nodeResults[ "nodeWideGroup" ]);
            savedForNodeUnion.push(nodeResults[ "nodeWidePartialUnionItem" ]);
        }
    })
    var clumps = node[ 'clumps' ];
    let ambientFillColor = new paper.Color(node[ "nodeFillColor" ]);
    let ambientEdgeColor = new paper.Color(node[ "nodeEdgeColor" ]);
    let ambientAlpha = node[ "nodeAlpha" ];
    clumps.forEach(function (clump) {
        let clumpResults = renderClump(clump, ambientEdgeColor, ambientFillColor, ambientAlpha);
        // savedForUnion is just getting the outlines of clumps
        savedForNodeGroup.push(clumpResults[ "clumpGroup" ]);
        savedForNodeUnion.push(clumpResults[ "partialUnionItem" ]);
    })
    var nodeGroup = new paper.Group(savedForNodeGroup);

    if (savedForNodeUnion.length == 0) {
        console.log('zero')
        // console.log(savedForNodeUnion[ 0 ])
        // var nodeWideUnionItem = savedForNodeUnion[ 0 ].clone({ insert: true, deep: true })
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
    nodeWideUnionItem.strokeColor = node.nodeEdgeColor;
    nodeWideUnionItem.fillColor = node.nodeFillColor;
    nodeWideUnionItem.translate(new paper.Point(22, 22))

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
            console.log("\n");
            console.log(result);
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
