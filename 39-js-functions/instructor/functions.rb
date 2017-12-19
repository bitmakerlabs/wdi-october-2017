# Basics

# Write a method that takes someone's order
def take_order(order)
  puts "Received order for #{order}"
  return order
end

# Call the method
take_order("pizza")


def say_hello
  puts "Hello Ruby!"
end

say_hello

def slow_method
  puts "Starting the method..."
  sleep(5)
  puts "Ending the method..."
end

slow_method

# Question:
# Can I assign it to a variable as a method? Why would I want to do this?

numbers = [1, 2, 3, 4, 5]

times_five =  numbers.map do |number|
                number * 5
              end
