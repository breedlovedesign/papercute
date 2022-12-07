# typed: true
# @version SketchUp 6.0
module BreedloveDesign
  module Papercute
    class Sketchup::AttributeDictionaries < Sketchup::Entity
      extend T::Sig

      # Includes

      include Enumerable

      # Instance Methods

      # Get an AttributeDictionary by name. Returns nil if there is none with the
      # given name.
      #
      # @example
      #   model = Sketchup.active_model
      #   attrdicts = model.attribute_dictionaries
      #   # Iterates through all dictionaries and prints to screen.
      #   dict = attrdicts['my_dictionary']
      #   if dict
      #     UI.messagebox("Found: " + dict.to_s)
      #   else
      #     UI.messagebox("No dictionary found.")
      #   end
      #
      # @param key [String]
      #   The name of the attribute dictionary.
      #
      # @return [Sketchup::AttributeDictionary] the dictionary
      #
      # @version SketchUp 6.0
      def [](key)
      end

      # The count method is inherited from the Enumerable mix-in module.
      #
      # @example
      #   model = Sketchup.active_model
      #   model.set_attribute('Example', 'Hello', 'World')
      #   dictionaries = model.attribute_dictionaries
      #   number = dictionaries.count
      #
      # @return [Integer]
      #
      # @see #length
      #
      # @version SketchUp 2014
      def count
      end

      # The delete method destroys a given AttributeDictionary. This
      # AttributeDictionary can be passed directly or identified by its
      # string name.
      #
      # @example
      #   model = Sketchup.active_model
      #   attrdicts = model.attribute_dictionaries
      #   # Deletes a dictionary called 'my_dictionary'
      #   attrdicts.delete 'my_dictionary'
      #
      # @param key_or_dict [String, Sketchup::AttributeDictionary]
      #   The name of the attribute dictionary to delete, or
      #   the dictionary object itself.
      #
      # @return [Sketchup::AttributeDictionaries] the modified AttributeDictionaries object
      #
      # @version SketchUp 6.0
      def delete(key_or_dict)
      end

      # The each method is used to iterate through all of the attributes
      # dictionaries.
      #
      # Throws an exception if there are no keys.
      #
      # @example
      #   model = Sketchup.active_model
      #   attrdicts = model.attribute_dictionaries
      #   # Iterates through all dictionaries and prints to screen.
      #   attrdicts.each { | dict | UI.messagebox dict }
      #
      # @return nil
      #
      # @version SketchUp 6.0
      #
      # @yield [dict] Each AttributeDictionary as it is found.
      def each(&block)
      end

      # The {#length} method returns the number of attribute dictionary objects in
      # the collection.
      #
      # @example
      #   model = Sketchup.active_model
      #   model.set_attribute('Example', 'Hello', 'World')
      #   dictionaries = model.attribute_dictionaries
      #   number = dictionaries.length
      #
      # @return [Integer] the number of attribute dictionary objects in the
      #   collection.
      #
      # @see #size
      #
      # @version SketchUp 2014
      def length
      end

      # The {#size} method is an alias of {#length}.
      #
      # @example
      #   model = Sketchup.active_model
      #   model.set_attribute('Example', 'Hello', 'World')
      #   dictionaries = model.attribute_dictionaries
      #   number = dictionaries.size
      #
      # @return [Integer]
      #
      # @see #length
      #
      # @version SketchUp 2014
      def size
      end
    end
  end # module Papercute
end # module BreedloveDesign
