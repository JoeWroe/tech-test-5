require './lib/directions/direction'

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
end
