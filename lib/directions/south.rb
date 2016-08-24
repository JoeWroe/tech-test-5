require './lib/directions/direction'

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
end
