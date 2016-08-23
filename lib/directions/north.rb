require './lib/directions/direction'

class North < Direction

  def right_turn
    East.new
  end

  def to_s
    'N'
  end
end
