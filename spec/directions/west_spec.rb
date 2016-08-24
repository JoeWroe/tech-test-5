require 'directions/west'

describe West do
  subject(:west) { described_class.new }

  describe 'returning a string for display purposes' do
    it "can convert the class to 'W'" do
      expect(west.to_s).to eq 'W'
    end
  end

  describe 'changing direction' do
    it 'returns North with a #right_turn' do
      expect(west.right_turn).to be_an_instance_of North
    end

    it 'returns South with a #left_turn' do
      expect(west.left_turn).to be_an_instance_of South
    end
  end
end
