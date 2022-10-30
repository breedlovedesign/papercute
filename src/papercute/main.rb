module BreedloveDesign
  module Papercute
    PATH = File.dirname(__FILE__) unless defined?(self::PATH)

    require(File.join(PATH, "ruby", "main_dialog.rb"))

    unless file_loaded?(__FILE__)
      UI.menu("extensions").add_item("Papercute") do
        begin
          MainDialog.new
        rescue => error
          $stderr << error
        end
      end
    end
  end # module Papercute
end # module BreedloveDesign
