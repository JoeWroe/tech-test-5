require 'input_interpreter'

describe InputInterpreter do
  subject(:interpreter) { described_class.new }

  let(:input_file)      { './input/test_input.txt' }
  let(:bad_input_file)  { './input/bad_input.txt' }
  let(:inputs_array)    { ['5 5', '1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM'] }
  let(:landings_array)  { ['1 2 N', '3 3 E'] }
  let(:movements_array) { %w(LMLMLMLMM MMRMMRMRRM) }

  describe 'obtaining input' do
    it 'can read an input file' do
      interpreter.parse_input(input_file)
      expect(interpreter.input_strings).to eq inputs_array
    end
  end

  describe 'identifying input' do
    it 'can identify a plateau size command' do
      interpreter.parse_input(input_file)
      expect(interpreter.find_plateau_size).to eq '5 5'
    end

    it 'returns an empty string if no plateau size command is given' do
      interpreter.parse_input(bad_input_file)
      expect(interpreter.find_plateau_size).to eq ''
    end

    it 'can identify a land command' do
      interpreter.parse_input(input_file)
      expect(interpreter.find_rover_landings).to eq landings_array
    end

    it 'returns an empty array if no land commands are given' do
      interpreter.parse_input(bad_input_file)
      expect(interpreter.find_rover_landings).to eq []
    end

    it 'can identify a movement command' do
      interpreter.parse_input(input_file)
      expect(interpreter.find_rover_movements).to eq movements_array
    end

    it 'returns an empty array if no movement commands are given' do
      interpreter.parse_input(bad_input_file)
      expect(interpreter.find_rover_movements).to eq []
    end
  end
end
