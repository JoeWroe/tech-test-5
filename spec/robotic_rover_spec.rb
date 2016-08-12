require 'robotic_rover'

describe RoboticRover do
  subject(:robotic_rover) { described_class.new }

  let(:plateau) { double(:plateau, size: '5 5', current_rovers: []) }

  context 'landing' do
    it 'can land' do
      robotic_rover.land_rover(plateau)
      expect(plateau.current_rovers).to eq([robotic_rover])
    end
  end

  context 'navigation system' do
    it 'starts inactive' do
      expect(robotic_rover.nav_grid_active).to eq false
    end

    it 'is turned on at landing' do
      robotic_rover.land_rover(plateau)
      expect(robotic_rover.nav_grid_active).to eq true
    end

    it 'maps the plateau' do
      robotic_rover.land_rover(plateau)
      expect(robotic_rover.nav_grid.grid_size).not_to eq nil
    end
  end
end
