# typed: true
module BreedloveDesign
  module Papercute
    class BaseTraits
      extend T::Sig
      include ColorUtils
      sig { params(model: Sketchup::Model).void }
      def initialize(model:)
        color_obj = model.rendering_options["FaceFrontColor"]
        @fill_color = ColorUtils.su_color_to_hex_str(color_obj: color_obj)
      end
      attr_reader :fill_color
    end # class Traits
  end # module Papercute
end # module BreedloveDesign
