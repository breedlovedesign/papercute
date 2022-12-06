# typed: true
# @version SketchUp 2014
class Sketchup::DimensionObserver
  extend T::Sig

  # Instance Methods

  # The {#onTextChanged} method is invoked when your entity is erased.
  #
  # @example
  #   def onTextChanged(dimension)
  #     puts "onTextChanged: #{dimension}, new_text= #{dimension.text}"
  #   end
  #
  # @param [Sketchup::Dimension] dimension
  #   The dimension object whose text has
  #   been changed.
  #
  # @version SketchUp 2014
  def onTextChanged(dimension)
  end
end
