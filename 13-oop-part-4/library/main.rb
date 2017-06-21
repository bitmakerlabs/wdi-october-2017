require_relative 'music'
require_relative 'book'


def library_report(day)
  puts "**** Library Report for Day #{ day }"
  puts "The library has #{ Item.num_total } items in its collection."
  puts "#{ Item.num_borrowed } items are out."
  puts "-------------------------"
end

day = 0
library_report(day)

day = 1
hp1 = Book.new('Harry Potter 1')
lotr1 = Book.new('Lord of the Rings 1')
thriller = Music.new('Thriller')
library_report(day)

day = 2
hp1.check_out
lotr1.check_out
puts hp1.read
puts lotr1.read
puts thriller.play
library_report(day)

day = 3
thriller.check_out
puts thriller.play
library_report(day)

day = 4
hp1.check_out
lotr1.check_out
thriller.check_out
library_report(day)
