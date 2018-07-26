require './lib/player'
describe Player do
  let(:subject)  { described_class.new('Durain') }
  let(:escargot) { described_class.new('Escargot') }
  before(:each)  { allow(subject).to receive(:rand).and_return(10) }
  context 'Feature 1 Player name: unit tests' do
    describe '#name' do
      it { expect(subject).to respond_to(:name) }
      it { expect(subject.name).to eq('Durain') }
    end
  end
  context 'Feature 2 Hit-points tests' do
    describe '#hit_points' do
      it { expect(subject).to respond_to(:hit_points) }
      it { expect(subject.hit_points).to eq(described_class::DEFAULT_HITPOINTS) }
    end
  end
  context 'Feature 3 Receive damage tests' do
    describe '#receive_damage' do
      it { expect(subject).to respond_to(:receive_damage) }
      it { expect { subject.receive_damage }.to change { subject.hit_points }.by(-10) }
    end
  end
end
