# A rover capable of intersteller exploration.
require './lib/camera'
require './lib/nav_grid'

class RoboticRover
  attr_reader :camera, :nav_grid, :position

  def initialize
    @camera = []
    @nav_grid = []
    @position = []
  end

  def land_rover(start_position, location)
    # add error if location argument does not have a #size attribute
    update_position(start_position)
    create_nav_grid(location)
    create_camera
    location.current_rovers << self
  end

  def display_position
    "Rovers position: #{position[0].to_s} #{position[1].to_s} #{position[2]}"
  end

  def move_forward_on_x
    @position = [position[0] + 1, position[1], position[2]]
  end

  private

  def update_position(position)
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
    @nav_grid = NavGrid.new(location.size)
  end
end
