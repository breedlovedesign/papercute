module BreedloveDesign
  module Papercute
    PATH = File.dirname(__FILE__) unless defined?(self::PATH)

    require(File.join(PATH, "ruby", "logger.rb"))
    require(File.join(PATH, "ruby", "bridge.rb"))
    require(File.join(PATH, "ruby", "main_dialog.rb"))

    unless file_loaded?(__FILE__)
      UI.menu("extensions").add_item("Papercute") do
        begin
          MainDialog.new
        rescue => error
          $stderr << error
        end
      end
      toolbar = UI::Toolbar.new "Papercute"
      cmd =
        UI::Command.new("Papercute") do
          MainDialog.new
        end
      cmd.small_icon = File.join(PATH, "ruby", "ui_assets", "papercute_16.png")
      cmd.large_icon = File.join(PATH, "ruby", "ui_assets", "papercute_32.png")
      cmd.tooltip = "Render to 2D with PaperJS"
      cmd.status_bar_text = "Papercute"
      cmd.menu_text = "Papercute"
      toolbar = toolbar.add_item cmd
      if Sketchup.read_default(
           "com.sketchup.SketchUp.2022",
           "com.BreedloveDesign.Papercute.show_tb"
         )
        toolbar.show
      end
      file_loaded(__FILE__)
    end
  end # module Papercute
end # module BreedloveDesign
