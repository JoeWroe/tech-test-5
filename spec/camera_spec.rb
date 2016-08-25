require 'camera'

describe Camera do
  subject(:camera) { described_class.new(north) }

  let(:north) do
    double(:north, right_turn: east,
                   left_turn: west)
  end

  let(:east) { double(:east) }
  let(:west) { double(:west) }

  describe 'initialization' do
    it 'is not recording' do
      expect(camera.recording).to eq false
    end

    it 'has a direction' do
      expect(camera.direction).to eq north
    end
  end

  describe 'recording' do
    it 'can be turned on' do
      camera.toggle_recording
      expect(camera.recording).to eq true
    end
  end

  describe 'rotating' do
    it 'can rotate right' do
      camera.rotate_right
      expect(camera.direction).to eq east
    end

    it 'can rotate left' do
      camera.rotate_left
      expect(camera.direction).to eq west
    end
  end
end
