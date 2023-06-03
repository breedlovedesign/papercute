# frozen_string_literal: true
module BreedloveDesign
  module Papercute
    class Clump
      
      include Projection2d



      def initialize(faces:, inherited_traits:, ent_id:)
        @ent_id = ent_id
        @faces = faces
        @inherited_traits = inherited_traits
        @tr = @inherited_traits.tr
        # @tr = @inherited_traits.inhreted_tr
        bounds = Geom::BoundingBox.new
        @faces.each { |f| bounds.add f.bounds }
        @center = bounds.center.transform(@tr)
        @faces2d = sets_of_pts_2d.collect(&:to_h)
      end



      def get_clumps(
        faces:,
        depth:,
        ent_id:,
        groups_of_connected_front_facing_faces: []
      )
        unprocessed_faces = faces.reject { |f| Sorter.rear_facing?(f, @tr) }
        clump_seed = unprocessed_faces.shift
        if clump_seed
          clump_of_faces =
            clump_seed.all_connected.select { |ent| ent.is_a?(Sketchup::Face) }
          clump_of_front_faces =
            clump_of_faces.reject { |face| Sorter.rear_facing?(face, @tr) }
          unless groups_of_connected_front_facing_faces.include?(
            clump_of_front_faces
          )
            groups_of_connected_front_facing_faces << clump_of_front_faces
          end
          unprocessed_faces -= clump_of_front_faces
          depth += 1

          get_clumps faces: unprocessed_faces,
                     depth: depth,
                     ent_id: ent_id,
                     groups_of_connected_front_facing_faces: groups_of_connected_front_facing_faces
        else
          thing = groups_of_connected_front_facing_faces[0]
          if thing
            thing.sort_by! do |face|
              [
                Sorter.largest_z(face),
                Sorter.largest_x(face),
                Sorter.largest_y(face),
              ]
            end
          else
          end
          clump_objects =
            groups_of_connected_front_facing_faces.collect do |group_of_faces|
              Clump.new(
                faces: group_of_faces,
                inherited_traits: @inherited_traits,
                ent_id: ent_id,
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



      def sets_of_pts_2d # rename to reflect data structure?
        @faces.collect do |face|
          prepped_face = prepare_face(face, @tr)
          if face.material
            prepped_face.fillColor =
              ColorUtils.material_to_color(face.material)
            prepped_face.edgeColor = ColorUtils.default_edge_color # sort out edges later
            prepped_face.alpha =
              ColorUtils.su_color_alpha_to_f(color_obj: face.material.color)
          else
            prepped_face.fillColor = @inherited_traits.fill_color
            prepped_face.edgeColor = @inherited_traits.edge_color
            prepped_face.alpha = @inherited_traits.alpha
          end
          # ec = ColorUtils.default_edge_color
          # # TODO rethink hiding soft edges
          # if face.edges.all? { |e| e.soft? }
          #   $faces_with_all_soft_edges_count += 1
          #   ec = "#FFFF0000"
          # elsif face.edges.all? { |e| !e.soft? }
          #   $faces_with_no_soft_edges_count += 1
          # else
          #   $faces_with_some_soft_edges_count += 1
          #   ec = "#FFFF0050"
          # end

          # if face.material
          #   material = face.material
          #   color = ColorUtils.material_to_color(material)
          #   alpha = ColorUtils.su_color_alpha_to_f(color_obj: material.color)
          # else
          #   color = inherited_color
          #   # TODO: use Traits to deal with color and only do projection here
          #   # alpha = 0.2
          #   alpha = 0.8
          # end
          prepped_face
        end
      end

      def inspect
        "clump_ent: #{@ent_id}\n" + "clump_obj_id: #{self.object_id}\n" +
          "face count: #{@faces.length}\n" +
          "faces:\n   #{@faces2d.inspect}"
      end
    end # class Clump
  end # module Papercute
end # module BreedloveDesign
