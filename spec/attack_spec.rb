require './lib/attack'

describe Attack do
  let(:subject) { described_class.new }
  context 'Feature 1 - Attack Types' do
    describe '#attack_power' do
      it { expect(subject).to respond_to(:attack_power) }
    end
    describe '#attack_fast' do
      it { expect(subject).to respond_to(:attack_fast) }
    end
    describe '#attack_ranged' do
      it { expect(subject).to respond_to(:attack_ranged) }
    end
    describe '#attack_defense' do
      it { expect(subject).to respond_to(:attack_defense)}
    end
  end
end

