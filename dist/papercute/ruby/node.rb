# frozen_string_literal: true
module BreedloveDesign
  module Papercute
    class Node
      


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
          @parent = parent
          @inheritable_traits = @parent.inheritable_traits
        when Sketchup::ComponentInstance
          @parent = parent
          @parts = item.definition.entities
          @tr = item.transformation
          @inheritable_traits = @parent.inheritable_traits
        end
      end

      attr_reader :inheritable_traits, :tr, :total_tr #, :items(collection_items)

      def is_leaf?()
      end


      def is_model_node?()
        @item.is_a?(Sketchup::Model)
      end


      def children()
      end


      def parent()
      end


      def leaf_children()
      end


      def made_aware?()
      end


      def make_aware()
      end


      def do_ancestry()
      end


      def clumps()
      end


      def summary_outline()
      end


      def z_depth_sort_criteria()
      end
    end
  end # module Papercute
end # module BreedloveDesign
