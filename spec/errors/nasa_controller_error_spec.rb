require 'errors/nasa_controller_error'

describe NasaControllerError do
  describe 'RoverLinkError sub-class' do
    let(:error) { RoverLinkError.new }

    let(:error_message) do
      'Incorrect argument error, ' \
      'the argument passed into this method needs to be of a specific class, ' \
      'please link to an instance of the RoboticRover class.'
    end

    it 'returns a bespoke message' do
      expect(error.message).to eq error_message
    end
  end

  describe 'NoRoverLinkedError sub-class' do
    let(:error) { NoRoverLinkedError.new }

    let(:error_message) do
      'NasaController is currently not linked to a rover, ' \
      'to proceed with this command, please link to a RoboticRover. ' \
      'Run #link_to_rover(robotic_rover) to do so.'
    end

    it 'returns a bespoke message' do
      expect(error.message).to eq error_message
    end
  end

  describe 'LandInputError sub-class' do
    let(:error) { LandInputError.new }

    let(:error_message) do
      'NasaController can not land a rover using the given start position. ' \
      'Please use a position which the rover can understand, ' \
      'positions have to be made up of two integers ' \
      'followed by a cardinal compass direction.'
    end

    it 'returns a bespoke message' do
      expect(error.message).to eq error_message
    end
  end

  describe 'NoRoverLandedError sub-class' do
    let(:error) { NoRoverLandedError.new }

    let(:error_message) do
      'The current rover is not landed, ' \
      'this command must be run on a landed rover, ' \
      'please run RoboticRover#land_rover(start_coords, location).'
    end

    it 'returns a bespoke message' do
      expect(error.message).to eq error_message
    end
  end
end
