# typed: true
class Object < BasicObject
  extend T::Sig

  # Note: the argument :menu_name must be a string that matches
  # the name of one of the SkechUp menus
  sig { params(menu_name: String).returns(NilClass) }
  def add_separator_to_menu(menu_name)
  end

  # Note: maybe don't use this because you are just adding to
  # an array of paths of loaded files without actually loading a file
  # see #file_loaded?
  sig { params(filename: String).returns(Array) }
  def file_loaded(filename)
    ["", ""]
  end

  # Check to see if a file has been loaded by passing a string
  # represention of the file's path.
  sig { params(filename: String).returns(T::Boolean) }
  def file_loaded?(filename)
    true
  end

  # Brings up a modal dialog box to get text from the user
  #
  # Takes an array of Strings OR items that can be converted to strings
  #
  # These strings are used as prompts for the dialog
  #
  # returns an array of strings based on the user's input (empty
  # strings for blank fields)
  #
  # OR
  #
  # false if the user cancels the dialog
  sig { params(args: T::Array[(T.untyped)]).returns(T::Array[String]) }
  def inputbox(*args)
    args.to_a.map do |arg|
      # Prompts
      arg.to_s
      # answers from user can be whatever, as long as to_s works
      "answer for this prompt".to_s
    end
  end
  # Depreciated, so don't give 'em sigs
  #
  # def require_all(dirname); end <- messes with $LOAD_PATH,
  #                                  which can cause trouble
  #                                  for other extensions
  #
  # def show_ruby_panel; end <- use SKETCHUP_CONSOLE.show instead
end
