# typed: true
# @version SketchUp 6.0
module Geom
  extend T::Sig

  # class Plane
  #   def initialize(from, stuff)
  #     case from
  #     when :point_vector
  #       [Geom::Point3d.new(0, 0, 0), Geom::Vector3d.new(0, 0, 1)]
  #     else
  #     end
  #   end
  # end

  # Class Methods

  # The {.closest_points} method is used to compute the closest points on two
  # lines.
  #
  # @example
  #   ```ruby
  #   line1 = [Geom::Point3d.new(0, 2, 0), Geom::Vector3d.new(1, 0, 0)]
  #   line2 = [Geom::Point3d.new(3, 0, 0), Geom::Vector3d.new(0, 1, 0)]
  #   points = Geom.closest_points(line1, line2)
  #   ```
  # This will return an array of points [Point3d(3, 2, 0), Point3d(3, 2, 0)].
  #
  # @param [Array(Geom::Point3d, Geom::Vector3d)] line1
  #   The first line to
  #   intersect
  #
  # @param [Array(Geom::Point3d, Geom::Vector3d)] line2
  #   The second line to
  #   intersect
  #
  # @return [Array(Geom::Point3d, Geom::Point3d)] An array of two points. The
  #   first point is on the first line and the second point is on the second line.
  #
  # @version SketchUp 6.0
  sig do
    params(
      line1: T::Array[T.any(Geom::Point3d, Geom::Vector3d)],
      line2: T::Array[T.any(Geom::Point3d, Geom::Vector3d)]
    ).returns(T::Array[Geom::Point3d])
  end
  def self.closest_points(line1, line2)
    [Geom::Point3d.new, Geom::Point3d.new]
  end

  # The {.fit_plane_to_points} method is used to compute a plane that is a best
  # fit to an array of points. If more than three points are given some of the
  # points may not be on the plane.
  #
  # The plane is returned as an {Array} of 4 numbers which are the
  # coefficients of the plane equation <code>Ax + By + Cz + D = 0</code>.
  #
  # @example
  #   point1 = Geom::Point3d.new(0, 0, 0)
  #   point2 = Geom::Point3d.new(10, 10, 10)
  #   point3 = Geom::Point3d.new(25, 25, 25)
  #   plane = Geom.fit_plane_to_points(point1, point2, point3)
  #
  # @overload fit_plane_to_points(point1, point2, point3, ...)
  #
  #   @param [Geom::Point3d] point1
  #   @param [Geom::Point3d] point2
  #   @param [Geom::Point3d] point3
  #   @return [Array(Geom::Point3d, Geom::Vector3d)] A plane
  #
  # @overload fit_plane_to_points(points)
  #
  #   @param [Array<Geom::Point3d>] points
  #   @return [Array(Geom::Point3d, Geom::Vector3d)] A plane
  #
  sig { params(points: T::Array[Geom::Point3d]).returns(T::Array[Numeric]) }
  def self.fit_plane_to_points(*points)
    [1, 2, 3, 4]
  end

  # The {.intersect_line_line} computes the intersection of two lines.
  #
  # @example
  #   ```ruby
  #   # Defines a line parallel to the Y axis, offset 20 units.
  #   line1 = [Geom::Point3d.new(20, 0, 0), Geom::Vector3d.new(0, 1, 0)]
  #   # Defines a line parallel to the X axis, offset 10 units.
  #   line2 = [Geom::Point3d.new(0, 10, 0), Geom::Point3d.new(20, 10, 0)]
  #   # This will return a point Point3d(20, 10, 0).
  #   point = Geom.intersect_line_line(line1, line2)
  #   ```
  # @param [Array(Geom::Point3d, Geom::Vector3d)] line1
  #   The first line to
  #   intersect.
  #
  # @param [Array(Geom::Point3d, Geom::Vector3d)] line2
  #   The second line to
  #   intersect.
  #
  # @return [Geom::Point3d, nil] The intersection point. Returns +nil+ if they
  #   do not intersect.
  #
  # @see Geom
  #   The Geom module for alternative versions of defining a line.
  #
  # @version SketchUp 6.0
  sig do
    params(
      line1: T::Array[T.any(Geom::Point3d, Geom::Vector3d)],
      line2: T::Array[T.any(Geom::Point3d, Geom::Vector3d)]
    ).returns(T.nilable(Geom::Point3d))
  end
  def self.intersect_line_line(line1, line2)
  end

  # The {.intersect_line_plane} method is used to compute the intersection of a
  # line and a plane.
  #
  # @example
  #   ```ruby
  #   # Defines a line parallel to the X axis, offset 20 units.
  #   line = [Geom::Point3d.new(-10, 20, 0), Geom::Vector3d.new(1, 0, 0)]
  #   # Defines a plane with it's normal parallel to the x axis.
  #   plane = [Geom::Point3d.new(10, 0 ,0), Geom::Vector3d.new(1, 0, 0)]
  #   # This will return a point Point3d(10, 20, 0).
  #   point = Geom.intersect_line_plane(line, plane)
  #   ```
  #
  # @param [Array(Geom::Point3d, Geom::Vector3d)] line
  #
  # @param [Array(Geom::Point3d, Geom::Point3d)] plane
  #
  # @return [Geom::Point3d, nil] A Point3d object. Returns +nil+ if they do not
  #   intersect.
  #
  # @see Geom
  #   The Geom module for alternative versions of defining lines and
  #   planes.
  #
  sig do
    params(
      line: T::Array[T.any(Geom::Point3d, Geom::Vector3d)],
      plane: T::Array[T.any(Geom::Point3d, Geom::Vector3d)]
    ).returns(T.nilable(Geom::Point3d))
  end
  def self.intersect_line_plane(line, plane)
  end

  # The {.intersect_plane_plane} method is used to compute the intersection of two
  # planes.
  #
  # @example
  #   ```ruby
  #   # Defines a plane with it's normal parallel to the x axis.
  #   plane1 = [Geom::Point3d.new(10, 0 ,0), Geom::Vector3d.new(1, 0, 0)]
  #   # Defines a plane with it's normal parallel to the y axis.
  #   plane2 = [Geom::Point3d.new(0, 20 ,0), Geom::Vector3d.new(0, 1, 0)]
  #   # This will return a line [Point3d(10, 20, 0), Vector3d(0, 0, 1)].
  #   line = Geom.intersect_plane_plane(plane1, plane2)
  #   ```
  # @param [Array(Geom::Point3d, Geom::Point3d)] plane1
  #   The first plane to intersect
  #
  # @param [Array(Geom::Point3d, Geom::Point3d)] plane2
  #   The second plane to intersect
  #
  # @return [Array(Geom::Point3d, Geom::Vector3d)] A line where the planes
  #   intersect if successful. Returns +nil+ if the planes do not intersect.
  #
  sig do
    params(
      plane1: T::Array[T.any(Geom::Point3d, Geom::Vector3d)],
      plane2: T::Array[T.any(Geom::Point3d, Geom::Vector3d)]
    ).returns(T.nilable(T::Array[T.any(Geom::Point3d, Geom::Vector3d)]))
  end
  def self.intersect_plane_plane(plane1, plane2)
  end

  # The {.linear_combination} method is used to compute the linear combination of
  # points or vectors.
  #
  # @example
  #   ```ruby
  #   point1 = Geom::Point3d.new(1, 1, 1)
  #   point2 = Geom::Point3d.new(10, 10, 10)
  #   # Gets the point on the line segment connecting point1 and point2 that is
  #   # 3/4 the way from point1 to point2: Point3d(7.75, 7.75, 7.75).
  #   point = Geom.linear_combination(0.25, point1, 0.75, point2)
  #   ```
  #
  # @overload linear_combination(weight1, point1, weight2, point2)
  #
  #   @param [Float] weight1 A weight or percentage.
  #   @param [Geom::Point3d] point1
  #   @param [Float] weight2 A weight or percentage.
  #   @param [Geom::Point3d] point2
  #   @return [Geom::Point3d]
  #
  # @overload linear_combination(weight1, vector1, weight2, vector2)
  #
  #   @param [Float] weight1 A weight or percentage.
  #   @param [Geom::Vector3d] vector1
  #   @param [Float] weight2 A weight or percentage.
  #   @param [Geom::Vector3d] vector2
  #   @return [Geom::Vector3d]
  #
  sig do
    params(
      weight1: Numeric,
      pt_or_vect1: T.any(Geom::Point3d, Geom::Vector3d),
      weight2: Numeric,
      pt_or_vect2: T.any(Geom::Point3d, Geom::Vector3d)
    ).returns(T.any(Geom::Point3d, Geom::Vector3d))
  end
  def self.linear_combination(weight1, pt_or_vect1, weight2, pt_or_vect2)
    Geom::Vector3d.new
  end

  # The {.point_in_polygon_2D} method is used to determine whether a point is
  # inside a polygon. The z component of both the point you're checking and
  # the points in the polygon are ignored, effectively making it a 2-d check.
  #
  # @example
  #   ```ruby
  #   # Create a point that we want to check. (Note that the 3rd coordinate,
  #   # the z, is ignored for purposes of the check.)
  #   point = Geom::Point3d.new(5, 0, 10)
  #
  #   # Create a series of points of a triangle we want to check against.
  #   triangle = []
  #   triangle << Geom::Point3d.new(0, 0, 0)
  #   triangle << Geom::Point3d.new(10, 0, 0)
  #   triangle << Geom::Point3d.new(0, 10, 0)
  #
  #   # Test to see if our point is inside the triangle, counting hits on
  #   # the border as an intersection in this case.
  #   hits_on_border_count = true
  #   status = Geom.point_in_polygon_2D(point, triangle, hits_on_border_count)
  #   ```
  #
  # @param [Geom::Point3d] point
  #
  # @param [Array<Geom::Point3d>] polygon
  #   An array of points that represent the
  #   corners of the polygon you are checking against.
  #
  # @param [Boolean] check_border
  #   Pass true if a point on the border should be
  #   counted as inside the polygon.
  #
  # @return [Boolean] +true+ if the point is inside the polygon.
  #
  sig do
    params(
      point: Geom::Point3d,
      polygon: T::Array[Geom::Point3d],
      check_border: T::Boolean
    ).returns(T::Boolean)
  end
  def self.point_in_polygon_2D(point, *polygon, check_border)
    true
  end
end
