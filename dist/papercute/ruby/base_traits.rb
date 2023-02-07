# frozen_string_literal: true
module BreedloveDesign
  module Papercute
    class BaseTraits
      
      include ColorUtils

      def initialize(model:)
        @edge_color = ColorUtils.default_edge_color
        @fill_color = ColorUtils.default_face_color
        # TODO: change alpha if rendering mode is set to X-ray
        @alpha = 1.0
        @tr = Geom::Transformation.new(0, 0, 0)
        @visible = true
      end
      attr_reader :fill_color, :tr, :edge_color, :alpha, :visible
    end # class Traits
  end # module Papercute
end # module BreedloveDesign
