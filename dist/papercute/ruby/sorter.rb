# frozen_string_literal: true
module BreedloveDesign
  module Papercute
    module Sorter
      

      def group?(ent)
        ent.respond_to? :definition
      end


      def self.group?(ent)
        ent.respond_to? :definition
      end


      def face?(ent)
        ent.is_a? Sketchup::Face
      end


      def self.face?(ent)
        ent.is_a? Sketchup::Face
      end


      def largest_z(face)
        zs = face.outer_loop.vertices.collect { |v| v.position.z }
        zmax = zs.max
        zmax += 0.1 if (zs.uniq.length == 1) # HACK
        return zmax
      end


      def self.largest_z(face)
        zs = face.outer_loop.vertices.collect { |v| v.position.z }
        zmax = zs.max
        zmax += 0.1 if (zs.uniq.length == 1) # HACK
        return zmax
      end


      def largest_y(face)
        ys = face.outer_loop.vertices.collect { |v| v.position.y }
        ymax = ys.max
        ymax += 0.1 if (ys.uniq.length == 1)
        return ymax
      end


      def self.largest_y(face)
        ys = face.outer_loop.vertices.collect { |v| v.position.y }
        ymax = ys.max
        ymax += 0.1 if (ys.uniq.length == 1)
        return ymax
      end


      def largest_x(face)
        xs = face.outer_loop.vertices.collect { |v| v.position.x }
        xmax = xs.max
        xmax += 0.1 if (xs.uniq.length == 1)
        return xmax
      end


      def self.largest_x(face)
        xs = face.outer_loop.vertices.collect { |v| v.position.x }
        xmax = xs.max
        xmax += 0.1 if (xs.uniq.length == 1)
        return xmax
      end


      def front_facing?(face, parental_tr)
        normal_vec_relative_to_enclosing_group = face.normal
        normal_vec =
          normal_vec_relative_to_enclosing_group.transform parental_tr
        angle =
          normal_vec.angle_between(
            Sketchup.active_model.active_view.camera.direction
          )
        result = angle >= (Math::PI / 2)
        return result
      end


      def self.front_facing?(face, parental_tr)
        normal_vec_relative_to_enclosing_group = face.normal
        normal_vec =
          normal_vec_relative_to_enclosing_group.transform parental_tr
        angle =
          normal_vec.angle_between(
            Sketchup.active_model.active_view.camera.direction
          )
        result = angle >= (Math::PI / 2)
        return result
      end


      def rear_facing?(face, parental_tr)
        !front_facing?(face, parental_tr)
      end


      def self.rear_facing?(face, parental_tr)
        !front_facing?(face, parental_tr)
      end
    end # module Sorter
  end #  module Papercute
end # module BreedloveDesign
