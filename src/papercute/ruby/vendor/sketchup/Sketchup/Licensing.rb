# typed: true
# @version SketchUp 2015
module Sketchup::Licensing
  extend T::Sig

  # Constants
  EXPIRED = 1 # Integer
  LICENSED = 0 # Integer
  NOT_LICENSED = 4 # Integer
  TRIAL = 2 # Integer
  TRIAL_EXPIRED = 3 # Integer

  # Class Methods

  # Acquires a license for a given extension.
  #
  # @example
  #   ext_id = "4e215280-dd23-40c4-babb-b8a8dd29d5ee"
  #   ext_lic = Sketchup::Licensing.get_extension_license(ext_id)
  #   if ext_lic.licensed?
  #      puts "Extension is licensed."
  #   end
  #
  # @param [String] extension_id
  #   The Extension Warehouse UUID for the desired extension.
  #
  # @return [ExtensionLicense] An object representing
  #   licensing state for the extension. Do not store this object, retrieve
  #   it again when needed since licensing state may have changed.
  #
  # @version SketchUp 2015
  sig { params(extension_id: String).returns(ExtensionLicense) }
  def self.get_extension_license(extension_id)
    ExtensionLicense.new
  end
end
