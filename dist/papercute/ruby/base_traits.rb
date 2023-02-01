# frozen_string_literal: true
module BreedloveDesign
  module Papercute
    class BaseTraits
      
      include ColorUtils

      def initialize(model:)
        color_obj = model.rendering_options["FaceFrontColor"]
        @fill_color = ColorUtils.su_color_to_hex_str(color_obj: color_obj)
      end
      attr_reader :fill_color
    end # class Traits
  end # module Papercute
end # module BreedloveDesign
