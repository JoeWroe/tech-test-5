require './lib/plateau'
require './lib/nasa_controller'
require './lib/robotic_rover'
require './lib/errors/app_error'

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
    @controller = NasaController.new(plateau: plateau)
  end

  def create_rover_list
    raise NoLandCommandError if landings == []
    landings.each { |landing| @rover_list << RoboticRover.new }
  end

  def run_rovers
    puts link_commands_to_rovers
    # @rover_list.each do |rover|
    #   controller.link_to_rover(rover)
    #   controller.land_rover()
  end

  private

  def landings
    interpreter.find_rover_landings
  end

  def movements
    interpreter.find_rover_movements
  end

  def link_commands_to_rovers
    @rover_list = @rover_list.zip(landings, movements)
  end
end
