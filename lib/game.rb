# game class
class Game

  attr_accessor :attack_choice

  attr_reader :players
  attr_reader :current_turn
  attr_reader :looser
  attr_reader :winner

  def self.create(player_1, player_2, damage, attack)
    @game = Game.new(player_1, player_2, damage, attack)
  end

  def self.instance
    @game
  end

  def initialize(player_1, player_2, damage, attack)
    @players = [player_1, player_2]
    @current_turn = player_1
    @damage_class = damage.new
    @attack_class = attack.new(@damage_class)
    @winner = player_1 # to prevent tests from crashing
    @looser = player_2 # to prevent tests from crashing
  end

  def attack
    return [0, 0] if attack_mod_on_player == true
    damage = @attack_class.attack_type(attack_choice)
    opponent_of(current_turn).hit_points -= damage[0]
    damage
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def game_over?
    return false if @players.select { |player| player.hit_points <= 0 } == []
    @looser = @players.select { |player| player.hit_points <= 0 }.first
    @winner = players.reject { |player| player == looser }.first

    true
  end

  def attack_choice_output
    if attack_choice == 'power_attack' then 'Power Attacked'
    elsif attack_choice == 'fast_attack' then 'Swiftly Attacked'
    elsif attack_choice == 'ranged_attack' then 'Range Attacked'
    elsif attack_choice == 'defense_attack' then 'Defensivley Attacked'
    else 'none'
    end
  end

  def attack_mod_on_player
    if opponent_of(current_turn).bleeding == true
      opponent_of(current_turn).hit_points -= @damage_class.damage_mod_bleed
    elsif current_turn.stunned then true
    end
  end

  def opponent_of(a_player)
    @players.reject { |player| player == a_player }.first
  end
end
