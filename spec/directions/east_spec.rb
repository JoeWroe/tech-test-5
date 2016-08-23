require 'directions/east'

describe East do
  subject(:east) { described_class.new }

  describe 'returning a string for display purposes' do
    it "can convert the class to 'E'" do
      expect(east.to_s).to eq 'E'
    end
  end
end
