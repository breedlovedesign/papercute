# typed: true
# @version SketchUp 6.0
module BreedloveDesign
  module Papercute
    class Sketchup::ComponentDefinition < Sketchup::Drawingelement
      extend T::Sig

      # Includes

      include Comparable

      # Instance Methods

      # The <=> method is used to compare two ComponentDefinition objects for
      # sorting. The comparison is done based on the component name.
      #
      # @example
      #   c1=Sketchup.find_support_file "Bed.skp",
      #     "Components/Components Sampler/"
      #   c2=Sketchup.find_support_file "Fence.skp",
      #     "Components/Components Sampler/"
      #   if c1 <=> c2
      #     UI.messagebox("c1 sorts before c2")
      #   end
      #
      # @param compdef2 [Sketchup::ComponentDefinition]
      #   The second component definition in the comparison.
      #
      # @return [Integer] a -1 if component1 is less then component2. A 1
      #   if component1 greater than component2
      #
      # @version SketchUp 6.0
      def <=>(compdef2)
      end

      # The == method is used to test if two ComponentDefinition objects are the
      # same (based on their address in memory).
      #
      # @example
      #   c1=Sketchup.find_support_file "Bed.skp",
      #     "Components/Components Sampler/"
      #   c2=Sketchup.find_support_file "Fence.skp",
      #     "Components/Components Sampler/"
      #   if c1 == c2
      #     UI.messagebox("These definitions are the same.")
      #   end
      #
      # @param compdef2 [Sketchup::ComponentDefinition]
      #   The second component definition in the comparison.
      #
      # @return [Boolean] true if the ComponentDefinition objects are
      #   the same object. False if the objects are not the same.
      #
      # @version SketchUp 6.0
      def ==(compdef2)
      end

      # The add_classification method is used to add a given classification to
      # the component.
      #
      # Note that you cannot classify image definitions.
      #
      # @example
      #   definition = Sketchup.active_model.definitions.first
      #   success = definition.add_classification("IFC 2x3", "IfcDoor")
      #
      # @param schema_name [String]
      #   a String - Schema name to add
      #
      # @param schema_type [String]
      #   a String - Schema type to add
      #
      # @return [Boolean] true if the classification succeeds. Otherwise false.
      #
      # @version SketchUp 2015
      def add_classification(schema_name, schema_type)
      end

      # The add_observer method is used to add an observer to the current object.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   status = componentdefinition.add_observer observer
      #
      # @param observer [Object]
      #   An observer.
      #
      # @return [Boolean] true if successful, false if unsuccessful.
      #
      # @version SketchUp 6.0
      def add_observer(observer)
      end

      # The behavior method is used to retrieve the Behavior object associated with
      # a component definition.
      #
      # @example
      #   path = Sketchup.find_support_file "Bed.skp",
      #     "Components/Components Sampler/"
      #   model = Sketchup.active_model
      #   definitions = model.definitions
      #   componentdefinition = definitions.load path
      #   behavior = componentdefinition.behavior
      #
      # @return [Sketchup::Behavior] a Behavior object if successful
      #
      # @version SketchUp 6.0
      def behavior
      end

      # The count_instances method is used to count the number of unique component
      # instances in a model using this component definition. This does not represent
      # the total number of instances placed in the model as it doesn't take into
      # account instances inside unused definitions.
      #
      # @example
      #   path = Sketchup.find_support_file('Bed.skp',
      #     'Components/Components Sampler/')
      #   definitions = Sketchup.active_model.definitions
      #   definition = definitions.load(path)
      #   number = definition.count_instances
      #
      # @return [Integer] the number of component instances of this
      #   component definition (if successful)
      #
      # @version SketchUp 6.0
      def count_instances
      end

      # The count_used_instances method is used to count the total number of
      # component instances in a model using this component definition. This method
      # takes into account the full hierarchy of the model.
      #
      # @example
      #   path = Sketchup.find_support_file('Bed.skp',
      #     'Components/Components Sampler/')
      #   definitions = Sketchup.active_model.definitions
      #   definition = definitions.load(path)
      #   number = definition.count_used_instances
      #
      # @return [Integer] the number of component instances of this
      #   component definition (if successful)
      #
      # @version SketchUp 2016
      def count_used_instances
      end

      # The description method is used to retrieve the description of the component
      # definition.
      #
      # Component definitions do not have a description, by default.
      #
      # @example
      #   # Get the description
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   description = componentdefinition.description
      #
      # @return [String] the description of the component definition if successful
      #
      # @version SketchUp 6.0
      def description
      end

      # The description= method is used to set the description for the component
      # definition.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   componentdefinition.description = "This is a traditional bed"
      #   description = componentdefinition.description
      #
      # @param [String] description
      #
      # @return [String] the description if successful, false if
      #   unsuccessful
      #
      # @version SketchUp 6.0
      def description=(description)
      end

      # The entities method retrieves a collection of all the entities in the
      # component definition
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   entities = componentdefinition.entities
      #
      # @return [Sketchup::Entities] an Entities object if successful
      #
      # @version SketchUp 6.0
      def entities
      end

      # The get_classification_value method is used to retrieve the value from
      # a classification attribute given a key path.
      #
      # @example
      #   definition = Sketchup.active_model.definitions.first
      #   definition.add_classification("IFC 2x3", "IfcDoor")
      #
      #   path = ["IFC 2x3", "IfcDoor", "ObjectType", "IfcLabel"]
      #   value = definition.get_classification_value(path)
      #
      # @param path [Array<String>]
      #   An array composed of the key path to the value.
      #
      # @return [Object, nil] a Ruby object if successful, nil otherwise.
      #
      # @version SketchUp 2015
      def get_classification_value(path)
      end

      # The group? method is used to determine if this component definition is used
      # to hold the elements of a group.
      #
      # @example
      #   path = Sketchup.find_support_file "Bed.skp",
      #     "Components/Components Sampler/"
      #   model = Sketchup.active_model
      #   definitions = model.definitions
      #   componentdefinition = definitions.load path
      #   status = componentdefinition.group?
      #
      # @return [Boolean] true if the definition is used to hold a
      #   group, false if the definition does not hold a group.
      #
      # @version SketchUp 6.0
      def group?
      end

      # The guid method is used to retrieve the unique identifier of this component
      # definition. The guid changes after the component definition is modified and
      # the component edit is exited.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   guid = componentdefinition.guid
      #
      # @return [String] a string guid if successful
      #
      # @version SketchUp 6.0
      def guid
      end

      # The hidden method is used to determine if this component definition should
      # be hidden on the component browser.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   status = componentdefinition.hidden?
      #
      # @return [Boolean] true if the definition should be hidden, false
      #   if the definition should not be hidden
      #
      # @version SketchUp 6.0
      def hidden?
      end

      # The image? method is used to determine if this component definition is used
      # to define an image.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   status = componentdefinition.image?
      #   if (status)
      #     UI.messagebox "Component definition defines an image"
      #   else
      #     UI.messagebox status.to_s
      #     UI.messagebox "Component definition does not define an image"
      #   end
      #
      # @return [Boolean] true if the component definition defines an
      #   image, false if the component definition does not
      #   define an image.
      #
      # @version SketchUp 6.0
      def image?
      end

      # The insertion_point method is used to retrieve the Point3d object where the
      # component was inserted.
      #
      # @example
      #   point = Geom::Point3d.new 10,20,30
      #   transform = Geom::Transformation.new point
      #   model = Sketchup.active_model
      #   entities = model.active_entities
      #   path = Sketchup.find_support_file "Bed.skp",
      #     "Components/Components Sampler/"
      #   definitions = model.definitions
      #   componentdefinition = definitions.load path
      #   instance = entities.add_instance componentdefinition, transform
      #   point = componentdefinition.insertion_point
      #
      # @return [Geom::Point3d] the Point3d where the component was inserted if
      #   successful. False if unsuccessful.
      #
      # @version SketchUp 6.0
      def insertion_point
      end

      # Sets the insertion point of your definition.
      #
      # @example
      #   point = Geom::Point3d.new(10, 20, 0)
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   componentdefinition.insertion_point = point
      #
      # @param [Geom::Point3d] point
      #   The Point3d object to use as the
      #   insertion point.
      #
      # @return [Geom::Point3d] The Point3d object used as the insertion point.
      #
      # @version SketchUp 6.0
      def insertion_point=(point)
      end

      # The instances method is used to return any array of ComponentInstancesfor
      # this ComponentDefinition.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   instances = componentdefinition.instances
      #
      # @return [Array<Sketchup::ComponentInstance>] an array of ComponentInstances
      #   (if successful)
      #
      # @version SketchUp 6.0
      def instances
      end

      # The internal? method is used to determine if the component definition is
      # internal to the Component Browser
      #
      # @example
      #   point = Geom::Point3d.new 10,20,30
      #   transform = Geom::Transformation.new point
      #   model = Sketchup.active_model
      #   entities = model.active_entities
      #   path = Sketchup.find_support_file "Bed.skp",
      #     "Components/Components Sampler/"
      #   definitions = model.definitions
      #   componentdefinition = definitions.load path
      #   status = componentdefinition.internal?
      #
      # @return [Boolean] true if the component definition is internal
      #   to SketchUp's Component Browser.  False if the
      #   component definition is not internal to SketchUp.
      #
      # @version SketchUp 6.0
      def internal?
      end

      # Invalidates the bounding box of your definition. This command forces the
      # update of the bounding box of definition while inside an operation.
      # See Model.start_operation for how to start an operation.
      #
      # This method is useful if you make changes to your geometry using the Ruby
      # API and then need to know your bounding box size. This method forces
      # SketchUp to recalculate the definition's bounding box when you choose.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   componentdefinition.invalidate_bounds
      #
      # @return [Boolean] true if successful
      #
      # @version SketchUp 6.0
      def invalidate_bounds
      end

      # The name method retrieves the name of the component definition.
      #
      # @example
      #   path = Sketchup.find_support_file "Bed.skp",
      #     "Components/Components Sampler/"
      #   model = Sketchup.active_model
      #   definitions = model.definitions
      #   componentdefinition = definitions.load path
      #   name = componentdefinition.name
      #
      # @return [String] the component definition's name if successful
      #
      # @version SketchUp 6.0
      def name
      end

      # The name= method is used to set the name of the component definition.
      #
      # @example
      #   path = Sketchup.find_support_file "Bed.skp",
      #     "Components/Components Sampler/"
      #   model = Sketchup.active_model
      #   definitions = model.definitions
      #   componentdefinition = definitions.load path
      #   name = componentdefinition.name="Bed"
      #
      # @param [String] name
      #
      # @return [String] the name assigned to the component definition if
      #   successful
      #
      # @version SketchUp 6.0
      def name=(name)
      end

      # The path method is used to retrieve the path where the component was loaded.
      #
      # Returns nil if it is an internal component.
      #
      # @example
      #   path = Sketchup.find_support_file "Bed.skp",
      #     "Components/Components Sampler/"
      #   model = Sketchup.active_model
      #   definitions = model.definitions
      #   componentdefinition = definitions.load path
      #   path = componentdefinition.path
      #
      # @return [String, false] a valid path if successful, false if
      #   unsuccessful
      #
      # @version SketchUp 6.0
      def path
      end

      # The refresh_thumbnail method is used to force SketchUp to regenerate the
      # thumbnail image that appears in the component browser. This is useful if
      # you've used the API to change the geometry of your component and would
      # like the thumbnail to match.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   componentdefinition.refresh_thumbnail
      #
      # @return [nil]
      #
      # @version SketchUp 7.0
      def refresh_thumbnail
      end

      # The remove_classification method is used to remove a given classification
      # from the component.
      #
      # Note that you cannot classify image definitions.
      #
      # @example
      #   definition = Sketchup.active_model.definitions.first
      #   success = definition.remove_classification("IFC 2x3", "IfcDoor")
      #
      # @param schema_name [String]
      #   a String - Schema name to remove
      #
      # @param schema_type [String]
      #   a String - Schema type to remove. If not provided or an
      #   empty string, the currently applied schema type for the
      #   given schema name will be removed.
      #
      # @return [Boolean] true if the removal succeeds. Otherwise false.
      #
      # @version SketchUp 2015
      def remove_classification(schema_name, schema_type)
      end

      # The remove_observer method is used to remove an observer from the current
      # object.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   status = componentdefinition.remove_observer observer
      #
      # @param observer [Object]
      #   An observer.
      #
      # @return [Boolean] true if successful, false if unsuccessful.
      #
      # @version SketchUp 6.0
      def remove_observer(observer)
      end

      # The save_as method is used to save your definition as a SketchUp file at the
      # specified file destination.
      #
      # @example
      #   my_definition = Sketchup.active_model.definitions[0]
      #   success = my_definition.save_as "c:\\myComponent.skp"
      #
      # @param file_path [String]
      #   Local file path to save the .skp file to.
      #
      # @return [Boolean] true if successful
      #
      # @version SketchUp 7.0
      def save_as(file_path)
      end

      # Saves a component thumbnail image. The image format is specified by the
      # file extension of filePath. Supported image formats are bmp, jpg, png,
      # tif, pct, and gif.
      #
      # @example
      #   componentdefinition = Sketchup.active_model.definitions[0]
      #   componentdefinition.save_thumbnail "test_thumb.png"
      #
      # @param filename [String]
      #
      # @return [Boolean] true if successful, false otherwise.
      #
      # @version SketchUp 7.0
      def save_thumbnail(filename)
      end

      # The set_classification_value method is used to set the value of a
      # classification attribute given a key path.
      #
      # @example
      #   definition = Sketchup.active_model.definitions.first
      #   definition.add_classification("IFC 2x3", "IfcDoor")
      #
      #   path = ["IFC 2x3", "IfcDoor", "ObjectType", "IfcLabel"]
      #   success = definition.set_classification_value(path, "Room 101")
      #
      # @param value [Object]
      #   A value valid for that specific attribute.
      #
      # @param path [Array<String>]
      #   An array composed of the key path to the value.
      #
      # @raise [NotImplementedError] when trying to set the value of "choice"
      #   attributes.
      #
      # @raise [TypeError] when trying to set a value that is not valid for the
      #   attribute.
      #
      # @raise [RuntimeError] if the attributes being set are corrupt.
      #
      # @return [Boolean] true if the path was valid, false otherwise.
      #
      # @version SketchUp 2015
      def set_classification_value(path, value)
      end
    end
  end # module Papercute
end # module BreedloveDesign
