require './lib/plateau'
require './lib/errors/app_error'

class App
  attr_reader :interpreter, :plateau

  def initialize(interpreter)
    @interpreter = interpreter
    @plateau = []
  end

  def parse_file(input_file)
    interpreter.parse_input(input_file)
  end

  def create_plateau
    raise PlateauSizeError unless interpreter.find_plateau_size
    @plateau = Plateau.new(interpreter.find_plateau_size)
  end
end
