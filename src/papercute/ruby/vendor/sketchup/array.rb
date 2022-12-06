# typed: true

class Array
  extend T::Sig

  # Instance Methods

  # The {#cross} method is used to compute the cross product between two vectors.
  #
  # @example With 3d array
  #   ```ruby
  #   vector1 = Geom::Vector3d.new(0, 1, 0)
  #   array = [1, 0, 0]
  #   vector2 = array.cross(vector1)
  #   ```
  #   @return `Vector3d`
  #
  # @example With 2d array & Vector2d
  #   ```ruby
  #   vector1 = Geom::Vector2d.new(0, 1)
  #   array = [1, 0]
  #   vector2 = array.cross(vector1)
  #   ```
  #  @return `Vector2d`
  #
  #  ## watch out
  #   ```ruby
  #    vector1 = [1,2,3]
  #    array = [1, 0]
  #    vector2 = array.cross(vector1)
  #  ```
  #
  #  This will force `array` to be `[1, 0, 0]`
  #  and successfully return a `Vector3d`
  #  @return `Vector3d`
  #
  #  ## however
  #  if `vector1` is a `Geom::Vector3d` the
  #  above example fails with message:
  #
  #  ArgumentError: Cannot convert argument to `Geom::Vector3d`
  #
  #  ```ruby
  #  [1,0,0].cross([1,0,0])                   #=> Vector3d(0, 0, 0)
  #  [1,0,0].cross([1,0])                     #=> Vector3d(0, 0, 0)
  #  [1,0,0].cross(Geom::Vector3d.new(1,0,0)) #=> Vector3d(0, 0, 0)
  #  [1,0,0].cross(Geom::Vector2d.new(1,0))   #=> error
  #  [1,0].cross([1,0,0])                     #=> Vector3d(0, 0, 0)
  #  [1,0].cross([1,0])                       #=> 0.0 FLOAT!?
  #  [1,0].cross(Geom::Vector3d.new(1,0,0))   #=> Vector3d(0, 0, 0)
  #  [1,0].cross(Geom::Vector2d.new(1,0))     #=> 0.0 FLOAT!?
  #  ```
  sig do
    params(vector: T.any(Geom::Vector3d, Geom::Vector2d)).returns(
      T.any(Geom::Vector3d, Geom::Vector2d)
    )
  end
  def cross(vector)
    if self.length == 2
      case vector
      when Geom::Vector3d
        Geom::Vector2d.new
      when Geom::Vector2d
        Geom::Vector2d.new
      end
    elsif self.length == 3
      case vector
      when Geom::Vector3d
        Geom::Vector3d.new
      when Geom::Vector2d
        raise ArgumentError
      end
    else
      raise RuntimeError
    end
  end

  # The {#distance} method is used to compute the distance between two points.
  #
  # @example With 3d array
  #
  #   ```ruby
  #   point = Geom::Point3d.new(10, 10, 10)
  #   array = [1, 1, 1]
  #   distance = array.distance(point)
  #   ```
  #
  #   @return `Length`
  #
  # ## overly flexible garbo below
  # @example With 2d array
  #   point = Geom::Point2d.new(10, 10)
  #   array = [1, 2]
  #   distance = array.distance(point)
  #
  #   point = Geom::Point3d.new(10, 10, 10)
  #   distance = array.distance(point)
  #
  # @overload distance(point)
  #
  #   @param [Geom::Point3d] point
  #   @return [Length]
  #
  # @overload distance(point)
  #
  #   @param [Geom::Point2d] point
  #   @return [Length]
  #
  # @raise ArgumentError if the argument is the wrong point type
  # clarn 2d and 3d arrays and Point2/3d objects can be used interchangeably
  # clarn suggest: @raise ArgumentError if the argument is not a valid point
  # representation, ie [Numeric, Numeric], [Numeric, Numeric, Numeric], Point2d or Point3d
  sig { params(point: Geom::Point3d).returns(Length) }
  def distance(point)
    Length.new(1)
  end

  # `distance_to_line` computes the distance from a
  # `Geom::Point3d` object (as represented by an `Array`) to a line.
  #
  # @example
  #   ```ruby
  #   pt  = Geom::Point3d.new(0, 0, 0)
  #   vec = Geom::Vector3d.new(0, 0, 1)
  #   arr = [10, 10, 10]
  #   distance = arr.distance_to_line(pt, vec)
  #   ```
  #
  # @overload distance_to_line([point, vector])
  #
  #
  sig { params(pt: Geom::Point3d, vec: Geom::Vector3d).returns(Length) }
  def distance_to_line(pt, vec)
    Length.new(1)
  end

  # The {#distance_to_plane} method is used to compute the distance from a
  # {Geom::Point3d} object to a plane.
  #
  # @example
  #   ```ruby
  #   pt    = Geom::Point3d.new(0, 0, 0)
  #   vec   = Geom::Vector3d.new(0, 0, 1)]
  #   plane = [pt, vec]
  #   array = [10, 10, 10]
  #   distance = array.distance_to_plane(plane)
  #   # or the preferred
  #   distance = array.distance_to_plane(pt, vec)
  #   ```
  #
  # ## see below for other `plane` representations
  #
  # @overload distance_to_plane(point1, point2, point3)
  #
  #   Plane defined by three points.
  #   @note The three points should not be co-linear or duplicate.
  #   @param [Geom::Point3d] point1
  #   @param [Geom::Point3d] point2
  #   @param [Geom::Point3d] point3
  #   @return [Length] The distance between the two points.
  #
  # @overload distance_to_plane(float1, float2, float3, float4)
  #
  #   Plane defined by its coefficents.
  #   @param [Float] float1
  #   @param [Float] float2
  #   @param [Float] float3
  #   @param [Float] float4
  #   @return [Length] The distance between the two points.
  #
  # @overload distance_to_plane(array)
  #
  #   Plane defined by three points.
  #   @note The three points should not be co-linear or duplicate.
  #   @param [Array<Geom::Point3d, Geom::Point3d, Geom::Point3d>] point
  #   @return [Length] The distance between the two points.
  #
  # @overload distance_to_plane(array)
  #
  #   Plane defined by a point and a vector.
  #   @param [Array<Geom::Point3d, Geom::Vector3d>] point
  #   @return [Length] The distance between the two points.
  #
  # @overload distance_to_plane(array)
  #
  #   Plane defined by its coefficents.
  #   @param [Array<Float, Float, Float, Float>] point
  #   @return [Length] The distance between the two points.
  #
  sig { params(pt: Geom::Point3d, vec: Geom::Vector3d).returns(Length) }
  def distance_to_plane(pt, vec)
    Length.new(1)
  end

  # The {#dot} method is used to compute the dot product between two vectors.
  #
  # @example With 3d array
  #  ```ruby
  #   vector = Geom::Vector3d.new(12, 12, 0)
  #   array = [12, 0, 0]
  #   dot_product = array.dot(vector)
  #   ```
  # @example With 2d array
  #   ```ruby
  #   vector = Geom::Vector2d.new(12, 12)
  #   array = [12, 0]
  #   dot_product = array.dot(vector)
  #   ```
  # @overload dot(vector)
  #
  #   @param [Geom::Vector3d] vector
  #   @return [Float]
  #
  # @overload dot(vector)
  #
  #   @param [Geom::Vector2d] vector
  #   @return [Float]
  #
  # @raise ArgumentError if the argument is the wrong vector type
  #  ```ruby
  #  [1,0,0].dot([1,0,0])                   => 1.0
  #  [1,0,0].dot([1,0])                     => 1.0
  #  [1,0,0].dot(Geom::Vector3d.new(1,0,0)) => 1.0
  #  [1,0,0].dot(Geom::Vector2d.new(1,0))   => error
  #  [1,0].dot([1,0,0])                     => 1.0
  #  [1,0].dot([1,0])                       => 1.0
  #  [1,0].dot(Geom::Vector3d.new(1,0,0))   => 1.0
  #  [1,0].dot(Geom::Vector2d.new(1,0))     => 1.0
  #  ```
  sig { params(vector: Geom::Vector3d).returns(Float) }
  def dot(vector)
    1.0
  end

  # The {#normalize} method is used to normalize a vector (setting its
  # length to 1). It returns a new array rather than changing the original in
  # place.
  #
  # @example With 3d array
  #   ```ruby
  #   array = [1, 2, 3]
  #   normal_vector = array.normalize
  #   ```
  # @example With 2d array
  #   array = [1, 2]
  #   normal_vector = array.normalize
  #
  # @note The arguments and return value will be converted to a floating point
  #   value. (Unlike in the {Geom::Vector3d#normalize!} method.)
  #
  # @overload normalize
  #
  #   @return [Array(Float, Float, Float)] an array object representing a vector
  #
  # @overload normalize
  #
  #   @return [Array(Float, Float)] an array object representing a vector
  #
  sig { returns([Float, Float, Float]) }
  def normalize
    [0.1, 0.1, 0.1]
  end

  # The {#normalize!} method is used to normalize a vector in place (setting its
  # length to 1).
  #
  # @example With 3d array
  #   array = [1, 2, 3]
  #   # This will modify 'array' in place
  #   array.normalize!
  #
  # @example With 2d array
  #   array = [1, 2]
  #   array.normalize!
  #
  # @overload normalize!
  #
  #   @return [Array(Float, Float, Float)] an array object representing a vector
  #
  # @overload normalize!
  #
  #   @return [Array(Float, Float)] an array object representing a vector
  #
  sig { returns([Float, Float, Float]) }
  def normalize!
    [0.1, 0.1, 0.1]
  end

  # TODO: develop the `ONE TRUE WAY` limit the method sigs
  # as far as Sorbet is concerned to the common case
  # make wrapper methods that convert alternative sigs
  # to the less common cases if they can be documented usefully
  # by Sorbet
  #
  # by writing a subset of the possible input and output types
  # into the sorbet type annotations we can give sorbet more to
  # work with and hopefully we can make our code more explict.
  #
  # try to write your code like this to benefit from the opinionated
  # type annotations
  # anything that consumes an `Array` should output a stronger type
  # any stronger type can convert to `Array`

  # The {#offset} method is used to offset a point by a vector. it returns a new
  # array rather than modifying the original in place.
  #
  # @example With 3d array
  #   array = [10, 10, 10]
  #   vector = Geom::Vector3d.new(0, 0, 1)
  #   length_array = array.offset(vector)
  #
  #  __A,B = vec1, vec2__
  #  __A.offset(B) != B.offset(A)__
  #
  #  Summary of other output types
  #  ```ruby
  #  arr3d   arr3d arr2d vec3d vec2d
  #  returns     3    3!     3   err
  #  arr2d   arr3d arr2d vec3d vec2d
  #  returns     3     2     3     2
  #  ```
  #
  sig { params(vec: Geom::Vector3d, len: Numeric).returns(T::Array[Length]) }
  def offset(vec, len = 1)
    [Length.new(1), Length.new(1), Length.new(2)]
  end

  # The {#offset!} method is used to offset a point by a vector. The array is
  # modified in place.
  #
  # @example With 3d array
  #   array = [10, 10, 10]
  #   vector = Geom::Vector3d.new(0, 0, 1)
  #   length_array = array.offset(vector)
  #
  #  __A,B = vec1, vec2__
  #  __A.offset(B) != B.offset(A)__
  #
  #  Summary of other output types
  #  ```ruby
  #  arr3d   arr3d arr2d vec3d vec2d
  #  returns     3    3!     3   err
  #  arr2d   arr3d arr2d vec3d vec2d
  #  returns     3     2     3     2
  #  ```
  sig { params(vec: Geom::Vector3d, len: Numeric).returns(T::Array[Length]) }
  def offset!(vec, len = 1)
    [Length.new(1), Length.new(1), Length.new(2)]
  end

  # The {#on_line?} method is used to determine if a {Geom::Point3d} object is on
  # a line.
  #
  # @example
  #   line = [Geom::Point3d.new(0, 0, 0), Geom::Vector3d.new(0, 0, 1)]
  #   array = [10, 10, 10]
  #   # This will return a true or false value
  #   on_plane = array.on_line?(line)
  #
  # @overload on_line?(point, vector)
  #
  #   @param [Geom::Point3d] point
  #   @param [Geom::Vector3d] vector
  #   @return [Boolean] +true+ if the point is on the line, +false+ if the
  #     point is not on the line.
  #
  # @overload on_line?(point1, point2)
  #
  #   @param [Geom::Point3d] point1
  #   @param [Geom::Point3d] point1
  #   @return [Boolean] +true+ if the point is on the line, +false+ if the
  #     point is not on the line.
  #
  sig do
    params(
      point: Geom::Point3d,
      pt_or_vect: T.any(Geom::Point3d, Geom::Vector3d)
    ).returns(T::Boolean)
  end
  def on_line?(point, pt_or_vect)
    point.inspect
    pt_or_vect.inspect
    true
  end

  # The {#on_plane?} method is used to determine if a {Geom::Point3d} object is
  # on a plane (to within SketchUp's standard floating point tolerance).
  #
  # @example
  #   plane = [Geom::Point3d.new(0, 0, 0), Geom::Vector3d.new(0, 0, 1)]
  #   array = [10, 10, 10]
  #   # This will return a true or false value
  #   on_plane = array.on_plane?(plane)
  #
  # @overload on_plane?(point, vector)
  #
  #   Plane defined by
  #   @param [Geom::Point3d] point
  #   @param [Geom::Vector3d] vector
  #
  # @overload on_plane?(point1, point2, point3)
  #
  #   Plane defined by three points.
  #   @note The three points should not be co-linear or duplicate.
  #   @param [Geom::Point3d] point1
  #   @param [Geom::Point3d] point2
  #   @param [Geom::Point3d] point3
  #
  # @overload on_plane?(float1, float2, float3, float4)
  #
  #   Plane defined by its coefficents.
  #   @param [Float] float1
  #   @param [Float] float2
  #   @param [Float] float3
  #   @param [Float] float4
  #
  # @overload on_plane?(array)
  #
  #   Plane defined by three points.
  #   @note The three points should not be co-linear or duplicate.
  #   @param [Array<Geom::Point3d, Geom::Vector3d>] point
  #
  # @overload on_plane?(array)
  #
  #   Plane defined by three points.
  #   @param [Array<Geom::Point3d, Geom::Point3d, Geom::Point3d>] point
  #
  # @overload on_plane?(array)
  #
  #   Plane defined by its coefficents.
  #   @param [Array<Float, Float, Float, Float>] point
  #
  # @return [Boolean]
  #
  sig do
    params(pt1: Geom::Point3d, pt2: Geom::Point3d, pt3: Geom::Point3d).returns(
      T::Boolean
    )
  end
  def on_plane?(pt1, pt2, pt3)
    pt3.z > 1
  end
  # The {#project_to_line} method is used to retrieve the projection of a
  # {Geom::Point3d} object onto a line.
  #
  # @example
  #   line = [Geom::Point3d.new(0, 0, 0), Geom::Vector3d.new(0, 0, 1)]
  #   array = [10, 10, 10]
  #   # This will return a new Array
  #   point_on_line = array.project_to_line(line)
  #
  # @overload project_to_line(point, vector)
  #
  #   @param [Geom::Point3d] point
  #   @param [Geom::Vector3d] vector
  #   @return [Array(Length, Length, Length)] A new  point on the line that is
  #     closest to this point
  #
  # @overload project_to_line(point1, point2)
  #
  #   @param [Geom::Point3d] point1
  #   @param [Geom::Point3d] point1
  #   @return [Array(Length, Length, Length)] A new  point on the line that is
  #     closest to this point
  #
  sig do
    params(
      pt: Geom::Point3d,
      pt_or_vect: T.any(Geom::Point3d, Geom::Vector3d)
    ).returns(T::Array[Length])
  end
  def project_to_line(pt, pt_or_vect)
    [Length.new(1), Length.new(1), Length.new(1)]
  end

  # The {#project_to_plane} method retrieves the projection of a {Geom::Point3d}
  # onto a plane.
  #
  # @example
  #   plane = [Geom::Point3d.new(0, 0, 0), Geom::Vector3d.new(0, 0, 1)]
  #   array = [10, 10, 10]
  #   point_on_plane = array.project_to_plane(plane)
  #
  # @overload project_to_plane(point, vector)
  #
  #   Plane defined by
  #   @param [Geom::Point3d] point
  #   @param [Geom::Vector3d] vector
  #   @return [Array(Length, Length, Length)]
  #
  # @overload project_to_plane(point1, point2, point3)
  #
  #   Plane defined by three points.
  #   @note The three points should not be co-linear or duplicate.
  #   @param [Geom::Point3d] point1
  #   @param [Geom::Point3d] point2
  #   @param [Geom::Point3d] point3
  #   @return [Array(Length, Length, Length)]
  #
  # @overload project_to_plane(float1, float2, float3, float4)
  #
  #   Plane defined by its coefficents.
  #   @param [Float] float1
  #   @param [Float] float2
  #   @param [Float] float3
  #   @param [Float] float4
  #   @return [Array(Length, Length, Length)]
  #
  # @overload project_to_plane(array)
  #
  #   Plane defined by three points.
  #   @note The three points should not be co-linear or duplicate.
  #   @param [Array(Geom::Point3d, Geom::Vector3d)] point
  #   @return [Array(Length, Length, Length)]
  #
  # @overload project_to_plane(array)
  #
  #   Plane defined by three points.
  #   @param [Array(Geom::Point3d, Geom::Point3d, Geom::Point3d)] point
  #   @return [Array(Length, Length, Length)]
  #
  # @overload project_to_plane(array)
  #
  #   Plane defined by its coefficents.
  #   @param [Array(Float, Float, Float, Float)] point
  #   @return [Array(Length, Length, Length)]
  #
  sig do
    params(pt1: Geom::Point3d, pt2: Geom::Point3d, pt3: Geom::Point3d).returns(
      (T::Array[Length])
    )
  end
  def project_to_plane(pt1, pt2, pt3)
    [pt1, pt2, pt3].inspect
    [Length.new(1), Length.new(1), Length.new(1)]
  end

  # The {#transform} method is used to apply a {Geom::Transformation} or
  # {Geom::Transformation2d} object to a {Geom::Point3d} or {Geom::Point2d} object
  # defined by an {Array} object.
  #
  # This method returns a new {Array} object instead of modifying the original.
  #
  # @example
  #   point1 = Geom::Point3d.new(10, 20, 30)
  #   transform = Geom::Transformation.new(point1)
  #   array = [1, 2, 3]
  #   # This will return a new Array
  #   point2 = array.transform(transform)
  #
  # @overload transform(transform)
  #
  #   @param [Geom::Transformation2d] transform
  #   @return [Array<Length, Length>] The newly transformed point.
  #
  # @overload transform(transform)
  #
  #   @param [Geom::Transformation] transform
  #   @return [Array<Length, Length, Length>] The newly transformed point.
  #
  sig { params(transform: Geom::Vector3d).returns(T::Array[Length]) }
  def transform(transform)
    [Length.new(1), Length.new(1), Length.new(1)]
  end

  # The {#transform!} method is used to apply a {Geom::Transformation} object to
  # a {Geom::Point3d} object defined by an {Array} object.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   transform = Geom::Transformation.new(point)
  #   array = [1, 2, 3]
  #   # This will modify 'array' in place
  #   array.transform!(transform)
  #
  # @note This method modifies the original.
  #
  # @overload transform!(transform)
  #
  #   @param [Geom::Transformation2d] transform
  #   @return [Array] The newly transformed point.
  #
  # @overload transform!(transform)
  #
  #   @param [Geom::Transformation] transform
  #   @return [Array] The newly transformed point.
  #
  sig { params(transform: Geom::Vector3d).returns(T::Array[Length]) }
  def transform!(transform)
    [Length.new(1), Length.new(1), Length.new(1)]
  end

  # The {#vector_to} method is used to create an array as a vector from one point
  # to a second point.
  #
  # @example With 3d array
  #   point = Geom::Point3d.new(10, 20, 30)
  #   array = [1, 2, 3]
  #   # This will return a new Vector3d
  #   vector = array.vector_to(point)
  #
  # @example With 2d array
  #   point = Geom::Point2d.new(10, 20)
  #   array = [1, 2]
  #   # This will return a new Vector2d
  #   vector = array.vector_to(point)
  #
  #   point = Geom::Point3d.new(10, 20)
  #   # This will return a new Vector3d
  #   vector = array.vector_to(point)
  #
  # @overload vector_to(point)
  #
  #   @param [Geom::Point3d] point
  #   @return [Geom::Vector3d]
  #
  # @overload vector_to(point)
  #
  #   @param [Geom::Point2d] point
  #   @return [Geom::Vector2d]
  #
  # @raise ArgumentError if the argument is the wrong point type clarn
  # ArgumentError: Cannot convert argument to Geom::Point3d if
  # @param [Geom::Point2d] when called on Geom::Point3d or [num,num,num]
  # however, if param is [num, num] it's treated as if param is [num, num, 0]
  # and no error is raised and a Vector3d is returned with z=0
  # so, be careful when using 2d because errors won't necesarily be caught
  # during static analysis (see also Array#distance)
  sig { params(point: Geom::Point3d).returns(Geom::Vector3d) }
  def vector_to(point)
    Geom::Vector3d.new
  end

  # The {#x} method retrieves the x coordinate.
  #
  # @example
  #   array = [1, 2, 3]
  #   # This will return a Fixnum, in this case 1
  #   x = array.x
  #
  #   array = [1.0, 2.0, 3.0]
  #   # This will return a Float, in this case 1.0
  #   x = array.x
  #
  # @return [Object, nil] The x coordinate if successful
  #
  sig { returns(Numeric) }
  def x
    1.0
  end

  # The {#x=} method sets the x coordinate.
  #
  # @example
  #   array = [1, 2, 3]
  #   # This will initialize the x value as a Float
  #   array.x = 2.5
  #   # This will initialize the x value as a Fixnum
  #   array.x = 5
  #
  # @param [Object] x
  #   The new x position.
  #
  # @return [Object] The new x coordinate if successful
  #
  sig { params(x: Numeric).returns(Numeric) }
  def x=(x)
    1.0
  end

  # The {#y} method retrieves the y coordinate.
  #
  # @example
  #   array = [1, 2, 3]
  #   # This will return a Fixnum, in this case 2
  #   y = array.y
  #
  #   array = [1.0, 2.0, 3.0]
  #   # This will return a Float, in this case 2.0
  #   y = array.y
  #
  # @return [Object, nil] The y coordinate if successful
  #
  sig { returns(Numeric) }
  def y
    1.0
  end

  # The {#y=} method sets the y coordinate.
  #
  # @example
  #   array = [1, 2, 3]
  #   # This will initialize the y value as a Float
  #   array.y = 2.5
  #   # This will initialize the y value as a Fixnum
  #   array.y = 5
  #
  # @param [Object] y
  #   The new y position.
  #
  # @return [Object] The new y coordinate if successful
  #
  sig { params(y: Numeric).returns(Numeric) }
  def y=(y)
    1.0
  end

  # The {#z} method retrieves the z coordinate.
  #
  # @example
  #   array = [1, 2, 3]
  #   # This will return a Fixnum, in this case 3
  #   z = array.z
  #
  #   array = [1.0, 2.0, 3.0]
  #   # This will return a Float, in this case 3.0
  #   z = array.z
  #
  # @return [Object, nil] The z coordinate if successful
  #
  sig { returns(T.nilable(Numeric)) }
  def z
    1.0
  end

  # The {#z=} method sets the z coordinate.
  #
  # @example
  #   array = [1, 2, 3]
  #   # This will initialize the z value as a Float
  #   array.z = 2.5
  #   # This will initialize the z value as a Fixnum
  #   array.z = 5
  #
  # @param [Object] z
  #   The new z position.
  #
  # @return [Object] The new z coordinate if successful
  #
  sig { params(z: Numeric).returns(Numeric) }
  def z=(z)
    if z.is_a?(Float)
      T.cast(1.0, Float)
    else
      # z.is_a?(Fixnum) => true
      T.cast(1, Fixnum)
    end
    # you get what you give YGWYG
    # is a good name for a grappling cult
    #
    # alternate single and hyphenated-within-reason words
    # judge by thirdparty winner
  end
end
