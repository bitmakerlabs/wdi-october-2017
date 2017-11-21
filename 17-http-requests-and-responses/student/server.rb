require 'sinatra'

# ROUTE: METHOD + PATH

get '/' do
  redirect to('/hello')
end

get '/hello' do
  # send_file 'views/hello.erb'
  @current_time = Time.now
  @todo_list = [
    'Water the plants',
    'Eat jamaican patty',
    'Drink water',
    'Take a bath'
  ]
  erb :hello
end

get '/goodbye' do
  'Goodbye'
end
