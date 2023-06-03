# frozen_string_literal: true
module BreedloveDesign
  module Papercute
    class Node
      



      def initialize(item, parent)
        @item = item
        @clumps = []
        case item
        when Sketchup::Model
          @parts = item.entities
          @inheritable_traits = BaseTraits.new(model: item)
          @inherited_traits = @inheritable_traits
          @name = "model_"
        when Sketchup::Group
          @parts = item.entities
          @parent = parent
          @inherited_traits = @parent.inheritable_traits
          @inheritable_traits =
            Traits.new(item: item, inherited_traits: @inherited_traits)
          @name = item.name + "_" + item.persistent_id.to_s + "_"
          @name.gsub!(/#/, "_")
          @name.gsub!(/\s/, "_")
        when Sketchup::ComponentInstance
          @parent = parent
          @parts = item.definition.entities
          @inherited_traits = @parent.inheritable_traits
          @inheritable_traits =
            Traits.new(item: item, inherited_traits: @inherited_traits)
          if item.name
            if item.name.length == 0
              @name =
                "#{item.definition.name}" + "_" + item.persistent_id.to_s + "_"
            else
              @name = "#{item.name}" + "_" + item.persistent_id.to_s + "_"
            end
            @name.gsub!(/#/, "_")
            @name.gsub!(/\s/, "_")
          end
        end

        @faces = get_faces

        if @faces.empty?
          @clumps = []
        else
          get_clumps(
            faces: @faces,
            ent_id: @name,
            inherited_color: @inheritable_traits.fill_color,
            # inherited_color: @inheritable_traits.fill_color,
          )
        end

        @children = set_children.sort_by { |n| n.name }
        @children.sort_by! { |n| n.is_leaf? ? 1 : 0 }
        @name = "model" if @name == "model_" && @children.count == 0
      end



      def clumps()
        @clumps
      end

      # attr_reader :children, :inheritable_traits, :tr, :total_tr, :name
      attr_reader :children, :inheritable_traits, :name


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



      def get_faces
        @parts.select { |part| part.is_a? Sketchup::Face }
      end



      def leaf_children()
        @children.select { |child| child.is_leaf? }
      end



      def get_clumps(
        faces:,
        ent_id:,
        inherited_color:,
        groups_of_connected_front_facing_faces: []
      )
        unprocessed_faces =
          faces.reject { |f| Sorter.rear_facing?(f, @inheritable_traits.tr) }
        clump_seed = unprocessed_faces.shift
        if clump_seed
          clump_of_faces =
            clump_seed.all_connected.select { |ent| ent.is_a?(Sketchup::Face) }
          clump_of_front_faces =
            clump_of_faces.reject do |face|
              Sorter.rear_facing?(face, @inheritable_traits.tr)
            end
          unless groups_of_connected_front_facing_faces.include?(
            clump_of_front_faces
          )
            groups_of_connected_front_facing_faces << clump_of_front_faces
          end
          unprocessed_faces -= clump_of_front_faces

          get_clumps faces: unprocessed_faces,
                     ent_id: ent_id,
                     inherited_color: inherited_color,
                     groups_of_connected_front_facing_faces: groups_of_connected_front_facing_faces
        else
          thing = groups_of_connected_front_facing_faces[0]
          if thing
            thing.sort_by! do |face|
              # puts "face.inspect: " + face.inspect
              [
                Sorter.largest_z(face),
                Sorter.largest_x(face),
                Sorter.largest_y(face),
              ]
            end
          else
            puts "groups_of_connected_front_facing_faces.inspect: " +
                   groups_of_connected_front_facing_faces.inspect
          end

          @clumps =
            groups_of_connected_front_facing_faces.collect do |group_of_faces|
              Clump.new(
                faces: group_of_faces,
                inherited_traits: @inheritable_traits,
                ent_id: ent_id,
              )
            end
        end
      end



      def summary_outline()
      end



      def z_depth_sort_criteria()
      end

      def inspect
        # #inspect does not like to be recursive
        self.graph
      end



      def graph(g: "", depth: 0)
        if @children.empty? && is_model_node?
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

      def provide_js_ready_model_data
        clumps = @clumps.collect do |clump|
          clump.faces2d
        end
        node_face_color = @inherited_traits.fill_color
        node_edge_color = @inherited_traits.edge_color
        children = @children.collect do |child_node|
          child_node.provide_js_ready_model_data
        end
        {
          clumps: clumps,
          nodeFillColor: node_face_color,
          nodeEdgeColor: node_edge_color,
          children: children,
        }
      end
    end
  end # module Papercute
end # module BreedloveDesign
