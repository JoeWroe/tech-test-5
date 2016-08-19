require 'plateau'

describe Plateau do
  subject(:plateau) { described_class.new(plateau_size) }

  let(:empty_instance_var) { [] }
  let(:plateau_size) { '5 5' }

  describe 'initialization' do
    it 'size is set' do
      expect(plateau.size).to eq plateau_size
    end

    it 'contains no rovers' do
      expect(plateau.current_rovers).to eq empty_instance_var
    end
  end
end
