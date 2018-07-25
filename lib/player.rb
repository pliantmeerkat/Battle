# player class
class Player
  attr_reader :name
  attr_reader :hit_points
  DEFAULT_HITPOINTS = 100
  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HITPOINTS
  end

  def receive_damage
    @hit_points -= 10
  end

end
