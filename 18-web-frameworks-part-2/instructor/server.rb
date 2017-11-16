require 'sinatra'

get '/' do
  redirect to('/recipes')
end

get '/about' do
  'TODO'
end

get '/contact' do
  'TODO'
end

get '/legalese' do
  'TODO'
end

get '/recipes' do
  @recipes = {
    1 => 'BBQ Ribs',
    2 => 'Avocado Sushi',
    3 => 'Gluten-free Cookies',
    4 => 'Nitrogen Chocolate Ice Cream'
  }

  erb :recipes
end
