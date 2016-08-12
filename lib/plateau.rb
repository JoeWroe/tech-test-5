class Plateau
  attr_reader :size, :current_rovers

  def initialize(size)
    @size = size
    @current_rovers = []
  end
end
