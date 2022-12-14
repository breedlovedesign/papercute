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
          @name = "model"
        when Sketchup::Group
          @parts = item.entities
          @tr = item.transformation
          @parent = parent
          @inheritable_traits = @parent.inheritable_traits
          @name = item.name + item.persistent_id.to_s
        when Sketchup::ComponentInstance
          @parent = parent
          @parts = item.definition.entities
          @tr = item.transformation
          @inheritable_traits = @parent.inheritable_traits
          if item.name
            if item.name.length == 0
              @name = "#{item.definition.name}" + "_" + item.persistent_id.to_s
            else
              @name = "#{item.name}" + "_" + item.persistent_id.to_s
            end
            @name.gsub!(/#/, "_")
          end
        end

        @children = set_children
      end

      attr_reader :children, :inheritable_traits, :tr, :total_tr, :name #, :items(collection_items)

      def is_leaf?()
        set_children.empty?
      end


      def is_model_node?()
        @item.is_a?(Sketchup::Model)
      end


      def set_children()
        @children ||
          @parts
            .select do |p|
              p.respond_to?(:entities) || p.respond_to?(:definition)
            end
            .collect { |p| Node.new(p, self) }
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

      def inspect
        parent = @parent ? "<parent:#{@parent.to_s}|" : "<"
        if @children.empty?
          parent + "self:" + @name + "_leaf" + ">"
        else
          parent + "self:" + @name + "|" + "kids:#{@children}>"
        end
      end

      def to_s
        @name
      end
    end
  end # module Papercute
end # module BreedloveDesign
