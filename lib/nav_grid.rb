# When a rover lands, it needs some means of handling it's position. This is
# managed by the following class.
class NavGrid
  attr_reader :x_axis_limit, :y_axis_limit

  def initialize(size)
    @x_axis_limit = size[0]
    @y_axis_limit = size[1]
  end
end
