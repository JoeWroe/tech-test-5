# A camera that can be turn on and rotated seperatly to the robotic rover.
class Camera
  attr_reader :recording, :direction

  def initialize(direction)
    @recording = false
    @direction = direction
  end

  def toggle_recording
    @recording = true
  end

  def rotate_right
    @direction = direction.right_turn
  end

  def rotate_left
    @direction = direction.left_turn
  end
end
