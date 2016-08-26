# A class to DRY up exception handling
class RoboticRoverError < StandardError
end

class LinkToRoverError < RoboticRoverError
  def initialize(msg='Incorrect argument class, please link to a RoboticRover.')
    super
  end
end
