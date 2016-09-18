# A class to DRY up exception handling
class AppError < StandardError
end

# A bespoke error message for when an input file does not contain a plateau
# size command
class PlateauSizeError < AppError
  def initialize
    super
  end

  def message
    'No plateau size detected, ' \
    'the input file passed into #parse_input must contain a plateau size, ' \
    "a plateau size must use the format 'Integer Integer'."
  end
end

# A bespoke error message for when an input file does not contain any land
# commands
class NoLandCommandError < AppError
  def initialize
    super
  end

  def message
    'No land command detected, ' \
    'the file pased into #parse_input must contain a land command, ' \
    "a land command must use the format 'Integer Integer Cardinal-Direction'."
  end
end

# A bespoke error message for when an input file does not contain any
# movement commands
class NoMovementCommandError < AppError
  def initialize
    super
  end

  def message
    'No movement command detected, ' \
    'the file pased into #parse_input must contain a movement command, ' \
    "a movement command contains a string of the letters 'L', 'M' or 'R', " \
    'not seperated by spaces.'
  end
end

# A bespoke error message for when an attempt is made to create a controller
# without a plateau being defined first.
class NoPlateauCreatedError < AppError
  def initialize
    super
  end

  def message
    'No plateau detected, ' \
    'the app needs knowledge of a plateau to run correctly, ' \
    'please run App#create_plateau.'
  end
end
