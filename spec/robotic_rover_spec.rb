require 'robotic_rover'

describe RoboticRover do
  subject(:rover) { described_class.new }

  let(:plateau) do
    double(:plateau, size: '5 5',
                     current_rovers: [])
  end

  let(:empty_instance_var) { [] }
  let(:landed_rover)       { [rover] }
  let(:start_pos)          { '0 0 N' }
  let(:display_start_pos)  { 'Rovers position: 0 0 N' }

  context 'before landing' do
    it 'has not created NavGrid' do
      expect(rover.nav_grid).to eq empty_instance_var
    end

    it 'has not created Camera' do
      expect(rover.camera).to eq empty_instance_var
    end
  end

  context 'after landing' do
    before { rover.land_rover(start_pos, plateau) }

    it 'adds it to the plateau' do
      expect(plateau.current_rovers).to eq landed_rover
    end

    describe 'camera' do
      it 'is created' do
        expect(rover.camera).not_to eq empty_instance_var
      end

      it 'turns on' do
        expect(rover.camera.recording).to eq true
      end
    end

    describe 'navigation system' do
      it 'is created' do
        expect(rover.nav_grid).not_to eq empty_instance_var
      end
    end

    describe 'position' do
      it 'is set' do
        expect(rover.position[0]).to eq 0
        expect(rover.position[1]).to eq 0
        expect(rover.position[2]).to be_instance_of North
      end

      it 'can be displayed' do
        expect(rover.display_position).to eq display_start_pos
      end

      it 'can be increased by 1 in the direction faced' do
        rover.move
        expect(rover.position[1]).to eq 1
      end

      describe 'direction' do
        it 'can change with a right_turn' do
          rover.right_turn
          expect(rover.position).to include an_instance_of East
        end

        it 'can change with a left turn' do
          rover.left_turn
          expect(rover.position).to include an_instance_of West
        end
      end
    end
  end
end
