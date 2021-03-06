require './lib/plateau'
require './lib/nasa_controller'
require './lib/robotic_rover'
require './lib/errors/app_error'

# Extracts commands that could be used into one file so they can all be run
# from the same place.
class App
  attr_reader :interpreter, :plateau, :controller, :rover_list

  def initialize(interpreter)
    @interpreter = interpreter
    @plateau = []
    @controller = controller
    @rover_list = []
  end

  def parse_file(input_file)
    interpreter.parse_input(input_file)
  end

  def create_plateau
    raise PlateauSizeError if interpreter.find_plateau_size == ''
    @plateau = Plateau.new(interpreter.find_plateau_size)
  end

  def create_controller
    raise NoPlateauCreatedError if @plateau == []
    @controller = NasaController.new(plateau: plateau)
  end

  def create_rover_list
    raise NoLandCommandError if landings == []
    landings.each { @rover_list << RoboticRover.new }
  end

  def run_rovers
    link_commands_to_rovers
    @rover_list.each do |rover|
      controller.link_to_rover(rover[0])
      controller.land_rover(rover[1])
      controller.command_input(rover[2])
    end
  end

  private

  def landings
    interpreter.find_rover_landings
  end

  def movements
    interpreter.find_rover_movements
  end

  def link_commands_to_rovers
    raise NoLandCommandError if landings == []
    raise NoMovementCommandError if movements == []
    @rover_list = @rover_list.zip(landings, movements)
  end
end
