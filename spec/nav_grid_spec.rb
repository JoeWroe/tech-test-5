require 'nav_grid'

describe NavGrid do
  subject(:nav_grid) { described_class.new('5 5') }

  context 'on initialization' do
    it 'has an x-axis' do
      expect(nav_grid.x_axis_limit).to eq 5
    end

    it 'has a y-axis' do
      expect(nav_grid.y_axis_limit).to eq 5
    end

    it 'has a size' do
      expect(nav_grid.grid_size).to eq [5, 5]
    end
  end
end
