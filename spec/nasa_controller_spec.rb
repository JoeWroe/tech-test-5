require 'nasa_controller'

describe NasaController do
  subject(:controller) { described_class.new(plateau: plateau) }

  let(:robotic_rover) do
    double(:robotic_rover, land_rover: landed_rover,
                           move_forward_on_x: display_move,
                           display_position: display_move)
  end

  let(:plateau) { double(:plateau, rover_landed: landed_rover) }

  let(:landed_rover) { [:landed_rover] }
  let(:display_move) { 'Rovers position: 1 0 N' }

  let(:start_pos)    { '0 0 N' }
  let(:move_command) { 'M' }

  describe 'interacting with a rover' do
    before { controller.link_to_rover(robotic_rover) }

    it 'can create a link' do
      expect(controller.current_rover).to eq robotic_rover
    end

    it 'can land a rover' do
      expect(controller.land_rover(start_pos)).to eq plateau.rover_landed
    end

    it 'can read a command input' do
      expect(controller.command_input(move_command)).to eq display_move
    end
  end
end
