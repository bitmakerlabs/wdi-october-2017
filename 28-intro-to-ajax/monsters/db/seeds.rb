# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  Monster.create(name: Faker::Name.name, home: [Faker::Address.city, Faker::Address.country].join(', '), creepiness: (1..100).to_a.sample)
end
