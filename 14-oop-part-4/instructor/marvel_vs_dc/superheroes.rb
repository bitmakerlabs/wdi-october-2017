require_relative 'superpowers'

class Superhero

  MAX_HEALTH = 100
  DEFAULT_POWER = 10
  DEFAULT_HEALING_FACTOR = 10
  DEFAULT_SPEED = 10
  DEFAULT_ALTITUDE = 0

  def initialize(name)
    @name = name

    @health         = MAX_HEALTH
    @power          = DEFAULT_POWER
    @healing_factor = DEFAULT_HEALING_FACTOR
    @speed          = DEFAULT_SPEED
    @altitude       = DEFAULT_ALTITUDE
  end

  def name
    @name
  end

  def health
    @health
  end

  def speed
    @speed
  end

  def altitude
    @altitude
  end

  def conscious?
    @health > 0
  end

  def hit(opponent)
    if conscious? &&
      @altitude >= opponent.altitude &&
      @speed >= opponent.speed

      opponent.take_hit(@power)
    end
  end

  def take_hit(damage)
    @health -= damage
    @health = 0 if @health < 0
  end

  def rest
    @health += @healing_factor
    @health = MAX_HEALTH if @health > MAX_HEALTH
  end

end

class Kryptonian < Superhero
  include Strength
  include Flight
  include Speed
end

class BatPerson < Superhero
  include MartialArts
  include Rich
  include Genius
end

class Amazonian < Superhero
  include MartialArts
  include Strength
  include Flight
end

class XWeapon < Superhero
  include MartialArts
  include Regeneration

  CLAW_STRENGTH = 10

  def initialize(name)
    super(name)
    @power += CLAW_STRENGTH
  end
end

class Speedster < Superhero
  include Speed
  include Regeneration
end

class IronPerson < Superhero
  include Flight
  include Rich
  include Genius
end
