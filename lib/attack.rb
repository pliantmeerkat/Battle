# attack class
class Attack

  def initialize(damage_class)
    @damage_class = damage_class.new
  end

  def attack_power
    @damage_class.damage_return(@damage_class.damage_blunt)
  end

  def attack_fast
    @damage_class.damage_return(@damage_class.damage_default)
  end

  def attack_ranged
    @damage_class.damage_return(@damage_class.damage_pierce)
  end

  def attack_defense
    @damage_class.damage_return(@damage_class.damage_default)
  end

end
