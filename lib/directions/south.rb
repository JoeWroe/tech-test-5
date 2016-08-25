require './lib/directions/direction'

# A module of direction for when the Rover is facing South.
class South < Direction
  def to_s
    'S'
  end

  def right_turn
    West.new
  end

  def left_turn
    East.new
  end

  def move
    [0, -1]
  end
end
