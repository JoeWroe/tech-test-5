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
    create_nav_grid(start_coords, location)
    update_position
    create_camera(position[2])
    location.current_rovers << self
  end

  def display_position
    "Rovers position: #{position[0]} #{position[1]} #{position[2]}"
  end

  def move
    nav_grid.move
    update_position
  end

  def right_turn
    nav_grid.right_turn
    update_position
  end

  def left_turn
    nav_grid.left_turn
    update_position
  end

  private

  def update_position
    @position = [nav_grid.x_coord, nav_grid.y_coord, nav_grid.direction]
  end

  def create_camera(direction)    # Can this creation be moved to initialization?
    @camera = Camera.new(direction)
    camera.toggle_recording
  end

  def create_nav_grid(start_coords, location)
    @nav_grid = NavGrid.new(start_coords, location)
  end
end
