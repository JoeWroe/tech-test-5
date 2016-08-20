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

  def land_rover(start_coords, location)
    #error if start_coords outside location#size
    create_nav_grid(start_coords, location)
    create_camera
    update_position
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

  def update_position
    @position = [nav_grid.x_coord, nav_grid.y_coord, nav_grid.direction]
  end

  def create_camera
    @camera = Camera.new
    camera.toggle_recording
  end

  def create_nav_grid(start_coords, location)
    @nav_grid = NavGrid.new(start_coords, location)
  end
end
