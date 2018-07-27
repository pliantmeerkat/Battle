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
  context 'Feature 3 Attack modifier effects tests' do
    describe '#stunned' do
      it { expect(subject).to respond_to(:stunned) }
      it { expect(subject.stunned).to eq(false) }
    end
    describe '#bleeding' do
      it { expect(subject).to respond_to(:bleeding) }
      it { expect(subject.bleeding).to eq(false) }
    end
  end
end
