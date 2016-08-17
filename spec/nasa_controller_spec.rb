require 'nasa_controller'

describe NasaController do
  subject(:nasa_controller) { described_class.new(plateau: plateau) }

  let(:robotic_rover) { double(:robotic_rover,
                          land_rover: landed_rover,
                          move_forward_on_x: display_move_pos,
                          display_position: display_move_pos) }
  let(:plateau)       { double(:plateau,
                          one_rover_landed: landed_rover) }

  let(:landed_rover)     { [:landed_rover] }
  let(:display_move_pos) { "Rovers position: 1 0 N" }

  let(:start_position)    { '0 0 N' }
  let(:movement_commands) { 'M' }

  describe 'interacting with a rover' do
    before { nasa_controller.link_to_rover(robotic_rover) }

    it 'can create a link' do
      expect(nasa_controller.current_rover).to eq robotic_rover
    end

    it 'can land a rover' do
      expect(nasa_controller.land_rover(start_position)).to eq plateau.one_rover_landed
    end

    it 'can read a command input' do
      expect(nasa_controller.command_input(movement_commands)).to eq display_move_pos
    end
  end
end
