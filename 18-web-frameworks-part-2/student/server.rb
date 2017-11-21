require 'sinatra'
require_relative 'recipe'

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
    2 => 'Fried Chicken Wings',
    3 => 'Hakka Noodles',
    4 => 'Soup Dumplings'
  }

# .all is OK for small numbers of recipes
  @recipes = Recipe.all()

  erb :recipes
end

get '/recipes/:id' do
  @recipes = {
    1 => 'BBQ Ribs',
    2 => 'Fried Chicken Wings',
    3 => 'Hakka Noodles',
    4 => 'Soup Dumplings'
  }

  @recipe_id = params[:id].to_i

  erb :recipe
end
