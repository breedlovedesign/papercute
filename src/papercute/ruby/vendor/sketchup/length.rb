# typed: true
# @version SketchUp 6.0
class Length < Float
  extend T::Sig

  # Instance Methods

  # The < method is used to see if one length is less than another length.
  #
  # For example, if l1 = 1.0.inch and l2 = 1.000001.inch then l1 == l2 so l1
  # < l2 should return false.
  #
  # @example
  #   length1 = 12.to_l
  #   length2 = 11.to_l
  #   if length1 < length2
  #     puts "length1 is less than length2"
  #   else
  #     puts "length1 is not less than length2"
  #   end
  #
  # @param length2 [Length]
  #   A length value.
  #
  # @return [Boolean] true if length1 is < length2; false if
  #   length1 is not < length2
  #
  # @version SketchUp 6.0
  def <(length2)
  end

  # The <= method is used to see if one length is less than or equal to
  # another length.
  #
  # @example
  #   length1 = 11.to_l
  #   length2 = 12.to_l
  #   if length1 <= length2
  #     puts "length1 is less than or equal length2"
  #   else
  #     puts "length1 is greater than length2"
  #   end
  #
  # @param length2 [Length]
  #   A length value.
  #
  # @return [Boolean] true if length1 is <= length2; false if
  #   length1 is not <= length2
  #
  # @version SketchUp 6.0
  def <=(length2)
  end

  # The <=> method is used to see if one length is less than equal or greater
  # than another length. Because we change == for Length to do a test based on
  # a tolerance, we also need to change <=> to also take tolerance into account.
  #
  # @example
  #   length1 = 20.to_l
  #   length2 = 30.to_l
  #   result = length1 <=> length2
  #
  # @param length2 [Length]
  #   A length value.
  #
  # @return [Integer] the result of the comparison
  #
  # @version SketchUp 6.0
  def <=>(length2)
  end

  # The == method is used to see if one length is equal to another length.
  #
  # The equality comparison on Length values uses the default tolerance that
  # SketchUp uses for comparing lengths.
  #
  # @example
  #   length1 = 20.to_l
  #   length2 = 30.to_l
  #   is_equal = length1 == length2
  #
  # @param length2 [Length]
  #   A length value.
  #
  # @return [Boolean] true if length1 is == length2; false if
  #   length1 is not == length2
  #
  # @version SketchUp 6.0
  def ==(length2)
  end

  # The > method is used to see if one length is greater than another length.
  #
  # For example, if l1 = 1.0.inch and l2 = 1.000001.inch then l1 == l2 so l1 >
  # l2 should return false.
  #
  # @example
  #   length1 = 11.to_l
  #   length2 = 12.to_l
  #   if length1 > length2
  #     puts "length1 is greater than length2"
  #   else
  #     puts "length1 is not greater than length2"
  #   end
  #
  # @param length2 [Length]
  #   A length value.
  #
  # @return [Boolean] true if length1 is > length2; false if length1
  #   is not > length2
  #
  # @version SketchUp 6.0
  def >(length2)
  end

  # The >= method is used to see if one length is greater than or equal to
  # another length.
  #
  # For example, if l1 = 1.0.inch and l2 = 1.000001.inch then l1 == l2 so l1 >=
  # l2 should return true. Also L1 <= l2 would return true.
  #
  # @example
  #   length1 = 11.to_l
  #   length2 = 12.to_l
  #   if length1 >= length2
  #     puts "length1 is greater than or equal length2"
  #   else
  #     puts "length1 is less than length2"
  #   end
  #
  # @param length2 [Length]
  #   A length value.
  #
  # @return [Boolean] true if length1 is >= length2; false if
  #   length1 is not >= length2
  #
  # @version SketchUp 6.0
  def >=(length2)
  end

  # The inspect method is used to retrieve an unformatted string for the length,
  # which is the length in inches, regardless of the user's model unit settings.
  # See Length.to_s for a way automatically format your Length to the user's
  # model units.
  #
  # @example
  #   length = 55.to_l
  #   str = length.inspect
  #
  # @return [String] an unformatted length string
  #
  # @version SketchUp 6.0
  def inspect
  end

  # The to_f method is used to convert a length to a normal float.
  #
  # @example
  #   length = 45.to_l
  #   f = length.to_f
  #
  # @return [Float] the float length value
  #
  # @version SketchUp 6.0
  def to_f
  end

  # Format a length as a String using the current units formatting settings
  # for the model. (So if the user's model is set to feet, this method will
  # return a nicely formatted length in feet.)
  #
  # @example
  #   length = 55.to_l
  #   str = length.to_s
  #
  # @return [String] the float length value
  #
  # @version SketchUp 6.0
  def to_s
  end

  sig { params(number: Numeric).void }
  def initialize(number)
  end
end
