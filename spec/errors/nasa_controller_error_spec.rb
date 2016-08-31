require 'errors/nasa_controller_error'

describe NasaControllerError do
  let(:rover_link_error) { RoverLinkError.new }

  describe 'RoverLinkError sub-......' do
    let(:error_message) do
      'Incorrect argument error, ' \
      'the argument passed into this method needs to be of a specific class, ' \
      'please link to an instance of the RoboticRover class.'
    end

    it 'returns a bespoke message' do
      expect(rover_link_error.message).to eq error_message
    end
  end
end
