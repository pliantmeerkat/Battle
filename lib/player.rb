# player class
class Player
  attr_reader :name
  attr_accessor :hit_points, :stunned, :bleeding
  DEFAULT_HITPOINTS = 100
  def initialize(name)
    @name = name
    @hit_points = DEFAULT_HITPOINTS
    @stunned = false
    @bleeding = false
  end
end
