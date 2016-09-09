require 'input_interpreter'

describe InputInterpreter do
  subject(:input_interpreter) { described_class.new }

  let(:input_file)      { './input/test_input.txt' }
  let(:array_of_inputs) { ['5 5', '1 2 N', 'LMLMLMLMM', '3 3 E', 'MMRMMRMRRM'] }

  describe 'obtaining input' do
    it 'can read an input file' do
      input_interpreter.parse_input(input_file)
      expect(input_interpreter.input_strings).to eq array_of_inputs
    end
  end
end
