# typed: true
#   @id = Sketchup::Pages.add_frame_change_observer(MyFrameChangeObserver.new)
class Sketchup::FrameChangeObserver
  extend T::Sig

  # Instance Methods

  # This callback method is called during a slide show or creation of an
  # animation after the camera has been set up, but before the frame is
  # displayed. It gives you a chance to perform your own actions during
  # the animation. The arguments for +frameChange+ method are the scene
  # page that you transition from (+from_scene+), the scene page that you
  # transition to (+to_scene+), and a +percent_done+ between +0.0+ and +1.0+
  # that tell you the percentage of the transition between the two scene
  # pages.
  #
  # By watching for +percent_done >= 1.0+, you can activate Ruby code that
  # executes as soon as the user's camera has finished animating.
  #
  # @example
  #   class MyFrameChangeObserver
  #     def frameChange(from_scene, to_scene, percent_done)
  #       if percent_done == 0.0
  #         puts "Animating to scene '#{to_scene.name}':"
  #       else
  #         puts format("% 7.2f %",percent_done*100)
  #       end
  #     end
  #   end
  #   @id = Sketchup::Pages.add_frame_change_observer(MyFrameChangeObserver.new)
  #
  # @note The +from_scene+ argument into this callback does not appear to
  #   be populated on the PC. You can store a variable that keeps track of
  #   the +to_scene+ and then use that on a subsequent Scene selection to
  #   determine the last Page that the user was on.
  #
  # @param [Sketchup::Page] to_scene
  #   The selected scene page the view is transitioning towards.
  #
  # @param [Sketchup::Page, nil] from_scene
  #   The previous scene page the view is transitioning from.
  #
  # @param [Float] percent_done
  #   The percentage of transition between the two scene pages.
  #
  # @return [void] Value can be anything, but is ignored by SketchUp.
  #
  # @version SketchUp 6.0
  def frameChange(from_scene, to_scene, percent_done)
  end
end
