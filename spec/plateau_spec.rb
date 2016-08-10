require 'plateau'

describe Plateau do
  subject(:plateau) { described_class.new(plateau_size) }

  let(:plateau_size) { '5 5' }

  context 'on initialization' do
    it 'has maximum size along X axis' do
      expect(plateau.x_axis_limit).to eq(5)
    end

    it 'has maximum size along Y axis' do
      expect(plateau.y_axis_limit).to eq(5)
    end

    it 'contains no rovers' do
      expect(plateau.current_rovers).to eq([])
    end
  end
end
