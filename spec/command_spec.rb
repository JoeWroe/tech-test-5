require 'command'

describe Command do
  subject(:command) { described_class.new(input) }

  let(:input) { 'M' }
  
  context 'on initialization' do
    it 'accepts a command' do
      expect(command.input).to eq 'M'
    end
  end
end
