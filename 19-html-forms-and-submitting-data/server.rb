require './film.rb'
require 'sinatra'
require 'pry'

get '/' do
  erb :index
end

get '/films' do
  "GET request: #{params}"
end

post '/films' do
  @film = Film.new

  @film.title = params[:title]
  @film.description = params[:summary]
  @film.rating = params[:rating]

  @film.save

  puts "POST request: #{params}"

  redirect to('/')
end

put '/films' do
  "PUT request: #{params}"
end

delete '/films' do
  "DELETE request: #{params}"
end

get '/contacts/:id' do
  params[:id]
end
