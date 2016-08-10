require 'robotic_rover'

describe RoboticRover do
  subject(:robotic_rover) { described_class.new }

  let(:plateau) { double(:plateau, current_rovers: []) }

  context 'landing' do
    it 'can land' do
      robotic_rover.land_rover(plateau)
      expect(plateau.current_rovers).to eq([robotic_rover])
    end
  end
end
