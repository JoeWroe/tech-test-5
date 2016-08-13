require 'nasa_controller'

describe NasaController do
  subject(:nasa_controller) { described_class.new(plateau: plateau) }

  let(:robotic_rover) { double(:robotic_rover, land_rover: landed_rover) }
  let(:plateau)       { double(:plateau, current_rovers: []) }

  let(:landed_rover) { [:landed_rover] }

  let(:start_position) { '0 0 N' }

  context 'on initialization' do
    it 'has a plateau' do
      expect(nasa_controller.plateau).to eq plateau
    end
  end

  context 'interacting with a rover' do
    it 'can create a link' do
      nasa_controller.link_to_rover(robotic_rover)
      expect(nasa_controller.current_rover).to eq robotic_rover
    end

    it 'can land a rover' do
      nasa_controller.link_to_rover(robotic_rover)
      expect(nasa_controller.land_rover(start_position)).to eq landed_rover
    end
  end
end
