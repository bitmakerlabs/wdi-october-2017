require './person.rb'

fred = Person.new('Fred', 'Ngo')
mina = Person.new('Mina', 'Mikhail')
nat = Person.new('Natalie', 'Black')

puts mina.first_name
mina.first_name = '^%#$^$^'
puts mina.first_name
puts mina.full_name

puts nat.full_name

puts mina.greetings
puts nat.greetings

mina.slumber
puts mina.greetings

mina.wake
puts mina.greetings

mina.mutate
puts mina.greetings

mina.evilness = 100
