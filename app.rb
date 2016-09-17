require './lib/plateau'
require './lib/errors/app_error'

class App
  attr_reader :interpreter, :plateau, :rover_list

  def initialize(interpreter)
    @interpreter = interpreter
    @plateau = []
    @rover_list = []
  end

  def parse_file(input_file)
    interpreter.parse_input(input_file)
  end

  def create_plateau
    raise NoInputError if interpreter.input_strings == []
    raise PlateauSizeError if interpreter.find_plateau_size == ''
    @plateau = Plateau.new(interpreter.find_plateau_size)
  end

  def create_rover_list
    raise NoLandCommandError if landings == []
    landings.each { |landing| @rover_list << RoboticRover.new }
  end

  private

  def landings
    interpreter.find_rover_landings
  end
end
