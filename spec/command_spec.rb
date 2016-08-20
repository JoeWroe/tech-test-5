require 'command'

describe Command do
  subject(:command) { described_class.new(input, robotic_rover) }

  let(:robotic_rover) do
    double(:robotic_rover, position: '0 0 N',
                           move: '1 0 N')
  end

  let(:input) { 'M' }

  context 'on initialization' do
    it 'accepts a command' do
      expect(command.input).to eq 'M'
    end

    it 'can alter a rovers position' do
      expect(command.position_change).to eq '1 0 N'
    end
  end
end
