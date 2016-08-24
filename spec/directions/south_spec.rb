require 'directions/south'

describe South do
  subject(:south) { described_class.new }

  describe 'returning a string for display purposes' do
    it "can convert the class to 'S'" do
      expect(south.to_s).to eq 'S'
    end
  end

  describe 'changing direction' do
    it 'returns West with a #right_turn' do
      expect(south.right_turn).to be_an_instance_of West
    end

    it 'returns East with a #left_turn' do
      expect(south.left_turn).to be_an_instance_of East
    end
  end

  describe 'moving forward' do
    it 'returns an array of the coord change' do
      expect(south.move).to eq [0, -1]
    end
  end
end
