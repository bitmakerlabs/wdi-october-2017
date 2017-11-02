# Problem: Get the total sum of a list of numbers
# 1 2 5 11 1

# Plan
# go through each number and add it to a total
# return that total

# Pseudocode
# numbers = [1, 2, 5, 11, 1]
my_numbers = [1, 2, 5, 11, 1]
# total = 0
def sum_numbers(numbers)
  total = 0
  # for each number in numbers
  numbers.each do |number|
    # total = total + number
    total = total + number
  end
  return total
end

puts sum_numbers(my_numbers)







