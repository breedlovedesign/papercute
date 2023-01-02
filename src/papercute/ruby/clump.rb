# typed: true
module BreedloveDesign
  module Papercute
    class Clump
      extend T::Sig
      include Projection2d

      sig do
        params(
          faces: T::Array[Sketchup::Face],
          tr: Geom::Transformation,
          inherited_color: String,
          ent_id: String
        ).void
      end
      def initialize(faces:, tr:, inherited_color:, ent_id:)
        @ent_id = ent_id
        @faces = faces
        @tr = tr
        @color = inherited_color
        bounds = Geom::BoundingBox.new
        @faces.each { |f| bounds.add f.bounds }
        @center = bounds.center.transform(tr)
        @faces2d = sets_of_pts_2d.collect(&:to_h)
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

      def dist
        @center.transform(@tr).distance(
          Sketchup.active_model.active_view.camera.eye
        )
      end

      attr_reader :faces2d, :center

      sig { returns(T::Array[Projection2d::PreparedFace]) }
      def sets_of_pts_2d # rename to reflect data structure?
        @faces.collect { |face| prepare_face(face, @tr, @color) }
      end

      def inspect
        "clump_ent: #{@ent_id} clump_obj_id: #{self.object_id} face count: #{@faces.length}\n #{@faces2d.inspect}"
      end
    end # class Clump
  end # module Papercute
end # module BreedloveDesign
