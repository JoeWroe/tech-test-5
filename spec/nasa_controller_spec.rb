require 'nasa_controller'

describe NasaController do
  subject(:nasa_controller) { described_class.new }

  let(:robotic_rover) { double(:robotic_rover) }

  context 'interaction with a rover' do
    it 'can create a link' do
      nasa_controller.link_to_rover(robotic_rover)
      expect(nasa_controller.current_rover).to eq(robotic_rover)
    end
  end
end
