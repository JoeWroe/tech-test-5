require 'nav_grid'

describe NavGrid do
  subject(:nav_grid) { described_class.new(location_size) }

  let(:location_size) { '5 5' }

  describe 'initialization' do
    it 'sets an x-coord' do
      expect(nav_grid.x_coord).to eq 0
    end

    it 'sets a y-coord' do
      expect(nav_grid.y_coord).to eq 0
    end
  end
end
