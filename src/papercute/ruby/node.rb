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
          @name = "model_"
        when Sketchup::Group
          @parts = item.entities
          @tr = item.transformation
          @parent = T.must(parent)
          @inheritable_traits = @parent.inheritable_traits
          @name = item.name + "_" + item.persistent_id.to_s + "_"
          @name.gsub!(/#/, "_")
          @name.gsub!(/\s/, "_")
        when Sketchup::ComponentInstance
          @parent = T.must(parent)
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

        @clumps = @parts.select { |part| }

        @children = set_children.sort_by { |n| n.name }
        @children.sort_by! { |n| n.is_leaf? ? 1 : 0 }
        @name = "model" if @name == "model_" && @children.count == 0
      end

      attr_reader :children, :inheritable_traits, :tr, :total_tr, :name #, :items(collection_items)
      sig { returns(T::Boolean) }
      def is_leaf?()
        @children.empty?
      end

      sig { returns(T::Boolean) }
      def is_model_node?()
        @item.is_a?(Sketchup::Model)
      end

      sig { returns(T::Array[Node]) }
      def set_children()
        @parts
          .select { |p| p.respond_to?(:entities) || p.respond_to?(:definition) }
          .collect { |p| Node.new(p, self) }
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

      sig do
        params(
          faces: T::Array[Sketchup::Face],
          enclosing_tr: Geom::Transformation,
          depth: Numeric,
          ent_id: String,
          inherited_color: String,
          groups_of_connected_front_facing_faces:
            T::Array[T::Array[Sketchup::Face]]
        ).returns(T::Array[BreedloveDesign::Papercute::Clump])
      end
      def get_clumps(
        faces:,
        enclosing_tr:,
        depth:,
        ent_id:,
        inherited_color:,
        groups_of_connected_front_facing_faces: []
      )
        unprocessed_faces =
          faces.reject { |f| Sorter.rear_facing?(f, enclosing_tr) }
        clump_seed = unprocessed_faces.shift
        if clump_seed
          clump_of_faces =
            clump_seed.all_connected.select { |ent| ent.is_a?(Sketchup::Face) }
          clump_of_front_faces =
            clump_of_faces.reject do |face|
              Sorter.rear_facing?(face, enclosing_tr)
            end
          unless groups_of_connected_front_facing_faces.include?(
                   clump_of_front_faces
                 )
            groups_of_connected_front_facing_faces << clump_of_front_faces
          end
          unprocessed_faces -= clump_of_front_faces
          depth += 1

          get_clumps faces: unprocessed_faces,
                     enclosing_tr: enclosing_tr,
                     depth: depth,
                     ent_id: ent_id,
                     inherited_color: inherited_color,
                     groups_of_connected_front_facing_faces:
                       groups_of_connected_front_facing_faces
        else
          thing = groups_of_connected_front_facing_faces[0]
          if thing
            thing.sort_by! do |face|
              [
                Sorter.largest_z(face),
                Sorter.largest_x(face),
                Sorter.largest_y(face)
              ]
            end
          else
          end
          clump_objects =
            groups_of_connected_front_facing_faces.collect do |group_of_faces|
              Clump.new(
                faces: group_of_faces,
                tr: enclosing_tr,
                inherited_color: inherited_color,
                ent_id: ent_id
              )
            end
          depth -= 1

          return clump_objects
        end
      end
      sig { returns(NilClass) }
      def summary_outline()
      end

      sig { returns(NilClass) }
      def z_depth_sort_criteria()
      end

      def inspect
        # #inspect does not like to be recursive
        self.graph
      end

      sig { params(g: String, depth: Integer).returns(String) }
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
    end
  end # module Papercute
end # module BreedloveDesign
