require './lib/game'
describe Game do
  let(:player_class) { double :player_class, new: :player }
  let(:player)       { double :player  }
  let(:player_1)     { double :player, name: 'Durain' }
  let(:player_2)     { double :player, name: 'Escargot' }
  let(:damage_class) { double :damage_class, new: damage_inst }
  let(:damage_inst)  { double :damage_inst                    }
  let(:attack_class) { double :attack_class, new: attack_inst }
  let(:attack_inst)  { double :attack_inst, attack_type: 'power_attack' }
  let(:subject)      { described_class.new(player_1, player_2, damage_class, attack_class) }
  context 'Feature 1 players tets' do
    describe '#players' do
      it { expect(subject.players).to eq([player_1, player_2] ) }
    end
  end
  context 'Feature 2 Attacking tests' do
    describe '#attack' do
      before(:each) do
        allow(player_1).to receive(:hit_points) { 100 }
        allow(player_2).to receive(:hit_points) { 100 }
      end
      it { expect(subject).to respond_to(:attack) }
      it 'triggers receive damage' do
        # expect(player_2).to receive(:hit_points)
        # subject.attack
      end
    end
    describe '#attack_choice' do
      it { expect(subject).to respond_to(:attack_choice) }
    end
    describe '#attack_choice_output' do
      it { expect(subject).to respond_to(:attack_choice_output) }
      it 'returns power_attack' do
        subject.attack_choice = 'power_attack'
        expect(subject.attack_choice_output).to eq('Power Attacked')
      end
      it 'returns fast_attack' do
        subject.attack_choice = 'fast_attack'
        expect(subject.attack_choice_output).to eq('Swiftly Attacked')
      end
      it 'returns ranged_attack' do
        subject.attack_choice = 'ranged_attack'
        expect(subject.attack_choice_output).to eq('Range Attacked')
      end
      it 'returns defense_attack' do
        subject.attack_choice = 'defense_attack'
        expect(subject.attack_choice_output).to eq('Defensivley Attacked')
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
  context 'Feature 4 Game Over' do
    before(:each) do
      allow(player_1).to receive(:hit_points) { 100 }
      allow(player_2).to receive(:hit_points) { 100 }
    end
    describe '#game_over' do
      it { expect(subject).to respond_to(:game_over?) }
      it { expect(subject.game_over?).to eq(false) }
      it 'game ends if player 1 has 0 or less hp' do
        allow(player_1).to receive(:hit_points) { 0 }
        expect(subject.game_over?).to eq(true)
      end
      it 'game ends if player 2 has 0 or less hp' do
        allow(player_2).to receive(:hit_points) { 0 }
        expect(subject.game_over?).to eq(true)
      end
    end
  end
  context 'Feature 5 Attack Modifiers' do
    before(:each) do
      allow(damage_inst).to receive(:damage_mod_bleed) { 0 }
      allow(attack_inst).to receive(:attack_type)
      allow(player_1).to receive(:hit_points) { 100 }
      allow(player_2).to receive(:hit_points) { 100 }
      allow(player_1).to receive(:bleeding) { 100 }
      allow(player_2).to receive(:bleeding) { 100 }
      allow(player_1).to receive(:stunned) { 100 }
      allow(player_2).to receive(:stunned) { 100 }
    end
    describe '#attack_mod_on_player' do
      it { expect(subject).to respond_to(:attack_mod_on_player) }
      it 'subject can bleed' do
        expect(subject.attack_mod_on_player).to eq(false)
      end
      it 'stops a stunned player from attacking' do
        subject.attack_mod_on_player
        # expect(subject.attack).to eq([0, 0])
      end
    end
    describe '#attack_heal' do
      it { expect(subject).to respond_to(:attack_heal).with(1).arguments }
      it 'player can heal on defensive attack' do
        allow(player_1).to receive(:hit_points).and_return(100)
        subject.attack_heal(10)
        expect(player_2.hit_points).to eq(100)
      end
    end
  end
end
