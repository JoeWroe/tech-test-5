require './lib/directions/direction'

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
