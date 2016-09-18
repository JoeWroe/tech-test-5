require 'errors/app_error'

describe AppError do
  describe 'PlateauSizeError sub-class' do
    let(:error) { PlateauSizeError.new }

    let(:error_message) do
      'No plateau size detected, ' \
      'the input file passed into #parse_input must contain a plateau size, ' \
      "a plateau size must use the format 'Integer Integer'."
    end

    it 'returns a bespoke message' do
      expect(error.message).to eq error_message
    end
  end

  describe 'NoLandCommandError sub-class' do
    let(:error) { NoLandCommandError.new }

    let(:error_message) do
      'No land command detected, ' \
      'the file pased into #parse_input must contain a land command, ' \
      "a land command must use the format 'Integer Integer Cardinal-Direction'."
    end

    it 'returns a bespoke message' do
      expect(error.message).to eq error_message
    end
  end

  describe 'NoMovementCommandError sub-class' do
    let(:error) { NoMovementCommandError.new }

    let(:error_message) do
      'No movement command detected, ' \
      'the file pased into #parse_input must contain a movement command, ' \
      "a movement command contains a string of the letters 'L', 'M' or 'R', " \
      'not seperated by spaces.'
    end

    it 'returns a bespoke message' do
      expect(error.message).to eq error_message
    end
  end

  describe 'NoPlateauCreatedError sub-class' do
    let(:error) { NoPlateauCreatedError.new }

    let(:error_message) do
      'No plateau detected, ' \
      'the app needs knowledge of a plateau to run correctly, ' \
      'please run App#create_plateau.'
    end

    it 'returns a bespoke message' do
      expect(error.message).to eq error_message
    end
  end
end
