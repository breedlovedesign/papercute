# typed: true
module BreedloveDesign
  module Papercute
    module Projection2d
      extend T::Sig

      PreparedFace =
        Struct.new(
          :outer_loop_points,
          :inner_loops,
          :fill_color,
          :edge_color,
          :alpha,
          keyword_init: true,
        )

      sig do
        params(a_loop: Sketchup::Loop, tr: Geom::Transformation).returns(
          T::Array[T::Array[Numeric]]
        )
      end

      def loop_to_pts_2d(a_loop, tr)
        face_edgeuses = a_loop.edgeuses
        positions =
          face_edgeuses.collect do |use|
            # OptionsProvider should not be returned from edge.start
            # but it happens for some reason
            next if use.edge.start.is_a? Sketchup::OptionsProvider
            next if use.edge.end.is_a? Sketchup::OptionsProvider
            if use.reversed?
              use.edge.start.position.transform(tr)
            else
              use.edge.end.position.transform(tr)
            end
          end

        screen_positions =
          positions.collect do |pt|
            view = Sketchup.active_model.active_view
            screen_position_3d = view.screen_coords(pt)
            screen_position =
              screen_position_3d.to_a[0..1].collect { |coord| coord }
            # screen_position = screen_position_3d.to_a[0..1].collect { |coord| coord.to_i }
          end
        # [ [x,y], [x,y], [x,y]...] array of points
        # stupscreen_positions.to_json
        # TODO: use Geom::Point2d instead of arrays
        return screen_positions
      end

      sig { params(face: Sketchup::Face, tr: Geom::Transformation).returns(BreedloveDesign::Papercute::Projection2d::PreparedFace) }

      def prepare_face(face, tr)
        prepped_face =
          PreparedFace.new(
            outer_loop_points: loop_to_pts_2d(face.outer_loop, tr),
            inner_loops: [],
          )

        inner_loops = face.loops - [face.outer_loop]
        return prepped_face if inner_loops.empty?
        inner_loops.collect do |inner_loop|
          prepped_face[:inner_loops] << loop_to_pts_2d(inner_loop, tr)
        end
        prepped_face
      end
    end # module Projection2d
  end # module Papercute
end # module BreedloveDesign
