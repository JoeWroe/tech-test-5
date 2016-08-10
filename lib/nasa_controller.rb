class NasaController
  attr_reader :plateau, :current_rover

  def initialize(plateau: )
    @plateau = plateau
    @current_rover = []
  end

  def link_to_rover(robotic_rover)
    # add error based on arguments type
    @current_rover = robotic_rover
  end

  def land_rover
    plateau.current_rovers << current_rover
  end
end
