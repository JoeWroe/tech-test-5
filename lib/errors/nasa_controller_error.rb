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

class NoRoverLinkedError < NasaControllerError
  def initialize
    super
  end

  def message
    'NasaController is currently not linked to a rover, ' \
    'to proceed with this command, please link to a RoboticRover. ' \
    'Run #link_to_rover(*any RoboticRover*) to do so.'
  end
end

class LandInputError < NasaControllerError
  def initialize
    super
  end

  def message
    'NasaController can not land a rover using the given start position. ' \
    'Please use a position which the rover can understand, ' \
    'positions have to be made up of two integers ' \
    'followed by a cardinal compass direction.'
  end
end
