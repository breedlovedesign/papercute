# typed: true
# @version SketchUp 6.0
class Geom::Transformation
  extend T::Sig

  # Class Methods

  # The axes method creates a transformation that goes from world coordinates
  # to an arbitrary coordinate system defined by an origin and three axis
  # vectors.
  #
  # @example
  #   # Creates a transformation that "flips" the axes from XYZ to XZY. Something
  #   # one often need for importers/exporters when dealing with applications
  #   # that threat Y as "up".
  #   tr = Geom::Transformation.axes(ORIGIN, X_AXIS, Z_AXIS, Y_AXIS.reverse)
  #
  # @overload axes(origin, xaxis, yaxis, zaxis)
  #
  #   @param origin [Geom::Point3d]
  #   @param xaxis  [Geom::Vector3d]
  #   @param yaxis  [Geom::Vector3d]
  #   @param zaxis  [Geom::Vector3d]
  #   @return [Geom::Transformation]
  #
  # @overload axes(origin, xaxis, yaxis)
  #
  #   When the Z axis is omitted and arbitrary axis is computed from the X and Y
  #   axes.
  #   @param origin [Geom::Point3d]
  #   @param xaxis  [Geom::Vector3d]
  #   @param yaxis  [Geom::Vector3d]
  #   @return [Geom::Transformation]
  #
  # @raise [ArgumentError] if any of the vectors are zero length.
  #
  # @version SketchUp 6.0
  def self.axes(*args)
  end

  # The interpolate method is used to create a new transformation that is the
  # result of interpolating between two other transformations.
  #
  # Parameter is a weight (between 0.0 and 1.0) that identifies whether to favor
  # transformation1 or transformation2.
  #
  # @example
  #   origin = Geom::Point3d.new(0, 0, 0)
  #   x = Geom::Vector3d.new(0, 1, 0)
  #   y = Geom::Vector3d.new(1, 0, 0)
  #   z = Geom::Vector3d.new(0, 0, 1)
  #   point = Geom::Point3d.new(10, 20, 30)
  #   t1 = Geom::Transformation.new(point)
  #   t2 = Geom::Transformation.axes(origin, x, y, z)
  #   # This produce a transformation that is a mix of 75% t1 and 25% t2.
  #   t3 = Geom::Transformation.interpolate(t1, t2, 0.25)
  #
  # @param transform1 [Geom::Transformation]
  #
  # @param transform2 [Geom::Transformation]
  #
  # @param weight [Float]
  #   A value between 0.0 and 1.0 (see comments).
  #
  # @return [Geom::Transformation]
  #
  # @version SketchUp 6.0
  def self.interpolate(transform1, transform2, weight)
  end

  # The rotation method is used to create a transformation that does rotation
  # about an axis.
  #
  # The axis is defined by a point and a vector. The angle is given in radians.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 0)
  #   vector = Geom::Vector3d.new(0, 0, 1)
  #   angle = 45.degrees # Return 45 degrees in radians.
  #   transformation = Geom::Transformation.rotation(point, vector, angle)
  #
  # @param point [Geom::Point3d]
  #
  # @param vector [Geom::Vector3d]
  #
  # @param angle [Float]
  #   The angle in radians.
  #
  # @return [Geom::Transformation]
  #
  # @version SketchUp 6.0
  def self.rotation(point, vector, angle)
  end

  # The scaling method is used to create a transformation that does scaling.
  #
  # @example
  #   point = Geom::Point3d.new(20, 30, 0)
  #   scale = 10
  #   tr = Geom::Transformation.scaling(point, scale)
  #
  # @overload scaling(scale)
  #
  #   @note This might yield an unexpected transformation. It sets the 16th value
  #     to the scaling factor. Something not all extensions reading the
  #     transformation expects. Consider using +scaling(xscale, yscale, zscale)+
  #     instead.
  #   With one argument, it does a uniform scale about the origin.
  #   @param scale [Float] The global scale factor for the transform.
  #   @return [Geom::Transformation]
  #
  # @overload scaling(xscale, yscale, zscale)
  #
  #   With three arguments, it does a non-uniform scale about the origin.
  #   @param xscale [Float] The scale factor in the x direction for the transform.
  #   @param yscale [Float] The scale factor in the y direction for the transform.
  #   @param zscale [Float] The scale factor in the z direction for the transform.
  #   @return [Geom::Transformation]
  #
  # @overload scaling(point, xscale, yscale, zscale)
  #
  #   With four arguments it does a non-uniform scale about an arbitrary point.
  #   @param point  [Geom::Point3d]
  #   @param xscale [Float] The scale factor in the x direction for the transform.
  #   @param yscale [Float] The scale factor in the y direction for the transform.
  #   @param zscale [Float] The scale factor in the z direction for the transform.
  #   @return [Geom::Transformation]
  #
  # @overload scaling(point, scale)
  #
  #   With two arguments, it does a uniform scale about an arbitrary point.
  #   @param point [Geom::Point3d]
  #   @param scale [Float]The global scale factor for the transform.
  #   @return [Geom::Transformation]
  #
  # @version SketchUp 6.0
  def self.scaling(*args)
  end

  # The translation method is used to create a transformation that does
  # translation.
  #
  # @example
  #   vector = Geom::Vector3d.new(0, 1, 0)
  #   tr = Geom::Transformation.translation(vector)
  #
  # @overload translation(vector)
  #
  #   @param vector [Geom::Vector3d]
  #   @return [Geom::Transformation]
  #
  # @overload translation(point)
  #
  #   @param point [Geom::Point3d]
  #   @return [Geom::Transformation]
  #
  # @version SketchUp 6.0
  def self.translation(arg)
  end

  # Instance Methods

  # The {#*} method is used to do matrix multiplication using the transform.
  #
  # @example
  #   point1 = Geom::Point3d.new(10, 20, 30)
  #   point2 = Geom::Point3d.new(2, 2, 2)
  #   tr = Geom::Transformation.new(point1)
  #   # Returns Point3d(12, 22, 32)
  #   point3 = tr * point2
  #
  # @overload *(point)
  #
  #   @param point [Geom::Point3d]
  #   @return [Geom::Point3d]
  #
  # @overload *(vector)
  #
  #   @param vector [Geom::Vector3d]
  #   @return [Geom::Vector3d]
  #
  # @overload *(transformation)
  #
  #   @param transformation [Geom::Transformation]
  #   @return [Geom::Transformation]
  #
  # @overload *(plane)
  #
  #   @param plane [Array(Numeric, Numeric, Numeric, Numeric)]
  #   @return [Array(Float, Float, Float, Float)] transformed plane
  #
  # @overload *(plane)
  #
  #   @param plane [Array(Geom::Point3d, Geom::Vector3d)]
  #   @return [Array(Float, Float, Float, Float)] transformed plane
  #
  # @overload *(point)
  #
  #   @param [Array((Numeric, Numeric, Numeric)] point
  #   @return [Array(Float, Float, Float)]
  #
  # @version SketchUp 6.0
  def *(arg)
  end

  # The {#clone} method is used to create a copy of a transformation.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   tr1 = Geom::Transformation.new(point)
  #   tr2 = tr1.clone
  #
  # @return [Geom::Transformation]
  #
  # @version SketchUp 6.0
  def clone
  end

  # The {#identity?} method is used to determine if a transformation is the
  # {IDENTITY} transform.
  #
  # @example
  #   tr = Geom::Transformation.new(ORIGIN)
  #   # Returns false.
  #   status = tr.identity?
  #
  # @example
  #   # Returns true.
  #   status = IDENTITY.identity?
  #
  # @example
  #   tr = Geom::Transformation.new
  #   # Returns true.
  #   status = tr.identity?
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   tr = Geom::Transformation.new(point)
  #   # Returns false.
  #   status = tr.identity?
  #
  # @note This only looks at the flag to see if the transform has not been
  #   modified. If the transform has been changed, this will return false even if
  #   it is really the identity.
  #
  # @return [Boolean] +true+ if the transformation is the identity
  #
  # @version SketchUp 6.0
  def identity?
  end

  # The new method is used to create a new transformation.
  #
  # You can use this method or one of the more specific methods for creating
  # specific kinds of Transformations.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   tr = Geom::Transformation.new(point)
  #
  # @overload initialize
  #
  #   @return [Geom::Transformation] identity Transformation.
  #
  # @overload initialize(point)
  #
  #   Translates the origin to point.
  #   @param point [Geom::Point3d]
  #   @return [Geom::Transformation]
  #
  # @overload initialize(vector)
  #
  #   @param vector [Geom::Vector3d]
  #   @return [Geom::Transformation]
  #
  # @overload initialize(transform)
  #
  #   Creates a Transformation that is a copy of another Transformation. This is
  #   equivalent to {#clone}.
  #   @param transform [Geom::Transformation]
  #   @return [Geom::Transformation]
  #
  # @overload initialize(array)
  #
  #   @param matrix [Array<Numeric>] Creates a Transformation from a 16 element Array.
  #   @return [Geom::Transformation]
  #
  # @overload initialize(xaxis, yaxis, zaxis, origin)
  #
  #   @param xaxis [Geom::Vector3d]
  #   @param yaxis [Geom::Vector3d]
  #   @param zaxis [Geom::Vector3d]
  #   @param origin [Geom::Point3d]
  #   @return [Geom::Transformation]
  #
  # @overload initialize(origin, zaxis)
  #
  #   Creates a Transformation where origin is the new origin, and zaxis is the
  #   z axis. The x and y axes are determined using an arbitrary axis rule.
  #   @param origin [Geom::Point3d]
  #   @param zaxis [Geom::Vector3d]
  #   @return [Geom::Transformation]
  #
  # @overload initialize(origin, xaxis, yaxis)
  #
  #   Creates a Transformation given a new origin, x axis and y axis.
  #   @param origin [Geom::Point3d]
  #   @param xaxis  [Geom::Vector3d]
  #   @param yaxis  [Geom::Vector3d]
  #   @return [Geom::Transformation]
  #
  # @overload initialize(pt, axis, angle)
  #
  #   Creates a Transformation that rotates by angle (given in radians) about a
  #   line defined by pt and axis.
  #   @param origin [Geom::Point3d]
  #   @param axis   [Geom::Vector3d]
  #   @param angle  [Numeric]
  #   @return [Geom::Transformation]
  #
  # @overload initialize(scale)
  #
  #   Creates a transformation that does uniform scaling.
  #   @param scale [Numeric]
  #   @return [Geom::Transformation]
  #
  # @version SketchUp 6.0
  def initialize(*args)
  end

  # The {#inverse} method is used to retrieve the inverse of a transformation.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   tr1 = Geom::Transformation.new(point)
  #   tr2 = tr1.inverse
  #
  # @return [Geom::Transformation]
  #
  # @version SketchUp 6.0
  def inverse
  end

  # The {#invert!} method sets the transformation to its inverse.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   tr = Geom::Transformation.new(point)
  #   tr.invert!
  #
  # @return [Geom::Transformation]
  #
  # @version SketchUp 6.0
  def invert!
  end

  # The {#origin} method retrieves the origin of a rigid transformation.
  #
  # @example
  #   point1 = Geom::Point3d.new(10, 20, 30)
  #   tr = Geom::Transformation.new(point1)
  #   point2 = tr.origin
  #
  # @return [Geom::Point3d] the origin of the transformation.
  #
  # @version SketchUp 6.0
  def origin
  end

  # The {#set!} method is used to set this transformation to match another one.
  #
  # The argument is anything that can be converted into a transformation.
  #
  # @example
  #   point1 = Geom::Point3d.new(10, 20, 30)
  #   tr1 = Geom::Transformation.new(point)
  #   point2 = Geom::Point3d.new(60, 40, 70)
  #   tr1.set!(point2)
  #
  # @overload set!(transformation)
  #
  #   @param transformation [Geom::Transformation]
  #   @return [Geom::Transformation]
  #
  # @overload set!(point)
  #
  #   @param point [Geom::Point3d]
  #   @return [Geom::Transformation]
  #
  # @overload set!(scale)
  #
  #   @param scale [Numeric]
  #   @return [Geom::Transformation]
  #
  # @overload set!(matrix)
  #
  #   @param matrix [Array<Numeric>]  Array of 16 floats.
  #   @return [Geom::Transformation]
  #
  # @overload set!(vector)
  #
  #   @param vector [Geom::Vector3d]
  #   @return [Geom::Transformation]
  #
  # @version SketchUp 6.0
  def set!(arg)
  end

  # The {#to_a} method retrieves a 16 element array which contains the values that
  # define the transformation.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   tr = Geom::Transformation.new(point)
  #   # This splits the 16 items into a string of 4x4 elements for easier reading.
  #   str4x4 = tr.to_a.each_slice(4).inject { |str, row| "#{str}\r\n#{row}" }
  #
  # @return [Array<Float>]
  #
  # @version SketchUp 6.0
  def to_a
  end

  # The {#xaxis} method retrieves the x axis of a rigid transformation.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   tr = Geom::Transformation.new(point)
  #   x = tr.xaxis
  #
  # @return [Geom::Vector3d]
  #
  # @version SketchUp 6.0
  def xaxis
  end

  # The {#yaxis} method retrieves the y axis of a rigid transformation.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   tr = Geom::Transformation.new(point)
  #   x = tr.yaxis
  #
  # @return [Geom::Vector3d]
  #
  # @version SketchUp 6.0
  def yaxis
  end

  # The {#zaxis} method retrieves the z axis of a rigid transformation.
  #
  # @example
  #   point = Geom::Point3d.new(10, 20, 30)
  #   tr = Geom::Transformation.new(point)
  #   x = tr.zaxis
  #
  # @return [Geom::Vector3d]
  #
  # @version SketchUp 6.0
  def zaxis
  end
end
