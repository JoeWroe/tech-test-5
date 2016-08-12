# A pysical piece of land. Research outside of the scope of this program
# determines the size of the Plateau.
class Plateau
  attr_reader :size, :current_rovers

  def initialize(size)
    @size = size
    @current_rovers = []
  end
end
