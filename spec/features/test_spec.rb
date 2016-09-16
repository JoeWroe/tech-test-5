require './app'

describe App do
  subject(:app) { described_class.new(interpreter) }

  let(:interpreter)    { InputInterpreter.new }
  let(:input_file)     { './input/test_input.txt' }
  let(:bad_input_file) { './input/bad_input.txt' }

  describe 'Interpreting a plateau size command' do
    it "should read an input of '5 5' and create a plateau of size of [5, 5]" do
      app.parse_file(input_file)
      app.create_plateau
      expect(app.plateau.size).to eq [5, 5]
    end

    it "should raise an error if no plateau size is provided" do
      app.parse_file(bad_input_file)
      expect { app.create_plateau }.to raise_error PlateauSizeError
    end

    it "should raise an error if no file has been parsed" do
      expect { app.create_plateau }.to raise_error NoInputError
    end
  end

  xdescribe 'Interpreting a land rover command' do
    it 'should read an input and create a rover for each land command' do
      app.parse_file(input_file)
      app.create_rover_list
      expect(app.rover_list).to include(RoboticRover, RoboticRover)
    end
  end
end
