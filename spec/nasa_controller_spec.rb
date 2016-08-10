require 'nasa_controller'

describe NasaController do
  subject(:nasa_controller) { described_class.new }

  let(:robotic_rover) { double(:robotic_rover) }

  let(:start_position) { '0 0 N' }

  context 'interacting with a rover' do
    it 'can create a link' do
      nasa_controller.link_to_rover(robotic_rover)
      expect(nasa_controller.current_rover).to eq(robotic_rover)
    end

    it 'can land a rover' do
      nasa_controller.link_to_rover(robotic_rover)
      expect(nasa_controller.land_rover(start_position)).to eq(start_position)
    end
  end
end
