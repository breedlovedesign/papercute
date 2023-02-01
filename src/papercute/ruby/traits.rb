# typed: true
module BreedloveDesign
  module Papercute
    class Traits
      extend T::Sig
      include ColorUtils
      sig do
        params(
          item: T.any(Sketchup::Group, Sketchup::ComponentInstance),
          inherited_traits: Traits
        ).void
      end
      def initialize(item:, inherited_traits:)
        if item.material
          @fill_color = ColorUtils.material_to_color(item.material)
        else
          @fill_color = inherited_traits.fill_color
        end
      end
      attr_reader :fill_color
    end # class Traits
  end # module Papercute
end # module BreedloveDesign
