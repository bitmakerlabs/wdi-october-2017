class Rover

  def initialize(x, y, dir)
    @x = x
    @y = y
    @dir = dir
  end

  def move
    if @dir == 'N'
      @y += 1
    elsif @dir == 'E'
      @x += 1
    elsif @dir == 'S'
      @y -= 1
    elsif @dir == 'W'
      @x -= 1
    end
  end

  def turn_left
    if @dir == 'N'
      @dir = 'W'
    elsif @dir == 'W'
      @dir = 'S'
    elsif @dir == 'S'
      @dir = 'E'
    elsif @dir == 'E'
      @dir = 'N'
    end
  end

  def turn_right
    if @dir == 'N'
      @dir = 'E'
    elsif @dir == 'W'
      @dir = 'N'
    elsif @dir == 'S'
      @dir = 'W'
    elsif @dir == 'E'
      @dir = 'S'
    end
  end

  def turn(which_way)
    if which_way == 'L'
      turn_left
    elsif which_way == 'R'
      turn_right
    end
  end

  def read_instructions
    print "Waiting for instructions (L,M,R):"
    instructions = gets.chomp
    instructions = instructions.split('')

    instructions.each do |i|
      if i == 'M'
        move
      else
        turn(i)
      end
    end
  end

  def report_position
    return "I am at #{@x}, #{@y} facing #{@direction}"
  end

end

rover = Rover.new(0,0,'n')
puts rover.report_position
rover.read_instructions
puts rover.report_position
