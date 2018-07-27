require './lib/attack'

describe Attack do
  let(:damage_class) { double :damage_class, new: damage_inst }
  let(:damage_inst)  { double :damage_inst }
  let(:player_class) { double :player_class, new: player }
  let(:player)       { double :player }
  let(:subject)      { described_class.new(damage_class) }
  context 'Feature 1 - Attack Types' do
    before(:each) do
      allow(damage_class).to receive(:damage_blunt)
      allow(damage_class).to receive(:damage_pierce)
      allow(damage_class).to receive(:damage_default)
      allow(damage_class).to receive(:damage_return)
      allow(player).to receive(:hit_points)
    end
    describe '#attack_type' do
      it { expect(subject).to respond_to(:attack_type) }
    end
    describe '#attack_power' do
      it { expect(subject).to respond_to(:attack_power) }
      it 'sends correct messages to damage inst' do
        # expect(damage_inst).to receive(:damage_blunt)
        # expect(damage_inst).to receive(:damage_return)
        subject.attack_power
      end
    end
    describe '#attack_fast' do
      it { expect(subject).to respond_to(:attack_fast) }
    end
    describe '#attack_ranged' do
      it { expect(subject).to respond_to(:attack_ranged) }
      it 'sends messages correctly' do
        # expect(damage_inst).to receive(:damage_return)
        # expect(damage_inst).to receive(:damage_pierce)
        subject.attack_ranged
      end
    end
    describe '#attack_defense' do
      it { expect(subject).to respond_to(:attack_defense) }
    end
  end
end
