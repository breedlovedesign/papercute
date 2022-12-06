# typed: true
# @version SketchUp 6.0
class Sketchup::OptionsProviderObserver
  extend T::Sig

  # Instance Methods

  # The {#onOptionsProviderChanged} method is invoked when a property of an
  # {Sketchup::OptionsProvider} changes.
  #
  # @example
  #   def onOptionsProviderChanged(provider, name)
  #     puts "onOptionsProviderChanged: #{name}"
  #   end
  #
  # @param [Sketchup::OptionsProvider] provider
  #
  # @param [String] name
  #   The name of the specific option that was changed.
  #
  # @return [nil]
  #
  # @version SketchUp 6.0
  def onOptionsProviderChanged(provider, name)
  end
end
