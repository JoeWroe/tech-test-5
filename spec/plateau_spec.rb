require 'plateau'

describe Plateau do
  subject(:plateau) { described_class.new(plateau_size) }

  let(:plateau_size) { '5 5' }

  context 'on initialization' do
    it 'has a size proprty' do
      expect(plateau.size).to eq('5 5')
    end

    it 'contains no rovers' do
      expect(plateau.current_rovers).to eq([])
    end
  end
end
