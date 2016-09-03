require 'errors/nasa_controller_error'

describe NasaControllerError do
  let(:rover_link_error) { RoverLinkError.new }
  let(:no_rover_linked_error) { NoRoverLinkedError.new }
  let(:land_input_error) { LandInputError.new }

  describe 'RoverLinkError sub-......' do
    let(:rover_link_error_message) do
      'Incorrect argument error, ' \
      'the argument passed into this method needs to be of a specific class, ' \
      'please link to an instance of the RoboticRover class.'
    end

    it 'returns a bespoke message' do
      expect(rover_link_error.message).to eq rover_link_error_message
    end
  end

  describe 'NoRoverLinkedError sub-......' do
    let(:no_rover_linked_error_message) do
      'NasaController is currently not linked to a rover, ' \
      'to proceed with this command, please link to a RoboticRover. ' \
      'Run #link_to_rover(*any RoboticRover*) to do so.'
    end

    it 'returns a bespoke message' do
      expect(no_rover_linked_error.message).to eq no_rover_linked_error_message
    end
  end

  describe 'LandInputError' do
    let(:land_input_error_message) do
      'NasaController can not land a rover using the given start position. ' \
      'Please use a position which the rover can understand, ' \
      'positions have to be made up of two integers ' \
      'followed by a cardinal compass direction.'
    end

    it 'returns a bespoke message' do
      expect(land_input_error.message).to eq land_input_error_message
    end
  end
end
