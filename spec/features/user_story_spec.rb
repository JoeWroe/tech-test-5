describe 'User Stories' do
  let(:nasa_controller) { NasaController.new }
  let(:robotic_rover)   { RoboticRover.new }
  let(:plateau)         { Plateau.new(plateau_size) }


  describe 'User Story One' do
    it "As a NASA controller,
    So that I can have a robotic rover on a Mars plateau,
    I'd like to be able to land a Mars Rover on the plateau." do
      nasa_controller.link_to_rover(robotic_rover)
      expect(nasa_controller.current_rover).to eq(robotic_rover)
      nasa_controller.land_rover(initial_position)
      expect(plateau.current_rovers).to eq(robotic_rover)
      expect(robotic_rover.position).to eq(initial_position)
    end
  end
end
