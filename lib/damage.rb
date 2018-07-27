# damage class
class Damage

  attr_reader :base_damage

  def initialize
    @base_damage = 12.00
  end

  def damage_blunt
    # 5% chance of stunning opponenet
    # 1.5% base damage
    # bigger random odds
    [(@base_damage * 1.5).round(2) + rand(-15..20), rand(1..20) < 20 ? 's' : 0, 0]
  end

  def damage_pierce
    # 25% chance of bleeding damage
    # 1.9% base damage
    # 25% miss chance - may scale with player hp
    bleed = rand(1..4)
    [(@base_damage * 1.9).round(2) + rand(-15..25), bleed < 20 ? 'b' : 0, bleed == 2 ? 1 : 0]
  end

  def damage_default
    # no miss or mod damage
    # 1.3% base
    # low random stats
    [(@base_damage * 1.3).round(2) + rand(-10..15), 0, 0]
  end

  def damage_heal
    damage_default[0] + rand(1 - damage_default[0]..10)
  end

  def damage_mod_bleed
    5 + rand(-3..3)
  end

  def damage_return(damage_type)
    # process:
    # caculate miss chance - if miss return zero
    # randomise damage using incoming roll value
    # calculate modifier
    return [0, 'm'] unless damage_type[2].zero?
    damage_type[0] += rand(0..30) == 10 ? 50 : 0 # mega damage roll
    [damage_type[0], damage_type.select { |c| c == 'b' || c == 's' }.join]
  end
end
