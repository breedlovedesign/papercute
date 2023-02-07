# frozen_string_literal: true
module BreedloveDesign
  module Papercute
    class Traits
      
      include ColorUtils

      def initialize(item:, inherited_traits:)
        if item.material
          @fill_color = ColorUtils.material_to_color(item.material)
          @alpha =
            ColorUtils.su_color_alpha_to_f(color_obj: item.material.color)
          if color_by_material
            @edge_color = @fill_color
          else
            @edge_color = inherited_traits.edge_color
          end
        else
          if color_by_material
            @edge_color = @fill_color
          else
            @edge_color = inherited_traits.edge_color
          end
          @fill_color = inherited_traits.fill_color
          @edge_color = inherited_traits.edge_color
          @alpha = inherited_traits.alpha
        end
        if inherited_traits.visible
          # if the parent is visible use the item's visibility
          @visible = !item.hidden?
        else
          # otherwise, inherit visiblity from parent
          @visible = inherited_traits.visible
        end
      end

      attr_reader :fill_color, :tr, :edge_color, :alpha, :visible


      def color_by_material()
        # 1 = all same
        # 0 = by material
        # 2 = by axis
        code = Sketchup.active_model.rendering_options["EdgeColorMode"]
        code == 0
      end
    end # class Traits
  end # module Papercute
end # module BreedloveDesign
