require './lib/directions/direction'

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
end
