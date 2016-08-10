class NasaController
  attr_reader :current_rover

  def initialize
    @current_rover = []
  end

  def link_to_rover(robotic_rover)
    @current_rover = robotic_rover
  end

  # attr_reader :plateau

  # def initialize
  #   @current_rover = []
  #   @plateau       = []
  # end
  #
  #
  # def establish_plateau(size)
  #   @plateau = Plateau.new(size)
  # end
  #
  # def land_rover(initial_position)
  #   @plateau.current_rovers.push(current_rover)
  # end
end
