require 'directions/east'

describe East do
  subject(:east) { described_class.new }

  describe 'returning a string for display purposes' do
    it "can convert the class to 'E'" do
      expect(east.to_s).to eq 'E'
    end
  end

  describe 'changing direction' do
    it 'returns South with a #right_turn' do
      expect(east.right_turn).to be_an_instance_of South
    end

    it 'returns West with a #left_turn' do
      expect(east.left_turn).to be_an_instance_of North
    end
  end
end
