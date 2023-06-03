# typed: true
module BreedloveDesign
  module Papercute
    class BaseTraits
      extend T::Sig
      include ColorUtils
      sig { params(model: Sketchup::Model).void }

      def initialize(model:)
        @edge_color = ColorUtils.default_edge_color
        @fill_color = ColorUtils.default_face_color
        if model.rendering_options["ModelTransparency"]
          print 'model.rendering_options["ModelTransparency"]: '
          puts model.rendering_options["ModelTransparency"]
          @alpha = 0.5
        else
          print 'model.rendering_options["ModelTransparency"]: '
          puts model.rendering_options["ModelTransparency"]
          @alpha = 1.0
        end
        @tr = IDENTITY
        # TODO: change rendering if item is hidden
        @inhreted_tr = IDENTITY
        @visible = true
        # TODO: change rendering according to model edit / display settings
      end

      attr_reader :fill_color, :tr, :edge_color, :alpha, :visible, :inhreted_tr
    end # class Traits
  end # module Papercute
end # module BreedloveDesign
