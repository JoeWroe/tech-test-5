require 'format_checkers/format_checker'

describe FormatChecker do
  subject(:format_checker) { described_class.new }

  let(:correct_input)   { '1 2 N' }
  let(:incorrect_input) { 'N£ 9 ' }

  describe 'checking a format' do
    it "returns true if a format is 'Integer Integer Direction'" do
      expect(format_checker.check_format(correct_input)).to eq true
    end

    it "returns false if a format is not 'Integer Integer Direction'" do
      expect(format_checker.check_format(incorrect_input)).to eq false
    end
  end
end
