# typed: true
module BreedloveDesign
  module Papercute
    module ColorUtils
      extend T::Sig

      # returns a string in this format "#RRGGBB"
      sig { params(color_obj: Sketchup::Color).returns(String) }
      def self.su_color_to_hex_str(color_obj:)
        "#" + color_obj.to_a[0..2].map { |c| format("%02X", c) }.join
      end

      sig { params(color_obj: Sketchup::Color).returns(Float) }
      def self.su_color_alpha_to_f(color_obj:)
        # color_obj = material.color
        color_obj.alpha / 255.0
      end

      # returns a string in this format "#RRGGBB"
      sig { params(material: Sketchup::Material).returns(String) }
      def self.material_to_color(material)
        su_color_to_hex_str(color_obj: material.color)
      end

      # returns a string in this format "#RRGGBB"
      sig { returns(String) }
      def self.default_edge_color
        # TODO: Respect rendering options on edges
        su_color_to_hex_str(
          color_obj: Sketchup.active_model.rendering_options["ForegroundColor"]
        )
      end

      sig { returns(String) }
      def self.default_face_color
        su_color_to_hex_str(
          color_obj: Sketchup.active_model.rendering_options["FaceFrontColor"]
        )
      end

      # returns a string in this format "#RRGGBB"
      sig { returns(String) }
      def self.background_color
        su_color_to_hex_str(
          color_obj: Sketchup.active_model.rendering_options["BackgroundColor"]
        )
      end
    end # module ColorUtils
  end # module Papercute
end # module BreedloveDesign
