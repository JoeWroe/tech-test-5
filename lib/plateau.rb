class Plateau
  attr_reader :x_axis_limit, :y_axis_limit, :current_rovers

  def initialize(size)
    @x_axis_limit   = size.split(' ')[0].to_i
    @y_axis_limit   = size.split(' ')[1].to_i
    @current_rovers = []
  end
end
