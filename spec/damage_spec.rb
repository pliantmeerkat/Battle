require './lib/damage'
describe Damage do
  let(:subject) { described_class.new }
  context 'Feature 1 - Damage types' do
    before(:each) { allow(subject).to receive(:rand) { 10 } }
    describe '#base_damage' do
      it { expect(subject).to respond_to(:base_damage) }
      it { expect(subject.base_damage).to eq(12) }
    end
    describe '#damage_blunt' do
      it { expect(subject).to respond_to(:damage_blunt) }
      it { expect(subject.damage_blunt).to eq([28, 0, 0])}
      it 'stun value rolls on 5' do
        allow(subject).to receive(:rand) { 5 }
        expect(subject.damage_blunt[1]).to eq('s')
      end
    end
    describe '#damage_pierce' do
      it { expect(subject).to respond_to(:damage_pierce) }
      it { expect(subject.damage_pierce).to eq([32.8, 0, 0]) }
      it 'bleed value rolls on 3' do
        allow(subject).to receive(:rand) { 3 }
        expect(subject.damage_pierce[1]).to eq('b')
      end
      it 'miss value rolls on 2' do
        allow(subject).to receive(:rand) { 2 }
        expect(subject.damage_pierce[2]).to eq(1)
      end
    end
    describe 'damge_default' do
      it { expect(subject).to respond_to(:damage_default) }
      it { expect(subject.damage_default).to eq([25.6, 0, 0]) }
    end
  end
  context 'Feature 2 - Return damage' do
    before(:each) { allow(subject).to receive(:rand) { 2 } }
    describe '#damage_return' do
      it { expect(subject).to respond_to(:damage_return) }
      it { expect(subject.damage_return([25.6, 0, 0])).to eq([25.6, '']) }
      it { expect(subject.damage_return([28, 's', 0])).to eq([28, 's']) }
      it { expect(subject.damage_return([32.8, 'b', 0])).to eq([32.8, 'b']) }
      it { expect(subject.damage_return([25.6, 0, 1])).to eq([0, 'm']) }
    end
  end
end
