# A class to parse an input passed in via a test file
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

  def find_plateau_size
    input_strings.each do |command|
      return /[0-9]\s[0-9]/.match(command) ? command : false
    end
  end
end
