require 'mars_rover'

describe MarsRover do
  subject(:mars_rover) { described_class.new('Rouge Leader') }

  describe 'on initialization' do
    it 'should start with a name' do
      expect(mars_rover.name).to eq('Rouge Leader')
    end
  end
end
