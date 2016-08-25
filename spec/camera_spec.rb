require 'camera'

describe Camera do
  subject(:camera) { described_class.new(north) }

  let(:north) { double(:north) }

  describe 'initialization' do
    it 'is not recording' do
      expect(camera.recording).to eq false
    end

    it 'has a direction' do
      expect(camera.direction).to eq north
    end
  end

  context 'recording' do
    it 'can be turned on' do
      camera.toggle_recording
      expect(camera.recording).to eq true
    end
  end
end
