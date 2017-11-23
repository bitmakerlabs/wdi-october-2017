
a = 'a'
puts a

def my_method
  b = 'b'
  puts b
end

my_method
# puts b # will not work

sum = 0
(1..10).each do |i|
  sum += i
  j = i
  puts i
end

puts sum

class Beer

  @@inventory = 0

  def initialize
    @amount = 500
  end

  def drink
    @amount -= 100
  end

  def examine
    puts "*** Still have #{@@inventory} beers left"
    @amount
  end

  def self.buy
    @@inventory += 1
    return self.new
  end

end

b = Beer.buy
b.drink
puts b.examine

puts @@inventory
