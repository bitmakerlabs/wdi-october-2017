class Car

  @@default_colour = 'green'

  def initialize(owner)
    @owner  = owner
    @colour = @@default_colour
    @broken = false
  end

  def self.default_colour
    @@default_colour
  end

  def self.default_colour=(default_colour)
    @@default_colour = default_colour
  end

  def colour
    @colour
  end

  # Writer
  def colour=(colour)
    @colour = colour
  end

  def broken?
    @broken
  end

  def crash(another_car = nil)
    @broken = true

    if another_car
      another_car.crash()
    end
  end

end
