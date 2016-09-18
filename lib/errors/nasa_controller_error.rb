# A class to DRY up exception handling
class NasaControllerError < StandardError
end

# A bespoke error message for when a link is attemped to something other than
# a rover.
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

# A bespoke error message for when commands are run that need a linked rover,
# but there is no rover linked.
class NoRoverLinkedError < NasaControllerError
  def initialize
    super
  end

  def message
    'NasaController is currently not linked to a rover, ' \
    'to proceed with this command, please link to a RoboticRover. ' \
    'Run #link_to_rover(robotic_rover) to do so.'
  end
end

# A bespoke error message for when the land command is in the wrong format.
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

# A bespoke error message for when movement commands are passed to a rover that
# is not already landed.
class NoRoverLandedError < NasaControllerError
  def initialize
    super
  end

  def message
    'The current rover is not landed, ' \
    'this command must be run on a landed rover, ' \
    'please run RoboticRover#land_rover(start_coords, location).'
  end
end
