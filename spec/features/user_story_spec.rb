describe 'User Stories' do
  let(:nasa_controller) { NasaController.new(plateau: plateau) }
  let(:robotic_rover)   { RoboticRover.new }
  let(:plateau)         { Plateau.new(plateau_size) }

  let(:empty_instance_var)  { [] }
  let(:plateau_size)        { '5 5' }
  let(:start_pos)           { '0 0 N' }
  let(:right_turn)          { 'R' }
  let(:left_turn)           { 'L' }
  let(:move_commands)       { 'M' }
  let(:display_start_pos)   { 'Rovers position: 0 0 N' }
  let(:display_right_move)  { 'Rovers position: 0 0 E' }
  let(:display_advance_pos) { 'Rovers position: 0 1 N' }

  before do
    nasa_controller.link_to_rover(robotic_rover)
    nasa_controller.land_rover(start_pos)
  end

  describe 'User Story One' do
    it "As a NASA controller,
    So that I can have a robotic rover on a Mars plateau,
    I'd like to be able to land a Mars Rover on the plateau." do
      expect(nasa_controller.current_rover).to eq robotic_rover
      expect(plateau.current_rovers).to eq [robotic_rover]
    end
  end

  describe 'User Story Two' do
    it "As a NASA controller,
    So that I can navigate a plateau,
    I'd like a navigation system with a Mars Rover." do
      expect(robotic_rover.nav_grid).not_to eq empty_instance_var
      expect(robotic_rover.display_position).to eq display_start_pos
    end
  end

  describe 'User Story Three' do
    it "As a NASA controller,
    So that I can send a complete view of the terrain back to earth,
    I'd like to control the on-board camera." do
      expect(robotic_rover.camera.recording).to eq true
    end
  end

  describe 'User Story Four' do
    it "As a NASA controller,
    So that I know whereabouts on the plateau the rover is,
    I'd like the rover to have a position made up of two co-ordinates and a cardinal compass point." do
      expect(robotic_rover.display_position).to eq display_start_pos
    end
  end

  describe 'User Story Five' do
    it "As a NASA controller,
    So that I can rotate the rover,
    I'd like to send a simple string of letters which rotate it." do
      expect(nasa_controller.command_input(right_turn)).to eq display_right_move
      expect(nasa_controller.command_input(left_turn)).to eq display_start_pos
    end
  end

  describe 'User Story Six' do
    it "As a NASA controller,
    So that I can advance the rover,
    I'd like to send it a simple string of letters which move it forward." do
      expect(nasa_controller.command_input(move_commands)).to eq display_advance_pos
    end
  end
end
