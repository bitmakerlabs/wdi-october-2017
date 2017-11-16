require 'sinatra'

get '/' do
  redirect to('/recipes')
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

get '/legalese' do
  erb :legalese
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

get '/recipes/1' do
  erb :recipe_1
end

get '/recipes/2' do
  erb :recipe_2
end

get '/recipes/3' do
  erb :recipe_3
end

get '/recipes/4' do
  erb :recipe_4
end
