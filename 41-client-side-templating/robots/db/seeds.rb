# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |n|
  Robot.create({name: Faker::Name.name, address: Faker::Internet.ip_v4_address, model_number: rand(10000..99999), lasers: [true, false].sample, japanese: [true, false].sample})
end