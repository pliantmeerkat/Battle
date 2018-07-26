# game class
class Game

  attr_reader :players
  attr_reader :current_turn
  attr_reader :looser
  attr_reader :winner

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
    @winner = player_1 # to prevent tests from crashing
    @looser = player_2 # to prevent tests from crashing
  end

  def attack
    opponent_of(current_turn).receive_damage
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
