require './lib/command'
require './lib/errors/robotic_rover_error'

# Interface for use by a NASA employee.
class NasaController
  attr_reader :plateau, :current_rover

  def initialize(plateau:)
    @plateau = plateau
    @current_rover = []
  end

  def link_to_rover(robotic_rover)
    raise LinkToRoverError unless robotic_rover.is_a? RoboticRover
    @current_rover = robotic_rover
  end

  def land_rover(start_position)
    # add error if start_position is not in correct format
    current_rover.land_rover(start_position, plateau)
  end

  def command_input(commands)
    # add error if commands are not in correct format
    # add error if rover is not landed
    command_iteration(commands)
    current_rover.display_position
  end

  private

  def command_iteration(commands)
    commands.split('').each do |command|
      new_command_class = Command.new(command, current_rover)
      # is the position change a responsibility of #command_iteration?
      new_command_class.position_change
    end
  end
end
