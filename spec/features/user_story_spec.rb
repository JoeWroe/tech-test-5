describe 'User Stories' do
  let(:nasa_controller) { NasaController.new(plateau: plateau) }
  let(:robotic_rover)   { RoboticRover.new }
  let(:plateau)         { Plateau.new(plateau_size) }

  let(:start_position) { '0 0 N' }
  let(:plateau_size)   { '5 5' }

  describe 'User Story One' do
    it "As a NASA controller,
    So that I can have a robotic rover on a Mars plateau,
    I'd like to be able to land a Mars Rover on the plateau." do
      nasa_controller.link_to_rover(robotic_rover)
      expect(nasa_controller.current_rover).to eq robotic_rover
      expect(nasa_controller.land_rover).to eq [robotic_rover]
    end
  end

  describe 'User Story Two' do
    it "As a NASA controller,
    So that I can navigate a plateau,
    I'd like a navigation system with a Mars Rover." do
      nasa_controller.link_to_rover(robotic_rover)
      expect(robotic_rover.nav_grid_active).to eq false
      nasa_controller.land_rover
      expect(robotic_rover.nav_grid_active).to eq true
      expect(robotic_rover.nav_grid_size).to eq plateau_size
      expect(robotic_rover.position).to eq start_position
    end
  end
end
