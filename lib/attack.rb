# attack class
class Attack

  def initialize(damage_class)
    @damage_class = damage_class
  end

  def attack_type(choice)
    if choice == 'power_attack' then attack_power
    elsif choice == 'fast_attack' then attack_fast
    elsif choice == 'ranged_attack' then attack_ranged
    elsif choice == 'defense_attack' then attack_defense
    else @damage_class.damage_default
    end
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
