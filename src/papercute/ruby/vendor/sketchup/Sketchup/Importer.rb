# typed: true
# @version SketchUp 6.0
class Sketchup::Importer
  extend T::Sig

  # Constants

  ImportCanceled = nil # Stub value.
  ImportFail = nil # Stub value.
  ImportFileNotFound = nil # Stub value.
  ImportSuccess = nil # Stub value.
  ImporterNotFound = nil # Stub value.

  # Instance Methods

  # This method is called by SketchUp to determine the description that appears
  # in the File > Import dialog's pulldown list of valid importers.
  #
  # Though it is common for the description to include the file extension
  # supported by the importer (such as "Text Importer (.txt)"), the actual
  # extension is defined in the file_extension method.
  #
  # @example
  #   def description
  #     return "Custom Text Importer (*.txt)"
  #   end
  #
  # @return description - a brief string description
  #
  # @version SketchUp 6.0
  def description
  end

  # This method is called by SketchUp when the user clicks on the "Options"
  # button inside the File > Import dialog. You can use it to gather and store
  # settings for your importer.
  #
  # Only applicable if the importer supports options, meaning its
  # supports_options method returns true.
  #
  # @example
  #   def id
  #     return "com.sketchup.importers.custom_txt"
  #   end
  #
  # @return id - an id string
  #
  # @version SketchUp 6.0
  def do_options
  end

  # This method is called by SketchUp to determine a single file extension is
  # associated with your importer. Only files that match this extension will be
  # shown to the user as they browse their harddrive for things to import.
  #
  # Ruby importers are only allowed to support a single extension.
  #
  # @example
  #   def file_extension
  #     return "txt"
  #   end
  #
  # @return extension - typically a 3-letter string
  #
  # @version SketchUp 6.0
  def file_extension
  end

  # This method is called by SketchUp to determine a unique identifier for
  # your importer, typically something like "com.sketchup.importers.dxf".
  #
  # @example
  #   def id
  #     return "com.sketchup.importers.custom_txt"
  #   end
  #
  # @return id - an id string
  #
  # @version SketchUp 6.0
  def id
  end

  # This method is called by SketchUp after the user has selected a file to
  # import. This is where you do the real work by opening the file via Ruby's
  # File object and processing it in whatever way you need.
  #
  # You must return an integer success code to SketchUp when you are done.
  # These are the codes that SketchUp understands and what will happen when
  # SketchUp receives each key.
  #
  #   - 0 = Import Success (no additional dialog shown)
  #   - 1 = Import Failed (no additional dialog shown)
  #   - 2 = Import Cancelled by User (SketchUp will show a "cancelled" dialog)
  #   - 4 = Import File not Found (SketchUp will show a "not found" dialog)
  #   - 5 = SketchUp version not supported (no additional dialog shown)
  #
  # @example
  #   def load_file(file_path, status)
  #     # Here is where you would open the file and process it.
  #     UI.messagebox(file_path)
  #     return 0   # Success
  #   end
  #
  # @param file_path
  #   Absolute path to the file the user selected
  #
  # @param status
  #   The status of the import so far. Contains true.
  #
  # @return success - an integer status code. See above.
  #
  # @version SketchUp 6.0
  def load_file(file_path, status)
  end

  # This method is called by SketchUp to determine if the "Options"
  # button inside the File > Import dialog should be enabled while your
  # importer is selected.
  #
  # @example
  #   def supports_options?
  #     return true
  #   end
  #
  # @return supports_options - a boolean
  #
  # @return [Boolean]
  #
  # @version SketchUp 6.0
  def supports_options?
  end
end
