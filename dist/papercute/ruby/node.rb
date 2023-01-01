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
          @name = "model_"
        when Sketchup::Group
          @parts = item.entities
          @tr = item.transformation
          @parent = parent
          @inheritable_traits = @parent.inheritable_traits
          @name = item.name + "_" + item.persistent_id.to_s + "_"
          @name.gsub!(/#/, "_")
          @name.gsub!(/\s/, "_")
        when Sketchup::ComponentInstance
          @parent = parent
          @parts = item.definition.entities
          @tr = item.transformation
          @inheritable_traits = @parent.inheritable_traits
          if item.name
            if item.name.length == 0
              @name =
                "#{item.definition.name}" + "_" + item.persistent_id.to_s + "_"
            else
              @name = "#{item.name}" + "_" + item.persistent_id.to_s + "_"
            end
            @name.gsub!(/#/, "_")
          end
        end
        @children = set_children.sort_by { |n| n.name }
        @children.sort_by! { |n| n.is_leaf? ? 1 : 0 }
        @name = "model" if @name == "model_" && @children.count == 0
      end

      attr_reader :children, :inheritable_traits, :tr, :total_tr, :name #, :items(collection_items)

      def is_leaf?()
        @children.empty?
      end


      def is_model_node?()
        @item.is_a?(Sketchup::Model)
      end


      def set_children()
        @parts
          .select { |p| p.respond_to?(:entities) || p.respond_to?(:definition) }
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
        self.graph
        # parent = @parent ? "<parent:#{@parent.to_s}|" : "<"
        # if @children.empty?
        #   parent + "self:" + @name + "leaf" + ">"
        # else
        #   parent + "self:" + @name + "|" + "kids:#{@children}>"
        # end
      end

      def graph(g: "", depth: 0)
        if @children.empty? && @name == "model"
          g = @name + "_(empty)"
        elsif @children.empty?
          depth += 1
          indent = "    " * depth
          g += "\n#{indent}<" + @name + "leaf" + ">"
          depth -= 1
        else
          depth += 1
          indent = "    " * depth
          kidword = @children.count == 1 ? "child" : "children"
          kidstuff = @children.collect { |c| c.graph(g: g, depth: depth) }
          g +=
            "\n#{indent}<" + @name + "(#{@children.count.to_s} #{kidword})" +
              indent + kidstuff.join
          depth -= 1
        end
        g
      end

      def to_s
        @name
      end
    end
  end # module Papercute
end # module BreedloveDesign
