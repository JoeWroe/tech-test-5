# Interface for use by a NASA employee.
class NasaController
  attr_reader :plateau, :current_rover

  def initialize(plateau:)
    @plateau = plateau
    @current_rover = []
  end

  def link_to_rover(robotic_rover)
    # add error based on arguments type
    @current_rover = robotic_rover
  end

  def land_rover(start_position)
    current_rover.land_rover(start_position, plateau)
  end

  def command_input(commands)
    commands.split('').each do |command|
      new_command_class = Command.new(command)
    end
  end
end
