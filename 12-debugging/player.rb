class Player
  @@id = 0

  def initalize(x, y)
    @x = x
    @y = y
    @points = 0
    @health = 100
    @id = @@id
    @@id += 1

  def id
    return @id
  end

  def points
    return @points
  end

  def x
    return @x
  end

  def x=(x)
    @x = x
  end

  def y
    return @y
  end

  def y=(y)
    @y = y
  end
end
