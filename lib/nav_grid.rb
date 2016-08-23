# When a rover lands, it needs some means of handling it's position. This is
# managed by the following class.
class NavGrid
  attr_reader :location, :x_coord, :y_coord, :direction

  def initialize(start_coords, location)
    @location = location
    @x_coord = start_coords.split(' ')[0].to_i
    @y_coord = start_coords.split(' ')[1].to_i
    @direction = create_direction_class(start_coords.split(' ')[2])
  end

  def move
    @y_coord += 1
  end

  def right_turn
    @direction = direction.right_turn
  end

  def left_turn
    @direction = direction.left_turn
  end

  private

  def create_direction_class(command_input_direction)
    return North.new if command_input_direction == 'N'
  end
end
