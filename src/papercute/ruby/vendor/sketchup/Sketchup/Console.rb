# typed: true
# @version SketchUp 2014
class Sketchup::Console
  extend T::Sig

  # Instance Methods

  # Clears the contents of SketchUp's Ruby Console.
  #
  # @example
  #   SKETCHUP_CONSOLE.clear
  #
  # @return true.
  #
  # @version SketchUp 2014
  def clear
  end

  # Hides the SketchUp Ruby Console.
  #
  # @example
  #   SKETCHUP_CONSOLE.hide
  #
  # @return true.
  #
  # @version SketchUp 2014
  def hide
  end

  # Displays the SketchUp Ruby Console.
  #
  # @example
  #   SKETCHUP_CONSOLE.show
  #
  # @return true.
  #
  # @version SketchUp 2014
  def show
  end

  # Returns the visibility state of the SketchUp Ruby Console.
  #
  # @example
  #   puts SKETCHUP_CONSOLE.visible?
  #
  # @return true if visible, false if not.
  #
  # @return [Boolean]
  #
  # @version SketchUp 2014
  def visible?
  end

  private

  # @return [Sketchup::Console]
  def initialize
  end
end
