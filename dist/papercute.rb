# typed: false
require "sketchup.rb"
require "extensions.rb"

ext =
  SketchupExtension.new(
    "Papercute Extension",
    File.join("papercute", "main.rb")
  )

ext.creator = "John Breedlove"
ext.version = "0.0.1"
ext.copyright = "2022, John Breedlove"
ext.description =
  "Warning: Naive & Slow implementation! Render SketchUp model to 2D vector via PaperJS."

Sketchup.register_extension(ext, true)
