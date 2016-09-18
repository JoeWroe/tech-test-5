require 'directions/direction'

describe Direction do
  subject(:direction) { described_class.new }

  describe 'template defaults to an error if' do
    it 'passed to_s' do
      expect { direction.to_s }.to raise_error NotImplementedError
    end

    it 'passed right_turn' do
      expect { direction.right_turn }.to raise_error NotImplementedError
    end

    it 'passed left_turn' do
      expect { direction.left_turn }.to raise_error NotImplementedError
    end

    it 'passed move' do
      expect { direction.move }.to raise_error NotImplementedError
    end

  end
end
