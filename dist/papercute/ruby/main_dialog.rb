module BreedloveDesign
  module Papercute
    class MainDialog
    include Logger
      def initialize
        dia = UI::HtmlDialog.new(options)
        dia.set_url( html_url )
        dia.show
      end

      private
      def options
        {style: UI::HtmlDialog::STYLE_WINDOW}
      end

      def html_url
        # here relative means the html file's location
        # relative to the dir this very ruby file is in
        relative_path = File.join(
          "..",
          "main_dialog",
          "index.html"
          )
        this_ruby_file_dir = File.dirname(__FILE__)
        html_path = File.join(this_ruby_file_dir, relative_path)
        absolute_html_path = File.absolute_path(html_path)
        html_url = "file://#{absolute_html_path}"
        log({html_path: html_path, absolute_html_path: absolute_html_path, html_url: html_url}, true)
        return html_url
      end
    end

  end # module Papercute
end # module BreedloveDesign
