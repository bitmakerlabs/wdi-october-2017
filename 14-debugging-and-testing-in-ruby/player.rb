class Player
  attr_accessor :id, :points, :x, :y
  @@id = 0

  def initalize(x, y)
    @x = x
    @y = y
    @points = 0
    @health = 100
    @id = @@id
    @@id += 1
end
