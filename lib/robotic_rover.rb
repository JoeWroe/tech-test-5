# A rover capable of intersteller exploration.
class RoboticRover
  attr_reader :nav_grid_active, :nav_grid, :position, :camera_feed_active

  def initialize
    @nav_grid_active = false
    @nav_grid = []
    @position = []
    @camera = camera
    @camera_feed_active = camera.recording
  end

  def land_rover(start_position, location)
    toggle_nav_grid(location)
    @position = start_position
    start_camera_feed
    location.current_rovers << self
  end

  private

  def toggle_nav_grid(location)
    @nav_grid_active = true
    create_nav_grid(location)
  end

  def create_nav_grid(location)
    @nav_grid = NavGrid.new(location.size)
  end

  def camera
    Camera.new
  end

  def start_camera_feed
    @camera_feed_active = camera.toggle_recording
  end
end
