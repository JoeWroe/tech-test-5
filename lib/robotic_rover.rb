class RoboticRover
  attr_reader :nav_grid_active

  def initialize
    @nav_grid_active = false
  end

  def land_rover(location)
    location.current_rovers << self
  end

  def toggle_nav_grid
    @nav_grid_active = !@nav_grid_active
  end
end
