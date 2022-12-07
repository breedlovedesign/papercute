# typed: true
module BreedloveDesign
  module Papercute
    class Node
      extend T::Sig

      sig do
        params(
          item:
            T.any(
              Sketchup::Model,
              Sketchup::Group,
              Sketchup::ComponentInstance
            ),
          parent: T.nilable(Node)
        ).void
      end
      def initialize(item, parent)
        @item = item
        case item
        when Sketchup::Model
          @parts = item.entities
          @tr = IDENTITY
          @inheritable_traits = {}
        when Sketchup::Group
          @parts = item.entities
          @tr = item.transformation
          @parent = T.must(parent)
          @inheritable_traits = @parent.inheritable_traits
        when Sketchup::ComponentInstance
          @parent = T.must(parent)
          @parts = item.definition.entities
          @tr = item.transformation
          @inheritable_traits = @parent.inheritable_traits
        end
      end

      attr_reader :inheritable_traits, :tr, :total_tr #, :items(collection_items)
      sig { returns(NilClass) }
      def is_leaf?()
      end

      sig { returns(T::Boolean) }
      def is_model_node?()
        @item.is_a?(Sketchup::Model)
      end

      sig { returns(NilClass) }
      def children()
      end

      sig { returns(NilClass) }
      def parent()
      end

      sig { returns(NilClass) }
      def leaf_children()
      end

      sig { returns(NilClass) }
      def made_aware?()
      end

      sig { returns(NilClass) }
      def make_aware()
      end

      sig { returns(NilClass) }
      def do_ancestry()
      end

      sig { returns(NilClass) }
      def clumps()
      end

      sig { returns(NilClass) }
      def summary_outline()
      end

      sig { returns(NilClass) }
      def z_depth_sort_criteria()
      end
    end
  end # module Papercute
end # module BreedloveDesign
