# typed: true
# @version SketchUp 6.0
class Geom::Vector3d
  extend T::Sig

  # Class Methods

  # The linear_combination method is used to create a new vector as a linear
  # combination of other vectors. This method is generally used to get a vector
  # at some percentage between two vectors.
  #
  # A linear combination is a standard term for vector math. It is defined as
  # point = weight1 * point1 + weight2 * point2.
  #
  # In addition to the 4-argument form detailed here, you may also call this
  # method with 6 parameters in the form of:
  #   vec = Geom::Vector3d.linear_combination(x, xaxis, y, yaxis, z, zaxis)
  #
  # @example
  #   # Create a vector that is a 50%/50% linear combination of two others.
  #   vec1 = Geom::Vector3d.new 3,0,0
  #   vec2 = Geom::Vector3d.new 0,3,0
  #   new_vector = Geom::Vector3d.linear_combination(0.5, vec1, 0.5, vec2)
  #   # new_vector will now contain a Vector3d(1.5, 1.5, 0)
  #
  # @param weight1
  #   A weight or percentage.
  #
  # @param vector1
  #   The first vector.
  #
  # @param vector2
  #   The end point of the line.
  #
  # @param weight2
  #   A weight or percentage.
  #
  # @return [Geom::Vector3d] a Vector3d object
  #
  sig do
    params(
      weight1: Numeric,
      vec1: T.any(Geom::Point3d, Geom::Vector3d),
      weight2: Numeric,
      vec2: T.any(Geom::Point3d, Geom::Vector3d)
    ).returns(Geom::Point3d)
  end
  def self.linear_combination(weight1, vec1, weight2, vec2)
    Geom::Point3d.new([0, 0, 0])
  end

  # Instance Methods

  # The {#%} method is used to compute the dot product between two vectors.
  #
  # This is an alias of the {#dot} method.
  #
  # @example
  #   ```ruby
  #   vector1 = Geom::Vector3d.new(0, 0, 1)
  #   vector2 = Geom::Vector3d.new(0, 1, 0)
  #   dot = vector1 % vector2
  #   ```
  #
  # @param [Geom::Vector] vector
  #
  # @return [Float]
  #
  # @see #dot
  #
  sig { params(vector2: Geom::Vector3d).returns(Float) }
  def %(vector2)
    1.0
  end

  # The {#*} method is used to compute the cross product between two vectors.
  #
  # The cross product, also called the vector product, is an operation on two
  # vectors. The cross product of two vectors produces a third vector which is
  # perpendicular to the plane in which the first two lie.
  #
  # This is an alias of the {#cross} method.
  #
  # @example
  #   ```ruby
  #   vector1 = Geom::Vector3d.new(1,0,0)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   vector3 = vector1 * vector2
  #   ```
  #
  # @param vector
  #   A Vector3d object.
  #
  # @return [Geom::Vector3d] a Vector3d object if successful
  #
  # @see #cross
  #
  sig { params(vector2: Geom::Vector3d).returns(Geom::Vector3d) }
  def *(vector2)
    Geom::Vector3d.new([0, 0, 0])
  end

  # The - method is used to add a vector to this one.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,2)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   new_vector = vector + vector2
  #   ```
  #
  # @param vector2
  #   A Vector3d object.
  #
  # @return [Geom::Vector3d] the new vector.
  #
  sig { params(vector2: Geom::Vector3d).returns(Geom::Vector3d) }
  def +(vector2)
    Geom::Vector3d.new([0, 0, 0])
  end

  # The - method is used to subtract a vector from this one.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,2)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   new_vector = vector - vector2
  #   ```
  #
  # @param vector2
  #   A Vector3d object.
  #
  # @return [Geom::Vector3d] the new vector.
  #
  sig { params(vector2: Geom::Vector3d).returns(Geom::Vector3d) }
  def -(vector2)
    Geom::Vector3d.new([0, 0, 0])
  end

  # The < method is used to determine if a vector's x, y or z value is less
  # than another vector's x, y or z value.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,2)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   lt = vector < vector2
  #   ```
  #
  # @param vector2
  #   A Vector3d object.
  #
  # @return [Boolean] true if the vector's x, y or z component is less
  #
  sig { params(vector2: Geom::Vector3d).returns(T::Boolean) }
  def <(vector2)
    true
  end

  # The == method is used to determine if two vectors are equal to within
  # tolerance.
  #
  # @example
  #   vector = Geom::Vector3d.new(1,0,0)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   status = vector == vector2
  #   # Returns false
  #   UI.messagebox status
  #
  # @param vector2
  #   A Vector3d object.
  #
  # @return [Boolean] true if vector1 is equal to vector 2. False if
  #   they are not equal.
  #
  sig { params(vector2: Geom::Vector3d).returns(T::Boolean) }
  def ==(vector2)
    true
  end

  # The [] method is used to access the coordinates of a vector as if it was an
  # Array. The index must be 0, 1 or 2.
  #
  # The following are equivalent:
  #
  # @example
  #   ```ruby
  #   x = vector.x
  #   x = vector[0]
  #   ```
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(1,0,0)
  #   value = vector[0]
  #   if (value)
  #     UI.messagebox value
  #   else
  #     UI.messagebox "Failure"
  #   end
  #   ```
  # @param i [Integer]
  #   An index into an array of three coordinates.
  #
  # @return [Length] the value for the x, y, or z coordinate.
  #
  sig { params(index: Fixnum).returns(Length) }
  def [](index)
    Length.new(1)
  end

  # The []= method is used to set the coordinates of a vector as if it was an
  # Array. The value of i must be 0, 1 or 2.
  #
  # @example
  #   ```ruby
  #   vector[i] = coordinate
  #   ```
  #
  # @param index [Integer]
  #   The index for the x, y, or z coordinate.
  #
  # @param value [Numeric]
  #   The value for the x, y, or z coordinate.
  #
  # @return [Numeric] the newly set coordinate value
  #
  sig { params(i: Fixnum, value: Numeric).returns(Length) }
  def []=(i, value)
    Length.new(1)
  end

  # The angle_between method is used to compute the angle (in radians) between
  # this vector and another vector.
  #
  # @example
  #   ```ruby
  #   vector1 = Geom::Vector3d.new(1,0,0)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   angle = vector1.angle_between vector2
  #   ```
  #
  # @param vector2 [Geom::Vector3d]
  #   A Vector3d object.
  #
  # @return [Float] an angle (in radians)
  #
  sig { params(vector2: Geom::Vector3d).returns(Float) }
  def angle_between(vector2)
    3.14
  end

  # The axes method is used to compute an arbitrary set of axes with the given
  # vector as the z-axis direction.
  #
  # Returns an Array of three vectors [xaxis, yaxis, zaxis]
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(1,0,0)
  #   a = vector.axes
  #   ```
  #
  # @return [Array(Geom::Vector3d, Geom::Vector3d, Geom::Vector3d)] an Array object containing three Vector3d objects
  #
  sig { returns(T::Array[Geom::Vector3d]) }
  def axes
    [
      Geom::Vector3d.new([0, 0, 0]),
      Geom::Vector3d.new([0, 0, 0]),
      Geom::Vector3d.new([0, 0, 0])
    ]
  end

  # The clone method is used to make a copy of a vector.
  #
  # This method is equivalent to vec2 = Geom::Vector3d.new(vec)
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(1,0,0)
  #   vector2 = vector.clone
  #   ```
  #
  # @return [Geom::Vector3d] a Vector3d object which is the clone of
  #   vector
  #
  sig { returns(Geom::Vector3d) }
  def clone
    Geom::Vector3d.new([0, 0, 0])
  end

  # The {#cross} method is used to compute the cross product between two vectors.
  #
  # The cross product, also called the vector product, is an operation on two
  # vectors. The cross product of two vectors produces a third vector which is
  # perpendicular to the plane in which the first two lie.
  #
  # @example
  #   ```ruby
  #   vector1 = Geom::Vector3d.new(1,0,0)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   vector3 = vector1 * vector2
  #   ```
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(1,0,0)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   vector3 = vector.cross(vector2)
  #   ```
  #
  # @param vector [Geom::Vector3d]
  #   A Vector3d object.
  #
  # @return [Geom::Vector3d] the cross of vector1 and vector2
  #
  # @see #*
  #
  sig { params(vector2: Geom::Vector3d).returns(Geom::Vector3d) }
  def cross(vector2)
    Geom::Vector3d.new([0, 0, 0])
  end

  # The {#dot} method is used to compute the dot product between two vectors.
  #
  # @example
  #   ```ruby
  #   vector1 = Geom::Vector3d.new(0, 0, 1)
  #   vector2 = Geom::Vector3d.new(0, 1, 0)
  #   dot = vector1.dot(vector2)
  #   ```
  #
  # @param vector [Geom::Vector]
  #
  # @return [Float]
  #
  # @see #%
  #
  sig { params(vector2: Geom::Vector3d).returns(Float) }
  def dot(vector2)
    1.0
  end

  # The new method is used to create a new vector.
  #
  # @example
  #   # A vector that runs up the Z axis.
  #   vector = Geom::Vector3d.new(0,0,1)
  #   if (vector)
  #     UI.messagebox vector
  #   else
  #     UI.messagebox "Failure"
  #   end
  #
  # @overload initialize
  #
  #   @return [Geom::Vector3d]
  #
  # @overload initialize(x, y, z)
  #
  #   @param x [Numeric] A X value.
  #   @param y [Numeric] A Y value.
  #   @param z [Numeric] A Z value.
  #   @return [Geom::Vector3d]
  #
  # @overload initialize(vector)
  #
  #   @param vector [Geom::Vector3d] A Vector3d object.
  #   @return [Geom::Vector3d]
  #
  # @overload initialize(array2d)
  #
  #   @param [Array(Numeric, Numeric)] array2d
  #   @return [Geom::Vector3d]
  #
  # @overload initialize(array3d)
  #
  #   @param [Array(Numeric, Numeric, Numeric)] array3d
  #   @return [Geom::Vector3d]
  #
  sig { params(args: T.any(T::Array[Numeric], Geom::Vector3d, Numeric)).void }
  def initialize(*args)
  end

  # The inspect method is used to inspect the contents of a vector as a
  # friendly string.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,1)
  #   out_string = vector.inspect
  #   puts(out_string)
  #   ```
  #
  # clarn
  # @return [Geom::Vector3d] the Vector3d object # String!
  #
  sig { returns(String) }
  def inspect
    ""
  end

  # The length method is used to retrieve the length of the vector.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,1)
  #   l = vector.length
  #   ```
  #
  # @return [Length] the length of the vector
  #
  sig { returns(Length) }
  def length
    Length.new(1)
  end

  # The length= method is used to set the length of the vector. The length must
  # be greater than 0.
  #
  # @example
  #   vector = Geom::Vector3d.new(0,0,1)
  #   l = vector.length
  #   UI.messagebox(l)
  #   newl = vector.length = 2
  #
  # @param length [Numeric]
  #   A length for the vector.
  #
  # @return [Numeric] a newly set length
  #
  sig { params(length: Numeric).returns(Numeric) }
  def length=(length)
    Length.new(1)
  end

  # The normalize method is used to return a vector that is a unit vector
  # of another.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,2)
  #   vector2 = vector.normalize
  #   ```
  #
  # @return [Geom::Vector3d] a new normalized Vector3d object
  #
  sig { returns(Geom::Vector3d) }
  def normalize
    Geom::Vector3d.new([0, 0, 0])
  end

  # The normalize! method is used to convert a vector into a unit vector,
  # in place.
  #
  # Another way to do this is vec.length = 1
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,2)
  #   vector.normalize!
  #   ```
  #
  # @return [Geom::Vector3d] a normalized Vector3d object
  #
  sig { returns(Geom::Vector3d) }
  def normalize!
    self
  end

  # The parallel method is used to determine if this vector is parallel to
  # another vector to within tolerance.
  #
  # @example
  #   ```ruby
  #   status = vector.parallel?(vector2)
  #   ```
  #
  # @param vector2 [Geom::Vector3d]
  #   A Vector3d object.
  #
  # @return [Boolean] true if vector and vector2 are parallel. False
  #   if they are not parallel.
  #
  sig { params(vector2: Geom::Vector3d).returns(T::Boolean) }
  def parallel?(vector2)
    true
  end

  # The perpendicular? method is used to determine if this vector is
  # perpendicular to another vector to within tolerance.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,1)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   status = vector.perpendicular?(vector2)
  #   ```
  #
  # @param vector2 [Geom::Vector3d]
  #   A Vector3d object.
  #
  # @return [Boolean] true if vector and vector2 are parallel. False
  #   if they are not parallel.
  #
  sig { params(vector2: Geom::Vector3d).returns(T::Boolean) }
  def perpendicular?(vector2)
    true
  end

  # The reverse method is used to return a new vector that is the reverse
  # of this vector, while leaving the original unchanged.
  #
  # @example
  #   ```ruby
  #   vector2 = vector.reverse
  #   ```
  #
  # @return [Geom::Vector3d] a Vector3d object that is the reverse of
  #   vector
  #
  sig { returns(Geom::Vector3d) }
  def reverse
    Geom::Vector3d.new([0, 0, 0])
  end

  # The reverse! method is used to reverse the vector in place.
  #
  # @example
  #   ```ruby
  #   vector.reverse!
  #   ```
  #
  # @return [Geom::Vector3d] a Vector3d object that is the reverse of
  #   vector
  #
  sig { returns(Geom::Vector3d) }
  def reverse!
    self
  end

  # The samedirection? method is used to determine if this vector is parallel to
  # and in the same direction as another vector to within tolerance.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,1)
  #   vector2 = Geom::Vector3d.new(0,1,0)
  #   status = vector.samedirection?(vector2)
  #   ```
  #
  # @param vector2 [Geom::Vector3d]
  #   A Vector3d object.
  #
  # @return [Boolean] true if vector and vector2 are in the same
  #   direction. False if they are not in the same direction.
  #
  sig { params(vector2: Geom::Vector3d).returns(T::Boolean) }
  def samedirection?(vector2)
    true
  end

  # The set! method is used to set the coordinates of the vector.
  #
  # @example This is a shortcut for writing:
  #   ```ruby
  #   vec.x = x
  #   vec.y = y
  #   vec.z = z
  #   ```
  # @example You may also call this method with an array or another vector:
  #   ```ruby
  #   vec.set!(x, y, z)
  #   vec.set!([x, y, z])
  #   vec.set!(vec2)
  #   ```
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,1)
  #   vector.set! 1,0,0
  #   ```
  # @overload set!(x, y, z)
  #
  #   @param x [Numeric] The x value for the vector.
  #   @param y [Numeric] The y value for the vector.
  #   @param z [Numeric] The z value for the vector.
  #   @return [Geom::Vector3d] The newly set Vector3d object
  #
  # @overload set!(vector)
  #
  #   @param vector [Geom::Vector3d] A Vector3d object.
  #   @return [Geom::Vector3d] The newly set Vector3d object
  #
  # @overload set!(array3d)
  #
  #   @param array3d [Array(Numeric, Numeric, Numeric)]
  #   @return [Geom::Vector3d]
  #
  sig { params(arr: T::Array[Numeric]).returns(Geom::Vector3d) }
  def set!(arr)
    self
  end

  # The to_a method retrieves the coordinates of the vector in an Array
  # [x, y, z].
  #
  # @example
  #   ```ruby
  #   a = vector.to_a
  #   ```
  # @return [Array(Length, Length, Length)] the coordinates of the vector in an array
  #
  sig { returns(T::Array[Numeric]) }
  def to_a
    [0, 0, 0]
  end

  # The to_s method is used to format the vector as a String.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,1)
  #   out_string = vector.to_s
  #   puts(out_string)
  #   ```
  #
  # @return [String] a string representation of vector
  #
  sig { returns(String) }
  def to_s
    ""
  end

  # Apply a Transformation to a vector, returning a new vector. The original
  # vector is unchanged by this method.
  #
  # @example
  #   ```ruby
  #   vector2 = vector.transform(transformation)
  #   ```
  #
  # @param transform [Geom::Transformation]
  #   A Transformation object to apply to the vector.
  #
  # @return [Geom::Vector3d] the newly transformed vector
  #
  sig { params(transform: Geom::Transformation).returns(Geom::Vector3d) }
  def transform(transform)
    Geom::Vector3d.new([0, 0, 0])
  end

  # Apply a Transformation to a vector. The vector itself is modified.
  #
  # @example
  #   ```ruby
  #   vector.transform!(transformation)
  #   ```
  #
  # @param transform [Geom::Transformation]
  #   A Transformation object to apply to the vector.
  #
  # @return [Geom::Vector3d] the transformed vector
  #
  sig { params(transform: Geom::Transformation).returns(Geom::Vector3d) }
  def transform!(transform)
    self
  end

  # The unitvector? method is used to see if the vector is a unit vector.
  #
  # This is equivalent to vec.length == 1.0
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(0,0,1)
  #   status = vector.unitvector?
  #   ```
  #
  # @return [Boolean] true if the vector is a unit vector. False if
  #   the vector is not a unit vector.
  #
  sig { returns(T::Boolean) }
  def unitvector?
    true
  end

  # The valid? method is used to verify if a vector is valid. A vector is valid
  # if its length is not zero.
  #
  # @example
  #   # A zero length vector will be invalid
  #   vector = Geom::Vector3d.new(0,0,0)
  #   status = vector.valid?
  #   # A non-zero length vector is valid
  #   vector = Geom::Vector3d.new(0,0,1)
  #   status = vector.valid?
  #
  # @return [Boolean] true if the vector is valid. false if the
  #   vector is not valid.
  #
  sig { returns(T::Boolean) }
  def valid?
    true
  end

  # The x method is used to retrieve the x coordinate of the vector.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new 1,2,3 # clarn (this line was missing)
  #   x = vector.x
  #   ```
  #
  # @return [Length] the x coordinate of the vector
  #
  sig { returns(Numeric) }
  def x
    1
  end

  # The x= method is used to set the x coordinate of the vector.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new 1,2,3
  #   x = vector.x = 10
  #   ```
  #
  # @param x [Numeric]
  #   The x coordinate for the vector.
  #
  # @return [Numeric] the newly set x coordinate for the vector
  #
  sig { params(value: Numeric).returns(Numeric) }
  def x=(value)
    value
  end

  # The y method is used to retrieve the y coordinate of the vector.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(1,2,3)
  #   y = vector.y
  #   ```
  #
  # @return [Length] the y coordinate of the vector
  #
  sig { returns(Numeric) }
  def y
    2
  end

  # Set the y coordinate of the vector.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(1,2,3)
  #   y = vector.y = 10
  #   ```
  #
  # @param y [Numeric]
  #   The y coordinate for the vector.
  #
  # @return [Numeric] the newly set y coordinate for the vector
  #
  sig { params(value: Numeric).returns(Numeric) }
  def y=(value)
    value
  end

  # Get the z coordinate of the vector.
  #
  #   ```ruby
  $1 #   ```
  #

  #   vector = Geom::Vector3d.new(1,2,3)
  #   z = vector.z
  #   ```
  #
  # @return [Length] the z coordinate of the vector
  #
  sig { returns(Numeric) }
  def z
    3
  end

  # Set the z coordinate of the vector.
  #
  # @example
  #   ```ruby
  #   vector = Geom::Vector3d.new(1,2,3)
  #   z = vector.z = 10
  #   ```
  #
  # @param z [Numeric]
  #   The z coordinate for the vector.
  #
  # @return [Numeric] the newly set z coordinate for the vector
  #
  sig { params(value: Numeric).returns(Numeric) }
  def z=(value)
    value
  end
end
