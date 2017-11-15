require 'sinatra'

# ROUTE: METHOD + PATH

get '/' do
  redirect to('/hello')
end

get '/hello' do
  # Must be last line
  # send_file 'views/hello.html'

  @current_time = Time.now

  @todo_list = [
    'Water the plants',
    'Feed the cat',
    'Call the girlfriend'
  ]

  # Must be last line
  erb :hello
end

get '/goodbye' do
  'Goodbye!'
end
