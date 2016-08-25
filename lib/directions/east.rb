require './lib/directions/direction'

# A module of direction for when the Rover is facing East.
class East < Direction
  def to_s
    'E'
  end

  def right_turn
    South.new
  end

  def left_turn
    North.new
  end

  def move
    [1, 0]
  end
end
