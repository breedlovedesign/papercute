# typed: true
# @version SketchUp 6.0
module BreedloveDesign
  module Papercute
    class Sketchup::View
      extend T::Sig

      sig { void }
      def initialize
      end
      # Instance Methods

      # The add_observer method is used to add an observer to the current object.
      #
      # @example
      #   view = Sketchup.active_model.active_view
      #   status = view.add_observer observer
      #
      # @param observer [Object]
      #   An observer.
      #
      # @return [Boolean] true if successful, false if unsuccessful.
      #
      # @version SketchUp 6.0
      def add_observer(observer)
      end

      # The animation= method is used to set an animation that is displayed for a
      # view. See Animation for details on how to create an animation object.
      #
      # @example
      #   animation = ViewSpinner.new
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   anim = view.animation=animation
      #   if (anim)
      #     UI.messagebox anim
      #   else
      #     UI.messagebox "Failure"
      #   end
      #
      # @param animation [#nextFrame]
      #   An Animation object.
      #
      # @return [#nextFrame] the newly set Animation object
      #
      # @version SketchUp 6.0
      def animation=(animation)
      end

      # The average_refresh_time is used to set the average time used to refresh the
      # current model in the view. This can be used to estimate the frame rate for
      # an animation.
      #
      # @example
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   time = view.average_refresh_time
      #
      # @return [Float] the time in seconds
      #
      # @version SketchUp 6.0
      def average_refresh_time
      end

      # The camera method is used to retrieve the camera for the view.
      #
      # @example
      #   camera = view.camera
      #
      # @return [Sketchup::Camera] a Camera object
      #
      # @version SketchUp 6.0
      sig { returns(Sketchup::Camera) }
      def camera
        Sketchup::Camera.new(
          Geom::Point3d.new,
          Geom::Point3d.new,
          Geom::Vector3d.new
        )
      end

      # The camera= method is used to set the camera for the view. If a transition
      # time is given, then it will animate the transition from the current camera
      # to the new one.
      #
      # @example
      #   camera2 = Sketchup.Camera.new
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   status = view.camera=camera2
      #
      # @overload camera=(camera)
      #
      #   @param camera [Sketchup::Camera] The new Camera object.
      #   @return [Sketchup::Camera]
      #
      # @overload camera=(camera_and_transition)
      #
      #   @param camera_and_transition [Array(Sketchup::Camera, Float)]
      #       The second item in the array represent the transition time from the
      #       existing camera to the new one
      #   @return [Array(Sketchup::Camera, Float)]
      #
      # @version SketchUp 6.0
      def camera=(arg)
      end

      # The center method is used to retrieve the coordinates of the center of the
      # view in pixels. It is returned as an array of 2 values for x and y.
      #
      # @example
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   c = view.center
      #
      # @return [Geom::Point3d] the center of the view
      #
      # @version SketchUp 6.0
      def center
      end

      # The corner method is used to retrieve the coordinates of one of the corners
      # of the view. The argument is an index between 0 and 3 that identifies which
      # corner you want. This method returns an array with two integers which are
      # the coordinates of the corner of the view in the view space. If the view
      # uses a Camera with a fixed aspect ratio, then the corners are the corners of
      # the viewing are of the camera which might be different than the actual
      # corners of the view itself.
      #
      # The index numbers are as follows:
      #  - 0: top left,
      #  - 1: top right,
      #  - 2: bottom left,
      #  - 3: bottom right.
      #
      # @example
      #   point = view.corner index
      #
      # @param index [Integer]
      #   A value between (or including) 0 and 3 identifying the
      #   corner whose coordinate you want to retrieve.
      #
      # @return [Array(Integer, Integer)] a 2d array [w,h] representing the screen point
      #
      # @version SketchUp 6.0
      sig { params(index: Numeric).returns(T::Array[Numeric]) }
      def corner(index)
        [3, 3.0]
      end

      # The {#draw} method is used to do basic drawing. This method can only be
      # called from within the {Tool#draw} method of a tool that you implement in
      # Ruby.
      #
      # The following constants are all OpenGL terms and have been externalized to
      # Ruby. Here is a summary of their meanings:
      #
      # [GL_POINTS]
      #   Treats each vertex as a single point. Vertex n defines point n. N
      #   points are drawn.
      #
      # [GL_LINES]
      #   Treats each pair of vertices as
      #   an independent line segment. Vertices 2n-1 and 2n define line n. N/2 lines
      #   are drawn.
      #
      # [GL_LINE_STRIP]
      #   Draws a connected group of line
      #   segments from the first vertex to the last. Vertices n and n+1 define
      #   line n. N-1 lines are drawn.
      #
      # [GL_LINE_LOOP]
      #   Draws a connected group of line segments from the first vertex to the last,
      #   then back to the first. Vertices n and n+1 define line n. The last line,
      #   however, is defined by vertices N and 1. N lines are drawn.
      #
      # [GL_TRIANGLES]
      #   Treats each triplet of vertices as an independent
      #   triangle. Vertices 3n-2, 3n-1, and 3n define triangle n. N/3 triangles are
      #   drawn.
      #
      # [GL_TRIANGLE_STRIP]
      #   Draws a connected group of triangles. One triangle is defined for each
      #   vertex presented after the first two vertices. For odd n, vertices n, n+1,
      #   and n+2 define triangle n. For even n, vertices n+1, n, and n+2 define
      #   triangle n. N-2 triangles are drawn.
      #
      # [GL_TRIANGLE_FAN]
      #   Draws a connected group of triangles.
      #   One triangle is defined for each vertex presented after the first two
      #   vertices. Vertices 1, n+1, and n+2 define triangle n. N-2 triangles are
      #   drawn.
      #
      # [GL_QUADS]
      #   Treats each group of four vertices as an
      #   independent quadrilateral. Vertices 4n-3, 4n-2, 4n-1, and 4n define
      #   quadrilateral n. N/4 quadrilaterals are drawn.
      #
      # [GL_QUAD_STRIP]
      #   Draws a connected group of quadrilaterals. One quadrilateral is
      #   defined for each pair of vertices presented after the first pair.
      #   Vertices 2n-1, 2n, 2n+2, and 2n+1 define quadrilateral n. N/2-1
      #   quadrilaterals are drawn. Note that the order in which vertices are used to
      #   construct a quadrilateral from strip data is different from that used with
      #   independent data.
      #
      # [GL_POLYGON]
      #   Draws a single, convex polygon. Vertices 1
      #   through N define this polygon.
      #
      # @example
      #   points = [
      #     Geom::Point3d.new(0, 0, 0),
      #     Geom::Point3d.new(9, 0, 0),
      #     Geom::Point3d.new(9, 9, 0),
      #     Geom::Point3d.new(0, 9, 0)
      #   ]
      #   view.draw(GL_LINE_LOOP, points)
      #
      # @note If you draw outside the model bounds you need to implement
      #   {Tool#getExtents} which return a bounding box large enough to include the
      #   points you draw. Otherwise your drawing will be clipped.
      #
      # @param openglenum [Integer]
      #   The item you are going to draw, one of the constants
      #   from the comments, such as +GL_LINES+.
      #
      # @param points [Array<Geom::Point3d>]
      #
      # @return [Sketchup::View]
      #
      # @see Tool#getExtents
      #
      # @version SketchUp 6.0
      def draw(openglenum, points)
      end

      # The {#draw2d} method is used to draw in screen space (using 2D screen
      # coordinates) instead of 3D space.
      #
      # The second parameter is an {Array} of {Geom::Point3d} objects (or several
      # individual {Geom::Point3d} objects). These {Geom::Point3d} objects are in
      # screen space, not 3D space.
      # The X value corresponds to the number of pixels from the left edge of the
      # drawing area. The Y value corresponds to the number of pixels down from
      # the top of the drawing area. The Z value is not used.
      #
      # @example
      #   points = [
      #     Geom::Point3d.new(0, 0, 0),
      #     Geom::Point3d.new(8, 0, 0),
      #     Geom::Point3d.new(8, 4, 0),
      #     Geom::Point3d.new(0, 4, 0)
      #   ]
      #   view.draw2d(GL_LINE_STRIP, points)
      #
      # @param points [Array<Geom::Point3d>]
      #
      # @param openglenum [Integer]
      #   An OpenGL enumerator (unsigned integer). See
      #   comments in the {#draw} method for a list of constants.
      #
      # @return [Sketchup::View] returns the View object.
      #
      # @see #draw
      #
      # @see UI.scale_factor
      #
      # @version SketchUp 6.0
      def draw2d(openglenum, points)
      end

      # The draw_lines method is used to draw disconnected lines.
      #
      # You must have an even number of points. This method is usually  invoked
      # within the draw method of a tool.
      #
      # @example
      #   point4 = Geom::Point3d.new 0,0,0
      #   point5 = Geom::Point3d.new 100,100,100
      #   # returns a view
      #   status = view.drawing_color="red"
      #   status = view.draw_lines point4, point5
      #
      # @overload draw_lines(point_list, ...)
      #
      #   @param point_list [Array<Geom::Point3d>] An even number of Point3d objects.
      #   @return [Sketchup::View] returns the View object
      #
      # @overload draw_lines(pts)
      #
      #   @param pts [Array<Geom::Point3d>] An array of Point3d objects.
      #   @return [Sketchup::View] returns the a View object
      #
      # @version SketchUp 6.0
      def draw_line(*args)
      end

      # The draw_lines method is used to draw disconnected lines.
      #
      # You must have an even number of points. This method is usually  invoked
      # within the draw method of a tool.
      #
      # @example
      #   point4 = Geom::Point3d.new 0,0,0
      #   point5 = Geom::Point3d.new 100,100,100
      #   # returns a view
      #   status = view.drawing_color="red"
      #   status = view.draw_lines point4, point5
      #
      # @overload draw_lines(point_list, ...)
      #
      #   @param point_list [Array<Geom::Point3d>] An even number of Point3d objects.
      #   @return [Sketchup::View] returns the View object
      #
      # @overload draw_lines(pts)
      #
      #   @param pts [Array<Geom::Point3d>] An array of Point3d objects.
      #   @return [Sketchup::View] returns the View object
      #
      # @version SketchUp 6.0
      def draw_lines(*args)
      end

      # This method is used to draw points.
      #
      # This method is usually invoked within the draw method of a tool.
      #
      # @example
      #   point3 = Geom::Point3d.new 0,0,0
      #   # returns a view
      #   status = view.draw_points point3, 10, 1, "red"
      #
      # @param pts [Array<Geom::Point3d>]
      #   An array of Point3d objects.
      #
      # @param pointsize [Integer] (optional)
      #   Size of the point in pixels.
      #
      # @param pointcolor [Sketchup::Color] (optional)
      #   Color of the point.
      #
      # @param pointstyle [Integer] (optional)
      #   Style of the point. 1 = open square,
      #   2 = filled square, 3 = "+", 4 = "X", 5 = "*",
      #   6 = open triangle, 7 = filled triangle.
      #
      # @return [Sketchup::View] a View object
      #
      # @version SketchUp 6.0
      def draw_points(pts, pointsize, pointstyle, pointcolor)
      end

      # The draw_polyline method is used to draw a series of connected line segments
      # from pt1 to pt2 to pt3, and so on.
      #
      # This method is usually invoked within the draw method of a tool.
      #
      # @example
      #   point12 = Geom::Point3d.new 0,0,0
      #   point13 = Geom::Point3d.new 10,10,10
      #   point14 = Geom::Point3d.new 20,20,20
      #   point15 = Geom::Point3d.new 30,30,30
      #   status = view.draw_polyline point12, point13, point14, point15
      #
      # @overload draw_polyline(point_list, ...)
      #
      #   @param point_list [Array<Geom::Point3d>] An even number of Point3d objects.
      #   @return [Sketchup::View] a View object
      #
      # @overload draw_polyline(pts)
      #
      #   @param pts [Array<Geom::Point3d>] An array of Point3d objects.
      #   @return [Sketchup::View] a View object
      #
      # @version SketchUp 6.0
      def draw_polyline(*args)
      end

      # This method is used to draw text on the screen and is usually invoked within
      # the draw method of a tool.
      #
      # @example
      #   view = Sketchup.active_model.active_view
      #
      #   # This works in all SketchUp versions and draws the text using the
      #   # default font, color and size.
      #   point = Geom::Point3d.new(200, 100, 0)
      #   view.draw_text(point, "This is a test")
      #
      #   # This works in SketchUp 2016 and up.
      #   options = {
      #     :font => "Arial",
      #     :size => 20,
      #     :bold => true,
      #     :align => TextAlignRight
      #   }
      #   point = Geom::Point3d.new(200, 200, 0)
      #   view.draw_text(point, "This is another\ntest", options)
      #
      #   # You can also use Ruby 2.0's named arguments:
      #   point = Geom::Point3d.new(200, 200, 0)
      #   view.draw_text(point, "Hello world!", color: "Red")
      #
      # @note Under Windows the font name must be less than 32 characters - due to
      #   system limitations.
      #
      # @option options [Sketchup::Color] :color The color to draw the text with.
      #
      # @option options [Integer] :align The text alignment, one of the following
      #   constants +TextAlignLeft+, +TextAlignCenter+ or +TextAlignRight+.
      #
      # @option options [Boolean] :italic Controls the Italic property of the font.
      #
      # @option options [Boolean] :bold Controls the Bold property of the font.
      #
      # @option options [Integer] :size The size of the font in points
      #
      # @option options [String] :font The name of the font to use. If it does not
      #   exist on the system, a default font will be used instead.
      #
      # @param options [Hash]
      #   The text can be customized by providing a hash or
      #   named arguments of options. Available from SketchUp 2016.
      #
      # @param text [String]
      #   The text string to draw.
      #
      # @param point [Geom::Point3d]
      #   A Point3d object representing a 2D coordinate
      #   in view space.
      #
      # @return [Sketchup::View]
      #
      # @version SketchUp 6.0
      def draw_text(point, text, options = {})
      end

      # The drawing_color method is used to set the color that is used for drawing
      # to the view.
      #
      # This method is usually invoked within the draw method of a tool.
      #
      # @example
      #   view = view.drawing_color = color
      #
      # @param color [Sketchup::Color, String] A Color object.
      #
      # @return [Sketchup::View]
      #
      # @version SketchUp 6.0
      def drawing_color=(color)
      end

      # The dynamic= method allows you to degrade visual quality while improving
      # performance when a model is large and view refresh time is slow. For
      # example, if you were using a Ruby script to animate the camera through
      # a large scene, you may want to set dynamic to true during that time.
      #
      # See also camera.rb which is part of the film and stage ruby
      # scripts.
      #
      # @example
      #   view.dynamic = true
      #
      # @param value [Boolean] true or false
      #
      # @return [Boolean]
      #
      # @version SketchUp 6.0
      def dynamic=(value)
      end

      # The field_of_view method is used get the view's field of view setting, in
      # degrees.
      #
      # @example
      #   fov = Sketchup.active_model.active_view.field_of_view
      #
      # @return [Float] the field of view
      #
      # @version SketchUp 6.0
      def field_of_view
      end

      # The field_of_view= method is used set the view's field of view setting,
      # in degrees.
      #
      # @example
      #   my_view = Sketchup.active_model.active_view
      #   my_view.field_of_view = 45
      #   my_view.invalidate
      #
      # @param fov [Numeric] the field of view
      #
      # @return [Numeric]
      #
      # @version SketchUp 6.0
      def field_of_view=(fov)
      end

      # The guess_target method is used to guess at what the user is looking at when
      # you have a perspective view.
      #
      # This method is useful when writing a viewing tool. See also camera.rb which
      # is part of the film and stage ruby scripts.
      #
      # @example
      #   target = view.guess_target
      #
      # @return [Geom::Point3d] a Point3d object representing the point in the
      #   model that the user is likely interested in.
      #
      # @version SketchUp 6.0
      def guess_target
      end

      # The inference_locked? method is used to determine if inference locking is on
      # for the view.
      #
      # @example
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   status = view.inference_locked
      #
      # @return [Boolean] true if locked, false if unlocked
      #
      # @version SketchUp 6.0
      def inference_locked?
      end

      # The inputpoint method is used to retrieve an input point.
      #
      # This will normally be used inside one of the mouse event handling methods in
      # a tool. Usually, it is preferable to create the InputPoint first and then
      # use the pick method on it.
      #
      # @example
      #   inputpoint = view.inputpoint x, y, inputpoint1
      #
      # @param x [Numeric] A x value.
      #
      # @param y [Numeric] A y value.
      #
      # @param inputpoint1 [Sketchup::InputPoint] An InputPoint object.
      #
      # @return [Sketchup::InputPoint]
      #
      # @version SketchUp 6.0
      def inputpoint(x, y, inputpoint1)
      end

      # The invalidate method is used mark the view as in need of a redraw.
      #
      # @example
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   invalidated_view = view.invalidate
      #
      # @note This is the preferred method to update the viewport. Use this before
      #   trying to use {#refresh}.
      #
      # @return [Sketchup::View] the invalidated View object
      #
      # @version SketchUp 6.0
      def invalidate
      end

      # The last_refresh_time method is used to retrieve the time for the last full
      # view refresh.
      #
      # @example
      #   time = view.last_refresh_time
      #
      # @return [Float] time in milliseconds
      #
      # @version SketchUp 6.0
      def last_refresh_time
      end

      # The line_stipple= method is used to set the line pattern to use for drawing.
      # The stipple pattern is given as a string.
      # Valid strings are:
      #   "." (Dotted Line),
      #   "-" (Short Dashes Line),
      #   "_" (Long Dashes Line),
      #   "-.-" (Dash Dot Dash Line),
      #   "" (Solid Line).
      #
      # This method is usually invoked within the draw method of a tool.
      #
      # @example
      #   point8 = Geom::Point3d.new 0,0,0
      #   point9 = Geom::Point3d.new 100,100,100
      #   view.line_stipple = "-.-"
      #   view = view.draw_lines point8, point9
      #
      # @param pattern [String] A string stipple pattern, such as "-.-"
      #
      # @return [Sketchup::View] the View object
      #
      # @version SketchUp 6.0
      def line_stipple=(pattern)
      end

      # The line_width= method is used to set the line width to use for drawing. The
      # value is a Double indicating the desired width in pixels.
      #
      # This method is usually invoked within the draw method of a tool.
      #
      # @example
      #   view.line_width = width
      #
      # @param width [Integer] The width in pixels.
      #
      # @return [Integer]
      #
      # @version SketchUp 6.0
      def line_width=(width)
      end

      # The lock_inference method is used to lock or unlock an inference.
      #
      # This method will typically be called from inside a tool class when the user
      # presses the shift key.
      #
      # With no arguments it unlocks all inferences. With one or two arguments, it
      # locks the inference based on the given InputPoint(s).
      #
      # @example
      #   view = view.lock_inference
      #   view = view.lock_inference inputpoint
      #   view = view.lock_inference inputpoint1, inputpoint2
      #
      # @param inputpoint [Sketchup::InputPoint] (optional)
      #   1st InputPoint to inference to.
      #
      # @param inputpoint2 [Sketchup::InputPoint] (optional)
      #   2nd InputPoint to inference to.
      #
      # @return [Sketchup::View] a View object
      #
      # @version SketchUp 6.0
      def lock_inference(inputpoint = nil, inputpoint2 = nil)
      end

      # The model method is used to retrieve the model for the current view.
      #
      # @example
      #   model = view.model
      #
      # @return [Sketchup::Model] the model for this view
      #
      # @version SketchUp 6.0
      def model
      end

      # The pick_helper method is used to retrieve a pick helper for the view. See
      # the PickHelper class for information on pick helpers.
      #
      # This call returns an initialized PickHelper.
      #
      # @example
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   ph = view.pick_helper
      #
      # @overload pick_helper
      #
      #   @return [Sketchup::PickHelper] a PickHelper object
      #
      # @overload pick_helper(x, y, aperture = 0)
      #
      #   @param x [Integer]
      #   @param y [Integer] y
      #   @param aperture [Integer]
      #   @return [Sketchup::PickHelper] a PickHelper object
      #
      # @version SketchUp 6.0
      def pick_helper(*args)
      end

      # The pickray method is used to retrieve a ray passing through a given screen
      # position in the viewing direction.
      #
      # @example
      #   ray = view.pickray x, y
      #
      # @overload pickray(screen_point)
      #
      #   @param screen_point [Array(Integer, Integer)]
      #   @return [Array(Geom::Point3d, Geom::Vector3d)] a ray
      #
      # @overload pickray(x, y)
      #
      #   @param x [Integer]
      #   @param y [Integer]
      #   @return [Array(Geom::Point3d, Geom::Vector3d)] a ray
      #
      # @version SketchUp 6.0
      def pickray(*args)
      end

      # The pixels_to_model method is used to compute a model size from a pixel size
      # at a given point.
      #
      # This method is useful for deciding how big to draw something based on a
      # desired size in pixels.
      #
      # @example
      #   size = view.pixels_to_model pixels, point
      #
      # @param pixels [Numeric]
      #   The pixel size.
      #
      # @param point [Geom::Point3d]
      #   A Point3d object where the size will be calculated from.
      #
      # @return [Float] the model size
      #
      # @version SketchUp 6.0
      def pixels_to_model(pixels, point)
      end

      # The refresh method is used to immediately force a redraw of the view.
      #
      # @example
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   refreshed_view = view.refresh
      #
      # @note This method might impact performance and if used incorrectly cause
      #   instability or crashes. Don't use this unless you have verified that
      #   you cannot use {#invalidate} instead.
      #
      # @return [Sketchup::View] the refreshed View object
      #
      # @version SketchUp 7.1
      def refresh
      end

      # The remove_observer method is used to remove an observer from the current
      # object.
      #
      # @example
      #   view = Sketchup.active_model.active_view
      #   status = view.remove_observer observer
      #
      # @param observer [Object]
      #   An observer.
      #
      # @return [Boolean] true if successful, false if unsuccessful.
      #
      # @version SketchUp 6.0
      def remove_observer(observer)
      end

      # The screen_coords method is used to retrieve the screen coordinates of the
      # given point on the screen.
      #
      # The x and y values returned correspond to the x and y screen coordinates.
      # Ignore the z values.  If the referenced point is not in the current
      # viewport,  the x and/or y value may be negative.
      #
      # @example
      #   point = view.screen_coords(ORIGIN)
      #
      # @param point3d [Geom::Point3d] A Point3d object.
      #
      # @return [Geom::Point3d] A Point3d containing the screen position
      #
      # @version SketchUp 6.0
      def screen_coords(point3d)
      end

      # Set the drawing color for the view based on the direction of a line that you
      # want to draw. These colors will match the axes colors in the SketchUp model
      # (typically blue for straight up and down, etc.)
      #
      # This method is usually invoked within the draw method of a tool.
      #
      # @example
      #   view = view.set_color_from_line point1, point2
      #
      # @param point1 [Geom::Point3d]
      #   Point3d object representing first point in the line.
      #
      # @param point2 [Geom::Point3d]
      #   Point3d object representing second point in the line.
      #
      # @return [Sketchup::View] a View object
      #
      # @version SketchUp 6.0
      def set_color_from_line(point1, point2)
      end

      # The show_frame method is used to show a frame of an Animation object in the
      # current view.
      #
      # You can supply an optional delay in seconds to wait before showing the next
      # frame. This can be useful to control the speed at which the animation runs.
      #
      # @example
      #   status = view.show_frame delay
      #
      # @param delay [Numeric]
      #   An optional delay in seconds.
      #
      # @return [Sketchup::View]
      #
      # @version SketchUp 6.0
      def show_frame(delay)
      end

      # Set a tooltip to display in the view. This is useful for displaying tooltips
      # in a tool that you write in Ruby.
      #
      # @example
      #   tooltip = view.tooltip = string
      #
      # @param string [String]
      #   The string tooltip.
      #
      # @return [String] the new tooltip string
      #
      # @version SketchUp 6.0
      def tooltip=(string)
      end

      # The vpheight method is used to retrieve the height of the viewport for the
      # view.
      #
      # @example
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   height = view.vpheight
      #
      # @return [Integer] the height of the viewport in pixels.
      #
      # @version SketchUp 6.0
      def vpheight
      end

      # The vpwidth method is used to retrieve the width of the viewport for the
      # view.
      #
      # @example
      #   width = view.vpwidth
      #
      # @return [Integer] the width of the viewport in pixels.
      #
      # @version SketchUp 6.0
      def vpwidth
      end

      # The write_image method is used to write the current view to an image file.
      #
      # All arguments except for the filename are optional.
      #
      # If antialias is specified, it should be either true or false.
      #
      # If a hash is passed as the first parameter, then the contents of that hash
      # define how the image is exported.
      # The keys are:
      #  - filename        The filename for the saved image.
      #  - width           (optional) Width in pixels (max 16000).
      #  - height          (optional) Height in pixels (max 16000).
      #  - antialias       (optional) true or false
      #  - compression     (optional) Float compression factor for JPEG images,
      #                    between 0.0 and 1.0
      #  - transparent     true or false
      #
      # @example
      #   depth = 100
      #   width = 100
      #   model = Sketchup.active_model
      #   entities = model.active_entities
      #   pts = []
      #   pts[0] = [0, 0, 0]
      #   pts[1] = [width, 0, 0]
      #   pts[2] = [width, depth, 0]
      #   pts[3] = [0, depth, 0]
      #   # Add the face to the entities in the model
      #   face = entities.add_face pts
      #   UI.messagebox "Now Lets Write the Image"
      #   view = model.active_view
      #   # Puts in SketchUp install directory by default
      #   status = view.write_image "test.jpg"
      #   keys = {
      #     :filename => "c:/tmp/write_image.png",
      #     :width => 640,
      #     :height => 480,
      #     :antialias => false,
      #     :compression => 0.9,
      #     :transparent => true
      #   }
      #   model = Sketchup.active_model
      #   view = model.active_view
      #   view.write_image keys
      #
      # @param filename_or_hash [String, Hash]
      #   The filename for the saved image or a hash
      #   containing a set of keys.
      #
      # @param width [Integer]
      #   Width in pixels, defaults to the current viewport width {#vpwidth}.
      #
      # @param height [Integer]
      #   Height in pixels, defaults to the current viewport height {#vpheight}.
      #
      # @param compression [Float]
      #   Float compression factor for JPEG images,
      #   between 0.0 and 1.0
      #
      # @param antialias [Boolean]
      #   true or false
      #
      # @return [Boolean]
      #
      # @version SketchUp 6.0
      def write_image(
        filename_or_hash,
        width = nil,
        height = nil,
        antialias = false,
        compression = nil
      )
      end

      # The zoom method is used to zoom in or out by some zoom factor.
      #
      # @example
      #   view = view.zoom factor
      #   view = view.zoom selection
      #   view = view.zoom entity
      #   view = view.zoom array_of_entities
      #
      # @param zoom_or_ents [Numeric, Sketchup::Selection, Sketchup::Entity, Array<Sketchup::Entity>]
      #   A Float zoom factor from 1.0 or larger or an Array or
      #   collection of entities to "zoom extents" around.
      #
      # @return [Sketchup::View] the zoomed View object
      #
      # @version SketchUp 6.0
      def zoom(zoom_or_ents)
      end

      # The zoom_extents method is used to zoom to the extents about the entire
      # model, as if the user has selected the zoom extents command from the menu.
      #
      # @example
      #   view = Sketchup.active_model.active_view
      #   new_view = view.zoom_extents
      #
      # @return [Sketchup::View] the zoomed View object
      #
      # @version SketchUp 6.0
      def zoom_extents
      end
    end
  end # module Papercute
end # module BreedloveDesign
