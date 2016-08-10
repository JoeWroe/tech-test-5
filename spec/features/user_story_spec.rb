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
      expect(nasa_controller.current_rover).to eq(robotic_rover)
      nasa_controller.land_rover(start_position)
      expect(plateau.current_rovers).to eq([robotic_rover])
    end
  end
end
