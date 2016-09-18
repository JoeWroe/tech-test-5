require 'nav_grid'

describe NavGrid do
  subject(:nav_grid) { described_class.new(start_coords, plateau) }

  let(:plateau) { double(:plateau, size: [5, 5]) }

  let(:start_coords) { '0 0 N' }

  describe 'initialization' do
    it 'has a location' do
      expect(nav_grid.location).to eq plateau
    end

    it 'sets an x-coord' do
      expect(nav_grid.x_coord).to eq 0
    end

    it 'sets a y-coord' do
      expect(nav_grid.y_coord).to eq 0
    end

    it 'sets a direction' do
      expect(nav_grid.direction).to be_a Direction
    end
  end

  describe 'movement' do
    it 'can increase #y_coord when facing north' do
      nav_grid.move
      expect(nav_grid.y_coord).to eq 1
    end

    it 'can increase #x_coord when facing east' do
      nav_grid.right_turn
      nav_grid.move
      expect(nav_grid.x_coord).to eq 1
    end

    it 'can decrease #y_coord when facing south' do
      nav_grid.right_turn
      nav_grid.right_turn
      nav_grid.move
      expect(nav_grid.y_coord).to eq -1
    end

    it 'can decrease #x_coord when facing west' do
      nav_grid.left_turn
      nav_grid.move
      expect(nav_grid.x_coord).to eq -1
    end
  end

  describe 'direction' do
    context 'North' do
      it 'can create a direction class' do
        expect(nav_grid.direction).to be_instance_of North
      end
    end

    context 'East' do
      let(:start_coords) { '0 0 E' }

      it 'can create a direction class' do
        expect(nav_grid.direction).to be_instance_of East
      end
    end

    context 'South' do
      let(:start_coords) { '0 0 S' }

      it 'can create a direction class' do
        expect(nav_grid.direction).to be_instance_of South
      end
    end

    context 'West' do
      let(:start_coords) { '0 0 W' }

      it 'can create a direction class' do
        expect(nav_grid.direction).to be_instance_of West
      end
    end

    it 'can be changed with a right turn' do
      nav_grid.right_turn
      expect(nav_grid.direction).to be_instance_of East
    end

    it 'can be changed with a left_turn' do
      nav_grid.left_turn
      expect(nav_grid.direction).to be_instance_of West
    end
  end
end
