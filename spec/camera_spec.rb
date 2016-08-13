require 'camera'

describe Camera do
  subject(:camera) { described_class.new }

  context 'on initialization' do
    it 'can record but is not' do
      expect(camera.recording).to eq false
    end
  end

  context 'recording' do
    it 'can be turned on' do
      camera.toggle_recording
      expect(camera.recording).to eq true
    end
  end
end
