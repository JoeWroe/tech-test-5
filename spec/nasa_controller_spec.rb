require 'nasa_controller'

describe NasaController do
  let(:name) { 'Rouge Leader' }

  describe 'creating required objects' do
    it 'when linked, a rover is created' do
      expect(subject.link_to_rover(name)).to be_an_instance_of MarsRover
    end
  end
end
