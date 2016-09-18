require './app'

describe App do
  subject(:app) { described_class.new(interpreter) }

  let(:controller)     { NasaController.new }
  let(:interpreter)    { InputInterpreter.new }
  let(:input_file)     { './input/test_input.txt' }
  let(:bad_input_file) { './input/bad_input.txt' }

  let(:correct_run_rover_output) do
    "Rovers position: 1 3 N\nRovers position: 5 1 E\n"
  end

  describe 'initialization' do
    it 'should initialize with an input interpreter' do
      expect(app.interpreter).to be_instance_of InputInterpreter
    end
  end

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
  end

  describe 'creating a controller' do
    it 'can create a controller' do
      app.parse_file(input_file)
      app.create_plateau
      app.create_controller
      expect(app.controller).to be_instance_of NasaController
    end

    it 'can raise an error if no plateau has been created' do
      expect { app.create_controller }.to raise_error NoPlateauCreatedError
    end
  end

  describe 'Interpreting a land rover command' do
    it 'should read an input and create a rover for each land command' do
      app.parse_file(input_file)
      app.create_rover_list
      expect(app.rover_list).to include(RoboticRover, RoboticRover)
    end

    it 'should raise an error if no land commands are provided' do
      app.parse_file(bad_input_file)
      expect { app.create_rover_list }.to raise_error NoLandCommandError
    end
  end

  describe 'Running rovers' do
    it 'should link to each rover, land it and run the move commands' do
      app.parse_file(input_file)
      app.create_plateau
      app.create_controller
      app.create_rover_list
      expect { app.run_rovers }.to output(correct_run_rover_output).to_stdout
    end
  end
end
