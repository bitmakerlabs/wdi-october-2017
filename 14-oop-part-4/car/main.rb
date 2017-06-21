require './car'

freds_car = Car.new('ABCDEF', 'Fred')
minas_car = Car.new('MOVIES', 'Mina')
natalies_car = Car.new('LINUX', 'Natalie')

freds_car.start
freds_car.drive(10)
freds_car.stop
freds_car.drive(10)

puts "***** Fred's odometer: #{ freds_car.odometer }"

minas_car.start
minas_car.drive(100)
minas_car.stop

puts "***** Mina's odometer: #{ minas_car.odometer }"

puts "***** Fred's car crashed?: #{ freds_car.crashed }"
puts "***** Mina's car crashed?: #{ minas_car.crashed }"
puts "***** Natalie's car crashed?: #{ natalies_car.crashed }"

freds_car.crash(minas_car)

puts "***** Fred's car crashed?: #{ freds_car.crashed }"
puts "***** Mina's car crashed?: #{ minas_car.crashed }"
puts "***** Natalie's car crashed?: #{ natalies_car.crashed }"

natalies_car.crash

puts "***** Fred's car crashed?: #{ freds_car.crashed }"
puts "***** Mina's car crashed?: #{ minas_car.crashed }"
puts "***** Natalie's car crashed?: #{ natalies_car.crashed }"

puts "***** Total number km drive: #{ Car.total_kilometres }"
