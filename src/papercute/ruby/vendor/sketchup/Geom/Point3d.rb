# typed: true
# @version SketchUp 6.0
class Geom::Point3d
  extend T::Sig

  # Class Methods

  # The linear_combination method is used to create a new point as a linear
  # combination of two points. This method is generally used to get a point at
  # some percentage along a line connecting the two points.
  #
  # A linear combination is a standard term for vector math. It is defined as
  # point = weight1 * point1 + weight2 * point2.
  #
  # @example
  #   ```ruby
  #   point1 = Geom::Point3d.new(1,1,1)
  #   point2 = Geom::Point3d.new(10,10,10)
  #   # Gets the point on the line segment connecting point1 and point2 that is
  #   # 3/4 the way from point1 to point2.
  #   point = Geom::Point3d.linear_combination(0.25, point1, 0.75, point2)
  #   if (point)
  #     UI.messagebox(point)
  #   else
  #     UI.messagebox("Failure")
  #   end
  #
  # @param weight1 [Float]
  #   A weight or percentage.
  #
  # @param point1 [Float]
  #   The start point on the line.
  #
  # @param point2 [Float]
  #   The end point of the line.
  #
  # @param weight2 [Float]
  #   A weight or percentage.
  #
  # @return [Geom::Point3d]
  #
  sig do
    params(
      weight1: Numeric,
      pt1: T.any(Geom::Point3d, Geom::Vector3d),
      weight2: Numeric,
      pt2: T.any(Geom::Point3d, Geom::Vector3d)
    ).returns(Geom::Point3d)
  end
  def self.linear_combination(weight1, pt1, weight2, pt2)
    Geom::Point3d.new([0, 0, 0])
  end

  # Instance Methods

  # The '+' operator is a fast way to add to the current x, y and z values of
  # a point, or to set the values of a point by adding to other points together.
  #
  # @example
  #   ```ruby
  #   pt2 = pt + vec
  #   pt = pt + [10,10,10]
  #   ```
  #
  # @param point2 [Geom::Point3d]
  #   A Point3d object
  #
  # @return [Geom::Point3d]
  #
  sig { params(point2: Geom::Point3d).returns(Geom::Point3d) }
  def +(point2)
    Geom::Point3d.new([0, 0, 0])
  end

  # The '-' operator is a fast way to subtract from the current x, y and z values
  # of a point.
  #
  # @example
  #   ```ruby
  #   pt2 = pt - vec
  #   pt = pt - [10,10,10]
  #   ```
  #
  # @param point2 [Geom::Point3d]
  #   A Point3d object.
  #
  # @return [Geom::Vector3d]
  #
  sig { params(point2: Geom::Point3d).returns(Geom::Point3d) }
  def -(point2)
    Geom::Point3d.new([0, 0, 0])
  end

  # The '<' operator is a fast way to determine if another point is closer to the
  # origin.
  #
  # @example
  #   ```ruby
  #   pt1 = Geom::Point3d.new(10,10,10)
  #   pt2 = Geom::Point3d.new(20,20,20)
  #   result = pt1 < pt2
  #   ```
  #
  # @param point2 [Geom::Point3d]
  #   A Point3d object.
  #
  # @return [Boolean] true if the point2 is closer to the origin.
  #
  sig { params(point2: Geom::Point3d).returns(T::Boolean) }
  def <(point2)
    true
  end

  # The == method is used to compare two points for equality.
  #
  # This uses the standard SketchUp tolerance to determine if two points are the
  # same.
  #
  # Points can be compared to one another or to an array representing
  # x, y and z coordinates, as in the following examples:
  #
  # @example
  #   ```ruby
  #   point1 = Geom::Point3d.new(1,1,1)
  #   point2 = Geom::Point3d.new(10,10,10)
  #   status = point1 == point2
  #   ```
  #
  # @example
  #   ```ruby
  #   if( pt1 == pt2 )
  #     UI.messagebox('equal')
  #   end
  #
  #   # ... or ...
  #   if( pt1 == [100,200,300] )
  #     UI.messagebox('equal')
  #   end
  #   ```
  #
  # @param point2 [Geom::Point3d]
  #   A Point3d object.
  #
  # @return [Boolean] true if both points are equal; false if points are not
  #   equal
  #
  sig { params(point2: Geom::Point3d).returns(T::Boolean) }
  def ==(point2)
    true
  end

  # The [] method is used to retrieve the value of the point at the specified
  # index.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(1, 2, 3)
  #   # retrieves the y value of 2
  #   yvalue = point[1]
  #   ```
  #
  # @param index [Integer]
  #   The index for a specific x, y, or z value within the
  #   Point3d.
  #
  # @return [Length] an x, y, or z value if successful
  #
  sig { params(index: Fixnum).returns(Length) }
  def [](index)
    Length.new(1)
  end

  # The []= method is used to set the x, y, or z value of the point based on the
  # specific index of the value.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(1,2,3)
  #   yvalue = point[1] = 4
  #   ```
  #
  # @param index [Integer]
  #   The index for a specific x, y, or z value within the
  #   Point3d.
  #
  # @param new_value [Numeric]
  #   New x, y, or z value.
  #
  # @return [Numeric] the newly set x, y, or z value if successful
  #
  sig { params(index: Fixnum, new_value: Numeric).returns(Length) }
  def []=(index, new_value)
    Length.new(1)
  end

  # The clone method is used to create another point identical to the point
  # being cloned.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(1,2,3)
  #   newpoint = point.clone
  #   ```
  #
  # @return [Geom::Point3d] the cloned Point3d object
  #
  sig { returns(Geom::Point3d) }
  def clone
    Geom::Point3d.new([0, 0, 0])
  end

  # The distance method is used to compute the distance from a point to another
  # point.
  #
  # @example
  #   ```ruby
  #   point1 = Geom::Point3d.new(1,1,1)
  #   point2 = Geom::Point3d.new(10,10,10)
  #   distance = point1.distance(point2)
  #   ```
  #
  # @param point2 [Geom::Point3d]
  #   The Point3d object to compute the distance to.
  #
  # @return [Length] the distance in current units
  #
  sig { params(point2: Geom::Point3d).returns(Length) }
  def distance(point2)
    Length.new(1)
  end

  # The distance_to_line method is used to compute the distance from a point to
  # a line.
  #
  # See Geom module for how to specify a line.
  #
  # @example
  #   ```ruby
  #   point1 = Geom::Point3d.new(1,1,1)
  #   line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
  #   distance = point1.distance_to_line(line)
  #   ```
  #
  # @param line
  #   A line (see Geom for information on creating lines).
  #
  # @return [Float] the distance between a point and line in
  #   internal units if successful
  #
  # @note Take care that this method does not return a Length as expected.
  # 'internal units is inches, I think'
  sig { params(pt: Geom::Point3d, vec: Geom::Vector3d).returns(Float) }
  def distance_to_line(pt, vec)
    1.0
  end

  # The distance_to_plane method is used to compute the distance from the point
  # to a plane.
  #
  # See module Geom for how to specify a plane.
  #
  # @example
  #   ```ruby
  #   distance = point.distance_to_plane(plane)
  #   ```
  #
  # @param plane
  #   A plane (see Geom for how to create a plane).
  #
  # @return [Float] a distance between a point and a plane in
  #   internal units if successful
  #
  # @note Take care that this method does not return a Length as expected.
  #
  sig { params(pt: Geom::Point3d, vec: Geom::Vector3d).returns(Float) }
  def distance_to_plane(pt, vec)
    1.0
  end

  # The new method is used to create a new 3D point.
  #
  # @example
  #   ```ruby
  #   # No arguments, creates a point at the origin [0,0,0]
  #   pt1 = Geom::Point3d.new
  #
  #   # Creates a point at x of 100, y of 200, z of 300.
  #   pt2 = Geom::Point3d.new(100,200,300)
  #
  #   # You can also create a point directly by simply assigning the x, y and z
  #   # values to a variable as an array:
  #   pt3 = [100,200,300]
  #   ```
  #
  # @overload initialize
  #
  #   @return [Geom::Point3d]
  #
  # @overload initialize(x, y, z = 0.0)
  #
  #   @param [Numeric] x  The location along the x axis.
  #   @param [Numeric] y  The location along the y axis.
  #   @param [Numeric] z  The location along the z axis.
  #   @return [Geom::Point3d]
  #
  # @overload initialize(point3d)
  #
  #   @param [Geom::Point3d] point3d
  #   @return [Geom::Point3d]
  #
  # @overload initialize(vertex)
  #
  #   @param [Sketchup::Vertex] vertex
  #   @return [Geom::Point3d]
  #
  # @overload initialize(array2d)
  #
  #   @param [Array(Numeric, Numeric)] array2d
  #   @return [Geom::Point3d]
  #
  # @overload initialize(input_point)
  #
  #   @param [Sketchup::InputPoint] input_point
  #   @return [Geom::Point3d]
  #
  # @overload initialize(array3d)
  #
  #   @param [Array(Numeric, Numeric, Numeric)] array3d
  #   @return [Geom::Point3d]
  #
  sig { params(args: T.any(T::Array[Numeric], Geom::Point3d, Numeric)).void }
  def initialize(*args)
  end

  # The inspect method is used to format a 3D point as a string.
  #
  # You will not often use these function directly. Instead, they are called
  # automatically when an object is output using a print command like 'puts',
  # which writes to the Ruby console.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(10,10,10)
  #   string = point.inspect
  #   ```
  #
  # @return [String] a string point representation
  #
  sig { returns(String) }
  def inspect
    ""
  end

  # The offset method is used to offset a point by a vector and return a new
  # point. The length of the vector must not be zero.
  #
  # @example
  #   ```ruby
  #   point1 = Geom::Point3d.new(10,10,10)
  #   vector = Geom::Vector3d.new(0, 0, 1)
  #   point2 = point1.offset(vector)
  #   ```
  #
  # @param vector [Geom::Vector3d]
  #   A Vector3d object to offset the point by.
  #
  # @param length [Numeric]
  #   the distance to offset. If not provided, the
  #   offset is my a distance equal to the vector length.
  #
  # @return [Geom::Point3d] - a new Point3d object
  #
  # @version SketchUp 6.0
  sig { params(vector: Geom::Vector3d, length: Numeric).returns(Geom::Point3d) }
  def offset(vector, length = vector.length)
    Geom::Point3d.new([0, 0, 0])
  end

  # The offset! method is used to offset a point by a vector. The point itself
  # is modified.
  #
  # Unlike offset, the point itself is modified.
  #
  # @example
  #   ```ruby
  #   point1 = Geom::Point3d.new(10,10,10)
  #   vector = Geom::Vector3d.new(0,0,1)
  #   point2 = point1.offset!(vector)
  #   ```
  #
  # @param vector [Geom::Vector3d]
  #   A Vector3d object to offset the point by.
  #
  # @param length [Numeric]
  #   the distance to offset. If not provided, the
  #   offset is my a distance equal to the vector length.
  #
  # @return [Geom::Point3d] a new Point3d object
  #
  sig { params(vector: Geom::Vector3d, length: Numeric).returns(Geom::Point3d) }
  def offset!(vector, length = vector.length)
    Geom::Point3d.new([0, 0, 0])
  end

  # The on_line? method is used to determine if the point is on a line.
  #
  # See module Geom for the various ways to specify a line.
  #
  # @example
  #   ```ruby
  #   line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
  #   point = Geom::Point3d.new(10,10,10)
  #   status = point.on_line?(line)
  #   ```
  #
  # @param line
  #   A line (see Geom for how to create a line).
  #
  # @return [Boolean] true if the point is on the line; false if the
  #   point is not on the line
  #
  sig { params(pt: Geom::Point3d, vec: Geom::Vector3d).returns(T::Boolean) }
  def on_line?(pt, vec)
    true
  end

  # The on_plane? method is used to determine if the point is on a plane.
  #
  # See module Geom for the various ways to specify a plane.
  #
  # @example
  #   ```ruby
  #   plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
  #   point = Geom::Point3d.new(10,10,10)
  #   status = point.on_plane?(plane)
  #   ```
  #
  # @param plane
  #
  # @return [Boolean] true if the point is on the plane; false if
  #   the point is not on the plane
  #
  sig { params(pt: Geom::Point3d, vec: Geom::Vector3d).returns(T::Boolean) }
  def on_plane?(pt, vec)
    true
  end

  # The project_to_line method is used to retrieve the point on a line that is
  # closest to this point.
  #
  # The line may be defined by either a point and a vector or by two points.
  #
  # @example
  #   ```ruby
  #   line = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
  #   point = Geom::Point3d.new(10,10,10)
  #   projected_point = point.project_to_line(line)
  #   ```
  #
  # @param line
  #   - see Geom for how to specify a line
  #
  # @return [Geom::Point3d] the Point3d that is on a line closest to the
  #   point
  #
  sig { params(pt: Geom::Point3d, vec: Geom::Vector3d).returns(Geom::Point3d) }
  def project_to_line(pt, vec)
    Geom::Point3d.new([0, 0, 0])
  end

  # The project_to_plane method is used to retrieve the point on a plane that is
  # closest to the point.
  #
  # The plane may be defined by either a point on the plane and a vector
  # perpendicular to the plane or by the coeficients to the plane equation AX +
  # BY + CZ + D = 0. See Geom for details.
  #
  # @example
  #   ```ruby
  #   plane = [Geom::Point3d.new(0,0,0), Geom::Vector3d.new(0,0,1)]
  #   point = Geom::Point3d.new(10,10,10)
  #   projected_point = point.project_to_plane(plane)
  #   ```
  #
  # @param plane
  #   A plane (see Geom for how to create a plane).
  #
  # @return [Geom::Point3d] the Point3d that is on a plane closest to the
  #   point
  #
  sig { params(pt: Geom::Point3d, vec: Geom::Vector3d).returns(Geom::Point3d) }
  def project_to_plane(pt, vec)
    Geom::Point3d.new([0, 0, 0])
  end

  # The {#set!} method is used to set the values of the Point3d.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(10,10,10)
  #   point = point.set!(100,200,300)
  #   ```
  #
  # @overload set!(x, y, z)
  #
  #   @param x [Numeric] The x value for the point.
  #   @param y [Numeric] The y value for the point.
  #   @param z [Numeric] The z value for the point.
  #   @return [Geom::Point3d] The newly set Point3d object
  #
  # @overload set!(point3d)
  #
  #   @param point3d [Geom::Point3d]
  #   @return [Geom::Point3d]
  #
  # @overload set!(array3d)
  #
  #   @param array3d [Array(Numeric, Numeric, Numeric)]
  #   @return [Geom::Point3d]
  #
  sig { params(arr: T::Array[Numeric]).returns(Geom::Point3d) }
  def set!(arr)
    Geom::Point3d.new([0, 0, 0])
  end

  # The to_a method is used to convert the point to an array of 3 numbers
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(10,20,30)
  #   array = point.to_a
  #
  #   pt = [100,200,300]
  #   # outputs [100.0,200.0,300.0]
  #   UI.messagebox(pt.to_a)
  #   ```
  #
  # @return [Array(Length, Length, Length)] an array of three numbers representing x,y,z of
  #   the Point3d
  #
  sig { returns(T::Array[Numeric]) }
  def to_a
    [0, 0, 0]
  end

  # The to_s method is used to retrieve a string representation of a point.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(10,10,10) # always inches
  #   str = point.to_s #=> (254 mm, 254 mm, 254 mm) respects units
  #   # contrast with point.inspect #=> Point3d(10, 10, 10) always inches
  #   ```
  #
  #   ```ruby
  #   ten_mm = 10/1.to_mm #=> 0.3937007874015748
  #   pt10 = Geom::Point3d.new( [ten_mm, ten_mm, ten_mm] )
  #   Point3d(0.393701, 0.393701, 0.393701)
  #   pt10.to_s
  #   (10 mm, 10 mm, 10 mm)
  #   ```
  # @return [String] the string representation of the Point3d
  #
  sig { returns(String) }
  def to_s
    ""
  end

  # Apply a Transformation to a point, returning a new point. The original
  # vector is unchanged by this method.
  #
  # @example
  #   ```ruby
  #   transform = Geom::Transformation.new(point2)
  #   point2 = Geom::Point3d.new(100,200,300)
  #   point1 = Geom::Point3d.new(10,10,10)
  #   point3 = point1.transform(transform)
  #
  # @param transform [Geom::Transformation]
  #   A Transformation object.
  #
  # @return [Geom::Point3d] the newly transformed point
  #
  sig { params(transform: Geom::Transformation).returns(Geom::Point3d) }
  def transform(transform)
    Geom::Point3d.new([0, 0, 0])
  end

  # Apply a Transformation to a point. The point itself is modified.
  #
  # @example
  #   ```ruby
  #   transform = Geom::Transformation.new(point2)
  #   point2 = Geom::Point3d.new(100,200,300)
  #   point1 = Geom::Point3d.new(10,10,10)
  #   point1.transform!(transform)
  #
  # @param transform [Geom::Transformation]
  #   A Transformation object.
  #
  # @return [Geom::Point3d] the transformed point
  #
  sig { params(transform: Geom::Transformation).returns(Geom::Point3d) }
  def transform!(transform)
    self
  end

  # The vector_to method retrieves the vector between points.
  #
  # @example
  #   ```ruby
  #   point2 = Geom::Point3d.new(100, 200, 300)
  #   point1 = Geom::Point3d.new(10,  10,  10)
  #   vector = point1.vector_to(point2)
  #
  #   # Another example...
  #   pt1 = [1,1,0]
  #   pt2 = [3,1,0]
  #   pt1.vector_to( pt2 ) # returns the vector (2,0,0)
  #   pt1.vector_to(pt2) # is equivalent to (pt2 - pt1)
  #   ```
  #
  # @param point2 [Geom::Point3d]
  #   A Point3d object.
  #
  # @return [Geom::Vector3d] a Vector object
  #
  sig { params(point2: Geom::Point3d).returns(Geom::Vector3d) }
  def vector_to(point2)
    Geom::Vector3d.new
  end

  # The x method retrieves the x value of the 3D point.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(1,2,3)
  #   x = point.x
  #   ```
  #
  # @return [Length] the x value
  #
  sig { returns(Numeric) }
  def x
    1
  end

  # The x= method is used to set the x value of a 3D point.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(1,2,3)
  #   x = point.x = 2
  #   ```
  #
  # @param value [Numeric]
  #   The new x value.
  #
  # @return [Numeric] the newly set x value
  #
  sig { params(value: Numeric).returns(Numeric) }
  def x=(value)
    value
  end

  # The y method retrieves the y value of the 3D point.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(1,2,3)
  #   y = point.y
  #   ```
  #
  # @return [Length] the y value
  #
  sig { returns(Numeric) }
  def y
    2
  end

  # The y= method is used to set the y value of a 3D point.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(1,2,3)
  #   y = point.y = 2
  #   ```
  #
  # @param value [Numeric]
  #   The new y value.
  #
  # @return [Numeric] the newly set y value
  #
  sig { params(value: Numeric).returns(Numeric) }
  def y=(value)
    value
  end

  # The z method retrieves the z value of the 3D point.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(1,2,3)
  #   z = point.x
  #   ```
  #
  # @return [Length] the z value
  #
  sig { returns(Numeric) }
  def z
    3
  end

  # The z= method is used to set the z value of a 3D point.
  #
  # @example
  #   ```ruby
  #   point = Geom::Point3d.new(1,2,3)
  #   z = point.z = 2
  #
  #   ```
  #
  # @param value [Numeric]
  #   The new z value.
  #
  # @return [Numeric] the newly set z value
  #
  sig { params(value: Numeric).returns(Numeric) }
  def z=(value)
    value
  end
end
