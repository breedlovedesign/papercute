# typed: true
# @version SketchUp 6.0
class Sketchup::ViewObserver
  extend T::Sig

  # Instance Methods

  # The {#onViewChanged} method is called whenever the view is altered, such as
  # when the user uses the Pan, Orbit, or Zoom tools are used.
  #
  # @example
  #   def onViewChanged(view)
  #     pust "onViewChanged: #{view}"
  #   end
  #
  # @param [Sketchup::View] view
  #
  # @return [nil]
  #
  # @version SketchUp 6.0
  def onViewChanged(view)
  end
end
