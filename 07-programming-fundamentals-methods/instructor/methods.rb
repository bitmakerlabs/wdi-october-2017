#
#
# first_number = 5
# second_number = 12
#
# result = first_number + second_number
#
# puts result
#
# apples = 4
# oranges = 8
#
# fruits = apples + oranges
# puts fruits


def add(apples, oranges)
  sum = apples + oranges
  return sum
end

new_number = add(1, 2)
puts new_number

newer_number = add(5, 6)
puts newer_number

puts "2 + 2 = #{ add(2, 2) }"

puts add(5, 6)

puts '-'*30

more_fruits = add(1, 3) + add(4, 5) + add(9, 2)
puts add('hello ', 'world')
cool_sum = add( add(1, 3), add(5, 4) )
puts cool_sum

current_horses = 4
# def current_horses
#   return 4
# end
animals = add(current_horses, 1)
puts animals


def add(first, second)
  return first + second
end

puts add(2, 3)






# save the variable using gets
# square the number

def afford_horse(money)
  horse_cost = 20000
  if money < horse_cost
    return 'Keep saving!'
  end

  remaining = money - horse_cost
  return "You bought a horse and have $#{remaining} left."
end

def get_user_savings
  puts "Please enter your horse fund savings."
  return gets.to_i
end

total_money = get_user_savings
can_afford_horse = afford_horse(total_money)
puts can_afford_horse
# puts(can_afford_horse)

#
# word = puts "Hello"















#
