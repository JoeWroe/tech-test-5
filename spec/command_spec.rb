require 'command'

describe Command do
  subject(:command) { described_class.new(input, robotic_rover) }

  let(:robotic_rover) do
    double(:robotic_rover, position: '0 0 N',
                           move: '0 1 N',
                           right_turn: '0 0 E',
                           left_turn: '0 0 W')
  end

  describe 'advance command' do
    let(:input) { 'M' }

    describe 'initialization' do
      it 'alters a rovers position' do
        expect(command.position_change).to eq robotic_rover.move
      end
    end
  end

  describe 'right command' do
    let(:input) { 'R' }

    describe 'initialization' do
      it 'alters a rovers direction' do
        expect(command.position_change).to eq robotic_rover.right_turn
      end
    end
  end

  describe 'left command' do
      let(:input) { 'L' }

    describe 'initialization' do
      it 'alters the rovers direction' do
        expect(command.position_change).to eq robotic_rover.left_turn
      end
    end
  end
end
