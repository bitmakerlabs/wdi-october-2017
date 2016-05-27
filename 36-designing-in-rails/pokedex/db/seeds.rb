# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Pokedex with 100 Pokemon..."

(1..100).each do |n|
  pokemon = Pokegem.get_obj('pokemon', n)
  Pokemon.create(name: pokemon.name, attack: pokemon.attack, defense: pokemon.defense, happiness: pokemon.happiness, speed: pokemon.speed, species: pokemon.species, growth_rate: pokemon.growth_rate, image_url: "http://assets22.pokemon.com/assets/cms2/img/pokedex/full/#{n.to_s.rjust(3, '0')}.png")
  print '.'
end

puts
