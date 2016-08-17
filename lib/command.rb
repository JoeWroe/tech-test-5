# When a command is input this class handles what is to be done with it.
class Command
  attr_reader :input, :robotic_rover

  def initialize(input, robotic_rover)
    @input         = input
    @robotic_rover = robotic_rover
  end

  def position_change
    if input === 'M'
      robotic_rover.move_forward_on_x
    end
  end
end
