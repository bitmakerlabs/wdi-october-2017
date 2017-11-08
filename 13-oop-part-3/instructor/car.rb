class Car

  @@default_colour = 'green'

  def initialize(owner)
    @owner  = owner
    @colour = @@default_colour
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

end
