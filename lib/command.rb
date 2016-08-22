# When a command is input this class handles what is to be done with it.
class Command
  attr_reader :input, :robotic_rover

  def initialize(input, robotic_rover)
    @input         = input
    @robotic_rover = robotic_rover
  end

  def position_change
    return robotic_rover.move if input == 'M'
    return robotic_rover.right_turn if input == 'R'
    return robotic_rover.left_turn if input == 'L'
  end
end
