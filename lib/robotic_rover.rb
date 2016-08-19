# A rover capable of intersteller exploration.
require './lib/camera'
require './lib/nav_grid'

class RoboticRover
  attr_reader :nav_grid_active, :nav_grid, :position, :camera, :camera_feed_active

  def initialize
    @nav_grid = []
    @nav_grid_active = false
    @position = []
    @camera = []
  end

  def land_rover(start_position, location)
    # add error if location argument does not have a #size attribute
    split_position_to_array(start_position)
    toggle_nav_grid(location)
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

  def split_position_to_array(position)
    start_array = position.split(' ')
    @position = [start_array[0].to_i, start_array[1].to_i, start_array[2]]
  end

  def create_nav_grid(location)
    @nav_grid = NavGrid.new(location.size)
  end

  def toggle_nav_grid(location)
    @nav_grid_active = true
    create_nav_grid(location)
  end

  def create_camera
    @camera = Camera.new
    camera.toggle_recording
  end
end
