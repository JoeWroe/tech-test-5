describe 'User Stories' do

  describe 'User Story One' do
    
    it "As a NASA controller,
    So that I can have a robotic rover on a Mars plateau,
    I'd like to be able to land a Mars Rover on the plateau." do
      nasaController = NasaController.new
      nasaController.linkToRover
      nasaController.landRover(plateau, '5 5')

    end
  end
end
