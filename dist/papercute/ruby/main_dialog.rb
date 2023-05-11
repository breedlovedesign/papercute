# frozen_string_literal: true
module BreedloveDesign
  module Papercute
    class MainDialog
      
      include Logger

      def initialize
        @settings = {
          backgroundColor: provide_background_color,
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
        #
        # <callbackRegistration>
        # @dia.on("<jsSide>") { |deferred|
        #   deferred.resolve(<ruby_side>)
        # }
        # </callbackRegistration>
        #
        # 1. write the <callbackRegistration> here within #register_callbacks
        # 2. write the ruby side 'here' entirely within a single method
        #    denoted as <ruby_side> in the example above.
        #    'here' refers to within MainDialog class AND main_dialog.rb file
        #    Refactor the code out of this file and possibly out of this class
        #    later?
        # 3. write the javascript side in main_dialog/js/main_dialog.js,
        #    denoted as <jsSide> in the example above. The method parameter
        #    provided to #on MUST match the name of the corrosponding js
        #    function, and OUGHT to follow js camelcase convention
        #
        #    Choosing good names: If ruby is acting as the server and
        #    js is acting as the client as in the case of the background color,
        #    follow the convention of choosing the name for the javascript side
        #    to start with 'get' and the ruby side to start with 'provide'
        #    Don't follow this convention blindly, think about which way the
        #    user interaction and data flow are going
        @dia.on("getBackgroundColor") { |deferred|
          deferred.resolve(provide_background_color)
        }
        @dia.on("settings") { |deferred|
          deferred.resolve(@settings)
        }
        @dia.on("getRenderData") { |deferred|
          deferred.resolve(provide_render_data)
        }
      end



      def provide_render_data
        model_node = Node.new(Sketchup.active_model, nil)
        model_node.clumps.collect do |clump|
          clump.faces2d
        end
      end

      def su_opts
        Sketchup.active_model.rendering_options
      end

      def provide_background_color
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
