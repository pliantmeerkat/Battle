require './lib/game'
describe Game do
  let(:player_class) { double :player_class, new: :player }
  let(:player_1)     { double :player, name: 'Durain' }
  let(:player_2)     { double :player, name: 'Escargot' }
  let(:subject)      { described_class.new(player_1, player_2) }
  context 'Feature 1 players tets' do
    describe '#players' do
      it { expect(subject.players).to eq([player_1, player_2] ) }
    end
  end
  context 'Feature 2 Attacking tests' do
    describe '#attack' do
      before(:each) do 
        allow(player_1).to receive(:hit_points) { 100 }
      end
      it { expect(subject).to respond_to(:attack) }
      it 'triggers receive damage' do
        expect(player_1).to receive(:receive_damage)
        subject.attack(player_1)
      end
    end
  end
  context 'Feature 3 Switching turn tests' do
    describe '#current_turn' do
      it { expect(subject).to respond_to(:current_turn) }
      it { expect(subject.current_turn).to eq(player_1) }
      it 'switches turn' do
        subject.switch_turns
        expect(subject.current_turn).to eq(player_2)
      end
    end
  end
end
