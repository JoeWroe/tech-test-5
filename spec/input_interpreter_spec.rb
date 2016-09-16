require 'input_interpreter'

describe InputInterpreter do
  subject(:interpreter) { described_class.new }

  let(:input_file)      { './input/test_input.txt' }
  let(:bad_input_file)  { './input/bad_input.txt' }
  let(:array_of_inputs) { ['5 5', '1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM'] }

  describe 'obtaining input' do
    it 'can read an input file' do
      interpreter.parse_input(input_file)
      expect(interpreter.input_strings).to eq array_of_inputs
    end
  end

  describe 'identifying input' do
    it 'can identify a plateau size command' do
      interpreter.parse_input(input_file)
      expect(interpreter.find_plateau_size).to eq '5 5'
    end

    it 'can raise false if no plateau size command is given' do
      interpreter.parse_input(bad_input_file)
      expect(interpreter.find_plateau_size).to eq false
    end
  end

  xdescribe 'identifying when new rovers are required' do
    it 'can identify a land command' do
      interpreter.parse_input(input_file)
      expect(interpreter.find_rovers).to eq RoboticRover
    end
  end
end
