require 'directions/north'

describe North do
  subject(:north) { described_class.new }

  describe 'returning a string for display purposes' do
    it "can convert the class to 'N'" do
      expect(north.to_s).to eq 'N'
    end
  end

  describe 'changing direction' do
    it 'returns East with a #right_turn' do
      expect(north.right_turn).to be_an_instance_of East
    end

    it 'returns West with a #left_turn' do
      expect(north.left_turn).to be_an_instance_of West
    end
  end
end
