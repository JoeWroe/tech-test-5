# A class to DRY up exception handling
class NasaControllerError < StandardError
end

class RoverLinkError < NasaControllerError
  def initialize
    super
  end

  def message
    'Incorrect argument error, ' \
    'the argument passed into this method needs to be of a specific class, ' \
    'please link to an instance of the RoboticRover class.'
  end
end
