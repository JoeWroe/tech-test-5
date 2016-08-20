# When a rover lands, it needs some means of handling it's position. This is
# managed by the following class.
class NavGrid
  attr_reader :x_axis_limit, :y_axis_limit

  def initialize(size)
    @x_axis_limit = size.split(' ')[0].to_i
    @y_axis_limit = size.split(' ')[1].to_i
  end
end
