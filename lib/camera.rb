# A camera that can be turn on and rotated seperatly to the robotic rover.
class Camera
  attr_reader :recording

  def initialize
    @recording = false
  end

  def toggle_recording
    @recording = true
  end
end
