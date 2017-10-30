# if statements

# if (some condition is true)
#   then do something awesome
# (optionally) otherwise
#   then do something else

count = 9

if count > 10
  puts "Count is greater than ten"
elsif count < 10
  puts "Count is less than ten"
else
  puts "Count is equal to ten"
end

discount = (count > 10) ? 0.15 : 0.10

puts discount

puts "Count is equal to ten" if count == 10

unless count > 10
  puts "Count is less than or equal to ten"
else
  # Nobody knows what you're trying
end

puts "Count is greater than ten" unless count < 10
