require './lib/damage'
describe Damage do
  let(:subject) { described_class.new }
  context 'Feature 1 - Damage types' do
    describe '#base_damage' do
      it { expect(subject).to respond_to(:base_damage) }
      it { expect(subject.base_damage).to eq(12) }
    end
  end
end
