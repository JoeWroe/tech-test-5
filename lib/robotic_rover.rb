class RoboticRover
  attr_reader :nav_grid_active, :nav_grid

  def initialize
    @nav_grid_active = false
    @nav_grid = []
  end

  def land_rover(location)
    toggle_nav_grid(location)
    location.current_rovers << self
  end

  private

  def toggle_nav_grid(location)
    @nav_grid_active = !@nav_grid_active
    create_nav_grid(location)
  end

  def create_nav_grid(location)
    @nav_grid = NavGrid.new(location)
  end
end
