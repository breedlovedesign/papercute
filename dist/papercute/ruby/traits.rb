# frozen_string_literal: true
module BreedloveDesign
  module Papercute
    class Traits
      
      include ColorUtils

      def initialize(item:, inherited_traits:)
        if item.material
          puts "here"
          @fill_color = ColorUtils.material_to_color(item.material)
        else
          puts "not here"
          puts inherited_traits.inspect
          @fill_color = inherited_traits.fill_color
        end
      end
      attr_reader :fill_color
    end # class Traits
  end # module Papercute
end # module BreedloveDesign
