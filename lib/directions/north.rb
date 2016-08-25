require './lib/directions/direction'

# A module of direction for when the Rover is facing North.
class North < Direction
  def to_s
    'N'
  end

  def right_turn
    East.new
  end

  def left_turn
    West.new
  end

  def move
    [0, 1]
  end
end
