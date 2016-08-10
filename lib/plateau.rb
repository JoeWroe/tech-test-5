class Plateau
  attr_reader :x_axis_limit, :y_axis_limit
  def initialize(size)
    @x_axis_limit = size.split(' ')[0].to_i
    @y_axis_limit = size.split(' ')[1].to_i
  end
  # attr_reader :current_rovers
  #
  # def initialize(size)
  #   @x_max          = size.split(' ')[0].to_i
  #   @y_max          = size.split(' ')[1].to_i
  #   @current_rovers = []
  # end
  #
  # def size
  #   "#{@x_max}, #{@y_max}"
  # end
end
