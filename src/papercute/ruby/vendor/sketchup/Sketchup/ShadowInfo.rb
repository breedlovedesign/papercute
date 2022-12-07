# typed: true
# @version SketchUp 6.0
module BreedloveDesign
  module Papercute
    class Sketchup::ShadowInfo < Sketchup::Entity
      extend T::Sig
      # Includes

      include Enumerable

      # Class Methods

      # The each_key method iterates through all of the shadow information keys.
      #
      # @example
      #   shadowinfo.each_key { |key| UI.messagebox(key) }
      #
      # @return [nil]
      #
      # @version SketchUp 6.0
      #
      # @yield [key] Variable to hold each key as they are found.
      def self.each_key
      end

      # The keys method is a class method that returns an array with all of the
      # attribute keys
      #
      # @example
      #   keys = Sketchup::ShadowInfo.keys
      #
      # @return [Array<String>] an array of keys
      #
      # @version SketchUp 6.0
      def self.keys
      end

      # Instance Methods

      # The [] method retrieves a value from the array of keys
      #
      # @example
      #   value = shadowinfo["key"]
      #
      # @param key [String]
      #   The key of the shadowinfo value to retrieve.
      #
      # @return [Object, nil] the value that is retrieved.
      #
      # @version SketchUp 6.0
      def [](key)
      end

      # The set value []= method is used to set the value in the array of shadow
      # info options.
      #
      # @example
      #   model = Sketchup.active_model
      #   shadowinfo = model.shadow_info
      #   value = shadowinfo["City"]
      #   UI.messagebox value
      #   value = shadowinfo["City"]="Denver, CO"
      #   UI.messagebox value
      #
      # @param key [String]
      #   The key of the shadowinfo value to set.
      #
      # @param value [Object]
      #   The value to be set.
      #
      # @return [Object] the value that was set if successful, or false
      #   if unsuccessful.
      #
      # @version SketchUp 6.0
      def []=(key, value)
      end

      # The add_observer method is used to add an observer to the current object.
      #
      # @example
      #   status = object.add_observer observer
      #
      # @param observer [Object]
      #   An observer.
      #
      # @return [Boolean] true if successful, false if unsuccessful.
      #
      # @version SketchUp 6.0
      def add_observer(observer)
      end

      # The count method is inherited from the Enumerable mix-in module.
      #
      # @example
      #   shadow_info = Sketchup.active_model.shadow_info
      #   number = shadow_info.count
      #
      # @return [Integer]
      #
      # @version SketchUp 2014
      def count
      end

      # The {#each} method iterates through all of the shadow information key/value
      # pairs.
      #
      # @example
      #   model = Sketchup.active_model
      #   shadow_info = model.shadow_info
      #   shadow_info.each { |key, value|
      #     puts "#{key} : #{value}"
      #   }
      #
      # @return [nil]
      #
      # @see #each_pair
      #
      # @version SketchUp 6.0
      #
      # @yield [key, value]
      #
      # @yieldparam [Object] value
      #
      # @yieldparam [String] key
      def each(&block)
      end

      # The each_key method iterates through all of the shadow information keys.
      #
      # @example
      #   shadowinfo.each_key { |key| UI.messagebox(key) }
      #
      # @return [nil]
      #
      # @version SketchUp 6.0
      #
      # @yield [key] Variable to hold each key as they are found.
      def each_key
      end

      # The #{each_pair} method is an alias for {#each}.
      #
      # @example
      #   model = Sketchup.active_model
      #   shadow_info = model.shadow_info
      #   shadow_info.each_pair { |key, value|
      #     puts "#{key} : #{value}"
      #   }
      #
      # @return [nil]
      #
      # @see #each
      #
      # @version SketchUp 6.0
      #
      # @yield [key, value]
      #
      # @yieldparam [String] key
      #
      # @yieldparam [Object] value
      def each_pair
      end

      # The keys method is a class method that returns an array with all of the
      # attribute keys
      #
      # @example
      #   keys = Sketchup::ShadowInfo.keys
      #
      # @return [Array<String>] an array of keys
      #
      # @version SketchUp 6.0
      def keys
      end

      # The {#length} method returns the number of options in the shadow options
      # collection
      #
      # @example
      #   shadow_info = Sketchup.active_model.shadow_info
      #   number = shadow_info.length
      #
      # @return [Integer]
      #
      # @see #size
      #
      # @version SketchUp 2014
      def length
      end

      # The remove_observer method is used to remove an observer from the current
      # object.
      #
      # @example
      #   status = object.remove_observer observer
      #
      # @param observer [Object]
      #   An observer.
      #
      # @return [Boolean] true if successful, false if unsuccessful.
      #
      # @version SketchUp 6.0
      def remove_observer(observer)
      end

      # The {#size} method is an alias for {#length}.
      #
      # @example
      #   shadow_info = Sketchup.active_model.shadow_info
      #   number = shadow_info.size
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
