require 'directions/north'

describe North do
  subject(:north) { described_class.new }

  describe 'returning a string for display purposes' do
    it "can convert the class to 'N'" do
      expect(north.to_s).to eq 'N'
    end
  end
end
