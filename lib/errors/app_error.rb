# A class to DRY up exception handling
class AppError < StandardError
end

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
