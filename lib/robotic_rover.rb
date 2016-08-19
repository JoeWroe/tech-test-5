require './lib/camera'
require './lib/nav_grid'

# A rover capable of intersteller exploration.
class RoboticRover
  attr_reader :camera, :nav_grid, :position

  def initialize
    @camera = []
    @nav_grid = []
    @position = []
  end

  def land_rover(start_position, location)
    update_position(start_position)
    create_nav_grid(location)
    create_camera
    location.current_rovers << self
  end

  def display_position
    # add error if rover is not landed.
    "Rovers position: #{position[0]} #{position[1]} #{position[2]}"
  end

  def move_forward_on_x
    # error if rover is not landed.
    # error if moves outside limits of plateau#size.
    # refactor to #move, delagate #forward_on_x somewhere else.
    @position = [position[0] + 1, position[1], position[2]]
  end

  private

  def update_position(position)
    # error if position not in correct format (string, 2 numbers, 1 letter)
    # error if position is outside plateau#size limits.
    pos_array = split_position_to_array(position)
    @position = pos_array[0].to_i, pos_array[1].to_i, pos_array[2]
  end

  def split_position_to_array(position)
    position.split(' ')
  end

  def create_camera
    @camera = Camera.new
    camera.toggle_recording
  end

  def create_nav_grid(location)
    # error if location argument does not have a #size attribute
    @nav_grid = NavGrid.new(location.size)
  end
end
