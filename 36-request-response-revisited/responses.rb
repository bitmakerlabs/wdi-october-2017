# Standard library that makes HTTP requests from Ruby
require 'net/http'

# Standard library that parses string data into JSON format
require 'json'

# Standard library that parses string data into CSV format
require 'csv'

# Let's make some HTTP requests to a server and see what we get back
# https://github.com/bitmakerlabs/response-types-demo
# Net::HTTP.get('example.com', '/index.html')

#make get request to localhost:3000/monsters
#result = Net::HTTP.get('localhost', '/monsters', 3000)
#puts result

#result = Net::HTTP.get('localhost', '/monsters.text', 3000)
#puts result

