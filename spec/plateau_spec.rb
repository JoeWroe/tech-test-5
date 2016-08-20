require 'plateau'

describe Plateau do
  subject(:plateau) { described_class.new(plateau_size) }

  let(:empty_instance_var) { [] }
  let(:plateau_size) { '5 5' }

  describe 'initialization' do
    it 'has an x-limit' do
      expect(plateau.x_limit).to eq 5
    end

    it 'has a y-limit' do
      expect(plateau.y_limit).to eq 5
    end

    it 'has a size attribute' do
      expect(plateau.size).to eq [5, 5]
    end

    it 'contains no rovers' do
      expect(plateau.current_rovers).to eq empty_instance_var
    end
  end
end
