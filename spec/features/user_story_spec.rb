describe 'User Stories' do
  let(:name) { 'Rouge Leader' }

  describe 'User Story One' do
    it "As a NASA controller,
    So that I can have a robotic rover on a Mars plateau,
    I'd like to be able to land a Mars Rover on the plateau." do
      nasa_controller = NasaController.new
      nasa_controller.link_to_rover(name)
      nasa_controller.land_rover(plateau, '5 5', '0 0 N')
      expect(nasa_controller.current_rover).to eq(name)
      expect(plateau.size?).to eq('5, 5')
      expect(plateau.current_rovers).to eq(name)
      expect(mars_rover(name).position).to eq('0, 0, N')
    end
  end
end
