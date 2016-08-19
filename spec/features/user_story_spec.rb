describe 'User Stories' do
  let(:nasa_controller) { NasaController.new(plateau: plateau) }
  let(:robotic_rover)   { RoboticRover.new }
  let(:plateau)         { Plateau.new(plateau_size) }

  let(:start_position)    { '0 0 N' }
  let(:plateau_size)      { '5 5' }
  let(:nav_grid_size)     { [5, 5] }
  let(:movement_commands) { 'M' }
  let(:display_start_pos) { 'Rovers position: 0 0 N' }
  let(:display_move_pos)  { 'Rovers position: 1 0 N' }

  describe 'User Story One' do
    it "As a NASA controller,
    So that I can have a robotic rover on a Mars plateau,
    I'd like to be able to land a Mars Rover on the plateau." do
      nasa_controller.link_to_rover(robotic_rover)
      expect(nasa_controller.current_rover).to eq robotic_rover
      nasa_controller.land_rover(start_position)
      expect(plateau.current_rovers).to eq [robotic_rover]
    end
  end

  describe 'User Story Two' do
    it "As a NASA controller,
    So that I can navigate a plateau,
    I'd like a navigation system with a Mars Rover." do
      nasa_controller.link_to_rover(robotic_rover)
      expect(robotic_rover.nav_grid_active).to eq false
      nasa_controller.land_rover(start_position)
      expect(robotic_rover.nav_grid_active).to eq true
      expect(robotic_rover.nav_grid.grid_size).to eq nav_grid_size
      expect(robotic_rover.display_position).to eq display_start_pos
    end
  end

  describe 'User Story Three' do
    it "As a NASA controller,
    So that I can send a complete view of the terrain back to earth,
    I'd like to control the on-board camera." do
      nasa_controller.link_to_rover(robotic_rover)
      nasa_controller.land_rover(start_position)
      expect(robotic_rover.camera.recording).to eq true
    end
  end

  describe 'User Story Four' do
    it "As a NASA controller,
    So that I know whereabouts on the plateau the rover is,
    I'd like the rover to have a position made up of two co-ordinates and a cardinal compass point." do
      nasa_controller.link_to_rover(robotic_rover)
      nasa_controller.land_rover(start_position)
      expect(robotic_rover.display_position).to eq display_start_pos
    end
  end

  describe 'User Story Five' do
    it "As a NASA controller,
    So that I can control the rover,
    I'd like to send it a simple string of letters which alter it's position." do
      nasa_controller.link_to_rover(robotic_rover)
      nasa_controller.land_rover(start_position)
      expect(nasa_controller.command_input(movement_commands)).to eq display_move_pos
      # expect(robotic_rover.display_position).to eq position_after_move
    end
  end
end
