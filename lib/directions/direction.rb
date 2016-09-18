# A template class for modules for each cardinal compass direction. This
# will let the NavGrid know which direction the rover is facing.
class Direction
  def to_s
    raise NotImplementedError
  end

  def right_turn
    raise NotImplementedError
  end

  def left_turn
    raise NotImplementedError
  end

  def move
    raise NotImplementedError
  end
end
