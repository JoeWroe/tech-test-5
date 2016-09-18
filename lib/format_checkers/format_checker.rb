# A class for checking the format of inputs
class FormatChecker
  def check_format(input)
    /[0-9]\s[0-9]\s[NESW]/.match(input) ? true : false
  end
end
