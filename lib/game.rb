# game class
class Game

  attr_reader :players
  attr_reader :current_turn
  attr_reader :looser
  attr_reader :winner

  def self.create(player_1, player_2, damage, attack)
    @game = Game.new(player_1, player_2, attack, damage)
  end

  def self.instance
    @game
  end

  def initialize(player_1, player_2, damage, attack)
    @players = [player_1, player_2]
    @current_turn = player_1
    @damage_class = damage.new
    @attack_class = attack.new(@damage)
    @winner = player_1 # to prevent tests from crashing
    @looser = player_2 # to prevent tests from crashing
  end

  def attack(type)
    opponent_of(current_turn).hit_points -= attack.attack_power
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

  private

  def opponent_of(a_player)
    @players.reject { |player| player == a_player }.first
  end
end
