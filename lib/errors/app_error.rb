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

class NoInputError < AppError
  def initialize
    super
  end

  def message
    'No input detected, ' \
    'an input must be provided and then parsed, ' \
    'please run `app.parse_file(input_file)`.'
  end
end
