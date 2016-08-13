# A rover capable of intersteller exploration.
class RoboticRover
  attr_reader :nav_grid_active, :nav_grid, :position

  def initialize
    @nav_grid_active = false
    @nav_grid = []
    @position = []
  end

  def land_rover(start_position, location)
    toggle_nav_grid(location)
    @position = start_position
    location.current_rovers << self
  end

  private

  def toggle_nav_grid(location)
    @nav_grid_active = !@nav_grid_active
    create_nav_grid(location)
  end

  def create_nav_grid(location)
    @nav_grid = NavGrid.new(location.size)
  end
end
