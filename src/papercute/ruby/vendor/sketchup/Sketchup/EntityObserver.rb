# typed: true
# @version SketchUp 6.0
class Sketchup::EntityObserver
  extend T::Sig

  # Instance Methods

  # The {#onChangeEntity} method is invoked when your entity is modified.
  #
  # @example
  #   def onChangeEntity(entity)
  #     puts "onChangeEntity: #{entity}"
  #   end
  #
  # @param [Sketchup::Entity] entity
  #
  # @return [nil]
  #
  # @version SketchUp 6.0
  def onChangeEntity(entity)
  end

  # The {#onEraseEntity} method is invoked when your entity is erased.
  #
  # @example
  #   def onEraseEntity(entity)
  #     puts "onEraseEntity: #{entity}"
  #   end
  #
  # @param [Sketchup::Entity] entity
  #
  # @return [nil]
  #
  # @version SketchUp 6.0
  def onEraseEntity(entity)
  end
end
