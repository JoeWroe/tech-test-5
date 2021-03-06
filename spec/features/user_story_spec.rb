describe 'User Stories' do
  let(:nasa_controller) { NasaController.new(plateau: plateau) }
  let(:robotic_rover)   { RoboticRover.new }
  let(:plateau)         { Plateau.new(plateau_size) }

  let(:empty_instance_var)  { [] }
  let(:plateau_size)        { '5 5' }
  let(:start_pos)           { '0 0 N' }
  let(:right_360)           { 'RRRR' }
  let(:left_360)            { 'LLLL' }
  let(:commands)            { 'MRMRMRMR' }
  let(:display_start_pos)   { 'Rovers position: 0 0 N' }

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
      expect(robotic_rover.camera.direction).to be_instance_of North
      robotic_rover.camera.rotate_right
      expect(robotic_rover.camera.direction).to be_instance_of East
      robotic_rover.camera.rotate_left
      expect(robotic_rover.camera.direction).to be_instance_of North
    end
  end

  describe 'User Story Four' do
    it "As a NASA controller,
    So that I know whereabouts on the plateau the rover is,
    I'd like the rover to have two co-ordinates and a cardinal heading." do
      expect(robotic_rover.display_position).to eq display_start_pos
    end
  end

  describe 'User Story Five' do
    it "As a NASA controller,
    So that I can rotate the rover,
    I'd like to send a simple string of letters which rotate it." do
      expect(nasa_controller.command_input(right_360)).to eq display_start_pos
      expect(nasa_controller.command_input(left_360)).to eq display_start_pos
    end
  end

  describe 'User Story Six' do
    it "As a NASA controller,
    So that I can advance the rover,
    I'd like to send it a simple string of letters which move it forward." do
      expect(nasa_controller.command_input(commands)).to eq display_start_pos
    end
  end
end
