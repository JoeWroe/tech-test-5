require 'directions/west'

describe West do
  subject(:west) { described_class.new }

  describe 'returning a string for display purposes' do
    it "can convert the class to 'W'" do
      expect(west.to_s).to eq 'W'
    end
  end

end