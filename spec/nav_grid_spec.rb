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
      expect(nav_grid.direction).to eq 'N'
    end
  end

  describe 'movement' do
    it 'can increase #x_coord when facing north' do
      nav_grid.move
      expect(nav_grid.y_coord).to eq 1
    end
  end

  describe 'direction' do
    it 'can be changed with a right turn' do
      nav_grid.right_turn
      expect(nav_grid.direction).to eq 'E'
    end
  end
end
