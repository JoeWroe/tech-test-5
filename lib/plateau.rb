# A pysical piece of land. Research outside of the scope of this program
# determines the size of the Plateau.
class Plateau
  attr_reader :x_limit, :y_limit, :size, :current_rovers

  def initialize(size)
    @x_limit = size.split(' ')[0].to_i
    @y_limit = size.split(' ')[1].to_i
    @size = [x_limit, y_limit]
    @current_rovers = []
  end
end
