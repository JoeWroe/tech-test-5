require 'nav_grid'

describe NavGrid do
  subject(:nav_grid) { described_class.new('5 5') }

  context 'on initialization' do
    it 'has a size' do
      expect(nav_grid.grid_size).to
    end
  end
end
