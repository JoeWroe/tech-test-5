require 'nasa_controller'

describe NasaController do
  subject(:controller) { described_class.new(plateau: plateau) }

  let(:robotic_rover) do
    double(:robotic_rover, is_a?: RoboticRover,
                           position: [],
                           land_rover: landed_rover,
                           move: display_move,
                           display_position: display_move)
  end

  let(:plateau) do
    double(:plateau, rover_landed: landed_rover,
                     current_rovers: [robotic_rover])
  end

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
      controller.land_rover(start_pos)
      expect(controller.command_input(move_command)).to eq display_move
    end
  end

  describe 'raises an exception if' do
    it 'linked to something other than a rover' do
      expect { controller.link_to_rover(plateau) }.to raise_error RoverLinkError
    end

    it 'not linked to a rover' do
      expect { controller.land_rover("") }.to raise_error NoRoverLinkedError
    end

    it 'raises an exception if start position input is in the wrong format' do
      controller.link_to_rover(robotic_rover)
      expect { controller.land_rover("") }.to raise_error LandInputError
    end
  end
end
