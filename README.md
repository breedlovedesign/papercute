# this is a work in progress and not ready for installation :)

## SVG export from SketchUp
This is a SketchUp extension that exports 2D vector output.
</br>
![Preview1](./readme.png)

## What it Does

It attempts to reproduce SketchUp model hierarchy and visual style in SVG.

## What it Doesn't Do

It does not reproduce the functionality of SketchUp Pro's `export PDF` feature.
Nothing is clipped. Overlapping objects are rendered in their entirety.
Very little effort is made to sort the stacking order of objects.
Therefore, unless the 3D model is carefully crafted to work with this extension, there is almost no chance
the output would match SketchUp's builtin 2D output of any kind.

## Why Make This?

Vector output from 3D programs can be difficult to work with in vector drawing apps.
This extension won't make it easy, but it will make it difficult in a different, useful way.
Namely, it will allow manipulation of the vector output based on the grouping of the model.
