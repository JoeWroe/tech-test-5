class NasaController
  attr_reader :current_rover

  def initialize
    @current_rover = []
  end

  def link_to_rover(robotic_rover)
    # add error based on arguments type
    @current_rover = robotic_rover
  end

  def land_rover(params)
  end

  # attr_reader :plateau

  # def initialize
  #   @plateau       = []
  # end
  #
  # def land_rover(initial_position)
  #   @plateau.current_rovers.push(current_rover)
  # end
end
