class InputInterpreter

  attr_reader :input_strings

  def initialize
    @input_strings = []
  end

  def parse_input(input_file)
    File.open(input_file).each do |line|
      @input_strings << line.chomp
    end
  end
end
