class Player
  attr_accessor :name, :points, :x, :y

  def initalize(x, y)
    @x = x
    @y = y
    @points = 0
    @health = 100
  end
end
