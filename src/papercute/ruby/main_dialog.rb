# typed: true
module BreedloveDesign
  module Papercute
    class MainDialog
      extend T::Sig
      include Logger

      def initialize
        @settings = {
          backgroundColor: background_color,
          width: vpw,
          height: vph,
        }
        html_dia = UI::HtmlDialog.new(options)
        html_dia.set_url(html_url)
        # 30 and 26 pixels I arrived at by trial and error
        html_dia.set_size(vpw, vph + 30 + 26)
        setup_bridge(html_dia)
        register_callbacks
        @dia.show
        @dia.set_on_closed do
          log "on close write toolbar visibility: #{UI::Toolbar.new("Papercute").visible?}",
              false
          Sketchup.write_default(
            "com.sketchup.SketchUp.2022",
            "com.BreedloveDesign.Papercute.show_tb",
            UI::Toolbar.new("Papercute").visible?
          )
        end
      end

      attr_reader :dia, :settings

      def rush_doll
      end

      # private

      def setup_bridge(html_dia)
        @dia = Bridge.decorate(html_dia)
      end

      def register_callbacks
        @dia.on("getBackgroundColor") { |deferred|
          deferred.resolve(background_color)
        }
        @dia.on("settings") { |deferred|
          deferred.resolve(@settings)
        }
      end

      def su_opts
        Sketchup.active_model.rendering_options
      end

      def background_color
        ColorUtils.su_color_to_hex_str(color_obj: su_opts["BackgroundColor"])
      end

      def vpw
        Sketchup.active_model.active_view.vpwidth
      end

      def vph
        Sketchup.active_model.active_view.vpheight
      end

      def options
        { style: UI::HtmlDialog::STYLE_WINDOW, width: vpw, height: vph }
      end

      def html_url
        # here relative means the html file's location
        # relative to the dir this very ruby file is in
        relative_path = File.join("..", "main_dialog", "index.html")
        this_ruby_file_dir = File.dirname(__FILE__)
        html_path = File.join(this_ruby_file_dir, relative_path)
        absolute_html_path = File.absolute_path(html_path)
        html_url = "file://#{absolute_html_path}"
        log(
          {
            html_path: html_path,
            absolute_html_path: absolute_html_path,
            html_url: html_url,
          },
          false
        )
        return html_url
      end
    end # class MainDialog
  end # module Papercute
end # module BreedloveDesign
