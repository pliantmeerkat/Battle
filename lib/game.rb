# game class
class Game

  attr_reader :players
  attr_reader :current_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def attack(defender)
    defender.receive_damage
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  private
  def opponent_of(a_player)
    @players.select { |player| player != a_player }.first
  end

end
