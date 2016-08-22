require 'command'

describe Command do
  subject(:command) { described_class.new(input, robotic_rover) }

  let(:robotic_rover) do
    double(:robotic_rover, position: '0 0 N',
                           move: '0 1 N',
                           right_turn: '0 0 E')
  end

  context 'advance command' do
    let(:input) { 'M' }

    describe 'initialization' do
      it 'accepts an advance command' do
        expect(command.input).to eq 'M'
      end

      it 'alters a rovers position' do
        expect(command.position_change).to eq robotic_rover.move
      end
    end
  end

  context 'right command' do
    let(:input) { 'R' }

    describe 'initialization' do
      it 'accepts a turn right command' do
        expect(command.input).to eq 'R'
      end

      it 'alters a rovers position' do
        expect(command.position_change).to eq robotic_rover.right_turn
      end
    end
  end
end
