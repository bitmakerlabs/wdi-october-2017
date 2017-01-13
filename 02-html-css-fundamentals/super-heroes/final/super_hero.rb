require 'sinatra'

get '/' do
  erb :index
end

get '/spiderman' do
  erb :spiderman
end

get '/batman' do
  erb :batman
end

get '/wonderwoman' do
  erb :wonderwoman
end
