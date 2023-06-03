# typed: true
module BreedloveDesign
  module Papercute
    class Clump
      extend T::Sig
      include Projection2d

      sig do
        params(
          faces: T::Array[Sketchup::Face],
          inherited_traits: Traits,
          ent_id: String,
        ).void
      end

      def initialize(faces:, inherited_traits:, ent_id:)
        @ent_id = ent_id
        @faces = faces
        @inherited_traits = inherited_traits
        @tr = @inherited_traits.tr
        # @tr = @inherited_traits.inhreted_tr
        bounds = Geom::BoundingBox.new
        @faces.each { |f| bounds.add f.bounds }
        @center = bounds.center.transform(@tr)
        @faces2d = T.let(sets_of_pts_2d.collect(&:to_h), T::Array[T::Hash[Symbol, T.untyped]])
      end

      def dist
        @center.transform(@tr).distance(
          Sketchup.active_model.active_view.camera.eye
        )
      end

      attr_reader :faces2d, :center

      sig { returns(T::Array[Projection2d::PreparedFace]) }

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
