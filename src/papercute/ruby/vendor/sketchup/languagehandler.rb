# typed: true
# @version SketchUp 2014
class LanguageHandler
  extend T::Sig

  # Instance Methods

  # Looks up and returns the localized version of a given string, based on the
  # language SketchUp is currently running in, and the available translations
  # in the Resources folder.
  #
  # @example
  #   swiveldriver_lang_handler = LanguageHandler.new('swiveldriver.strings')
  #   localized_string = swiveldriver_lang_handler['String 1']
  #
  # @param key [String]
  #   The key for the string to be retrieved.
  #
  # @return [String] the localized string.
  #
  # @version SketchUp 2014
  def [](key)
  end

  # The new method is used to create a new LanguageHandler object.
  #
  # @example
  #   swiveldriver_lang_handler = LanguageHandler.new('swiveldriver.strings')
  #
  # @param filename [String]
  #   The name of the file that contains the localized strings
  #   with their keys in UTF-8 encoding.
  #
  # @return [LanguageHandler] the new LanguageHandler object
  #
  # @version SketchUp 2014
  def initialize(filename)
  end

  # Returns a string containing the path to the given filename if it can be found
  # in the Resources folder.
  #
  # @example
  #   swiveldriver_lang_handler = LanguageHandler.new('swiveldriver.strings')
  #   image = swiveldriver_lang_handler.resource_path('fancy_image.png')
  #
  # @return [String] the location of the file in the Resources folder.
  #
  # @version SketchUp 2014
  def resource_path
  end

  # Returns a Hash object containing the localization dictionary.
  #
  # @example
  #   swiveldriver_lang_handler = LanguageHandler.new('swiveldriver.strings')
  #   hash = swiveldriver_lang_handler.strings
  #
  # @return [Hash] the localization dictionary.
  #
  # @version SketchUp 2014
  def strings
  end
end
