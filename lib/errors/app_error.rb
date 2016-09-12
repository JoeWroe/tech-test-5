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
