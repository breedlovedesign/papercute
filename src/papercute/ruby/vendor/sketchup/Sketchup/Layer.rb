# typed: true
# @version SketchUp 6.0
class Sketchup::Layer < Sketchup::Entity
  extend T::Sig

  # Includes

  include Comparable

  # Instance Methods

  # The <=> method is used to compare two layers based on their names. You could
  # use this for sorting if you're building a list of layer names.
  #
  # @example
  #   model = Sketchup.active_model
  #   layers = model.layers
  #   new_layer = layers.add "test layer"
  #   layer1 = layers[0]
  #   layer2 = layers[1]
  #   status = layer1 <=> layer2
  #
  # @param layer2
  #   A Layer object.
  #
  # @return status - -1 if layer1 is less than layer2. 1 if layer2
  #   is less than layer1. 0 if layer1 and layer2 are
  #   equal.
  #
  # @version SketchUp 6.0
  def <=>(layer2)
  end

  # The == method is used to determine if two layers are the same.
  #
  # @example
  #   model = Sketchup.active_model
  #   layers = model.layers
  #   layer1 = layers.add "test layer 1"
  #   layer2 = layers.add "test layer 2"
  #   status = layer1 == layer2
  #
  # @param layer2
  #   A Layer object.
  #
  # @return status - true if layer1 and layer2 are equal. false if
  #   layer1 and layer2 are not equal.
  #
  # @version SketchUp 6.0
  def ==(layer2)
  end

  # The color method is used to retrieve the color of the layer.
  #
  # @example
  #   model = Sketchup.active_model
  #   layers = model.layers
  #   new_layer = layers.add('Test layer')
  #   color = new_layer.color
  #
  # @return color - the color of the Layer object
  #
  # @version SketchUp 2014
  def color
  end

  # The color= method is used to set the name of a layer.
  #
  # @example
  #   model = Sketchup.active_model
  #   layers = model.layers
  #   new_layer = layers.add('Test layer')
  #   new_layer.color = Sketchup::Color.new(192, 0, 0)
  #
  # @param color
  #   The new color for the Layer object.
  #
  # @return color
  #
  # @version SketchUp 2014
  def color=(color)
  end

  # The name method is used to retrieve the name of the layer.
  #
  # @example
  #   model = Sketchup.active_model
  #   layers = model.layers
  #   new_layer = layers.add "test layer"
  #   name = new_layer.name
  #
  # @return name - the name of the Layer object
  #
  # @version SketchUp 6.0
  def name
  end

  # The name= method is used to set the name of a layer.
  #
  # @example
  #   model = Sketchup.active_model
  #   layers = model.layers
  #   new_layer = layers.add "test layer"
  #   name = new_layer.name = "new test layer"
  #
  # @param name
  #   The new name for the Layer object.
  #
  # @return name - the newly set name
  #
  # @version SketchUp 6.0
  def name=(name)
  end

  # The page_behavior method is used to retrieve the visibility behavior of the
  # layer for new pages and existing pages. For example, you may want your layer
  # to be visible or hidden by default in any new pages (aka Scenes) created by
  # the user.
  #
  # A page keeps a list of layers that do not have their default behavior.
  # If a layer is not in that list, then it is set to its default visibility
  # determined by one of these values:
  #
  # The behaviour is composed of a combination of these flags:
  #   - LAYER_VISIBLE_BY_DEFAULT: 0x0000
  #   - LAYER_HIDDEN_BY_DEFAULT: 0x0001
  #   - LAYER_USES_DEFAULT_VISIBILITY_ON_NEW_PAGES: 0x0000
  #   - LAYER_IS_VISIBLE_ON_NEW_PAGES: 0x0010
  #   - LAYER_IS_HIDDEN_ON_NEW_PAGES: 0x0020
  #
  # The default visibility for a layer is set by either
  # <code>LAYER_VISIBLE_BY_DEFAULT</code> or
  # <code>LAYER_HIDDEN_BY_DEFAULT</code>. This is what will be used when a page
  # does not contain the visibility state of a layer.
  #
  # The remaining flags control the visibility of the layer for new pages.
  #
  # @example
  #   model = Sketchup.active_model
  #   layers = model.layers
  #   layer = layers.add('Test Layer')
  #   hidden_by_default = (layer.page_behavior & LAYER_HIDDEN_BY_DEFAULT) ==
  #                       LAYER_HIDDEN_BY_DEFAULT
  #
  # @return pagebehavior - an integer representing the current
  #   behavior of the layer.
  #
  # @version SketchUp 6.0
  def page_behavior
  end

  # The page_behavior= method is used to control the layer's visibility behavior
  # on existing and new pages.
  #
  # The behavior is composed of a combination of these flags:
  #   - LAYER_VISIBLE_BY_DEFAULT: 0x0000
  #   - LAYER_HIDDEN_BY_DEFAULT: 0x0001
  #   - LAYER_USES_DEFAULT_VISIBILITY_ON_NEW_PAGES: 0x0000
  #   - LAYER_IS_VISIBLE_ON_NEW_PAGES: 0x0010
  #   - LAYER_IS_HIDDEN_ON_NEW_PAGES: 0x0020
  #
  # When you Update a page (as opposed to creating a new page) the current
  # visibility of the layer is used.
  #
  # NOTE: Prior to SketchUp 2014 the <code>LAYER_HIDDEN_BY_DEFAULT</code> flag
  # would trigger the validation check in SketchUp that would reset the
  # <code>page_behavior</code> of the layer.
  #
  # @example
  #   layers = Sketchup.active_model.layers
  #   layer = layers.add('Test Layer')
  #   behavior = LAYER_HIDDEN_BY_DEFAULT | LAYER_IS_HIDDEN_ON_NEW_PAGES
  #   layer.page_behavior = behavior
  #
  # @param pagebehavior
  #   Pagebehavior value.
  #
  # @return pagebehavior - an integer representing the default
  #   visibility of the layer.
  #
  # @version SketchUp 6.0
  def page_behavior=(pagebehavior)
  end

  # The visible= method is used to set if the layer is visible.
  #
  # @example
  #   model = Sketchup.active_model
  #   layers = model.layers
  #   new_layer = layers.add "test layer"
  #
  #   # Hide the layer.
  #   new_layer.visible = false
  #
  # @param is_visible
  #   The new visibility setting.
  #
  # @version SketchUp 6.0
  def visible=(is_visible)
  end

  # The visible? method is used to determine if the layer is visible.
  #
  # @example
  #   model = Sketchup.active_model
  #   layers = model.layers
  #   new_layer = layers.add "test layer"
  #   UI.messagebox(new_layer.visible?)
  #
  # @return true if the layer is visible
  #
  # @return [Boolean]
  #
  # @version SketchUp 6.0
  def visible?
  end
end
