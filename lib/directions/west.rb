require './lib/directions/direction'

# A module of direction for when the Rover is facing West.
class West < Direction
  def to_s
    'W'
  end

  def right_turn
    North.new
  end

  def left_turn
    South.new
  end

  def move
    [-1, 0]
  end
end
