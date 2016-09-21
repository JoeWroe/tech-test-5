require './lib/command'
require './lib/format_checkers/format_checker'
require './lib/errors/nasa_controller_error'

# Interface for use by a NASA employee.
class NasaController
  attr_reader :plateau, :current_rover

  def initialize(plateau:)
    @plateau = plateau
    @current_rover = []
  end

  def link_to_rover(robotic_rover)
    raise RoverLinkError unless robotic_rover.is_a? RoboticRover
    @current_rover = robotic_rover
  end

  def land_rover(start_position)
    raise NoRoverLinkedError unless current_rover.is_a? RoboticRover
    raise LandInputError unless correct_format?(start_position)
    current_rover.land_rover(start_position, plateau)
  end

  def command_input(commands)
    raise NoRoverLinkedError unless current_rover.is_a? RoboticRover
    raise NoRoverLandedError unless plateau.current_rovers.include?(current_rover)
    command_iteration(commands)
    puts current_rover.display_position
    current_rover.display_position
  end

  private

  def command_iteration(commands)
    commands.split('').each do |command|
      new_command_class = Command.new(command, current_rover)
      new_command_class.position_change
    end
  end

  def correct_format?(input)
    new_format_checker_class = FormatChecker.new
    new_format_checker_class.check_format(input)
  end
end
