# typed: true
# @version SketchUp 6.0
module BreedloveDesign
  module Papercute
    class Sketchup::ConstructionPoint < Sketchup::Drawingelement
      extend T::Sig

      # Instance Methods

      # The position method is used to retrieve a Point3d used to create a
      # construction point.
      #
      # @example
      #   model = Sketchup.active_model
      #   entities = model.active_entities
      #   point1 = Geom::Point3d.new(10,0,0)
      #   constpoint = entities.add_cpoint point1
      #   # Returns 10,0,0
      #   position = constpoint.position
      #
      # @return point - the Point3d object used to create the
      #   ConstructionPoint
      #
      # @version SketchUp 6.0
      def position
      end
    end
  end # module Papercute
end # module BreedloveDesign
