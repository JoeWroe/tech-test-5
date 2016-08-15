# When a command is input this class handles what is to be done with it.
class Command
  attr_reader :input

  def initialize(input)
    @input = input
  end
end
