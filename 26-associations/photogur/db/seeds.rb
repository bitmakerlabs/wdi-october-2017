# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Picture.destroy_all
Picture.create!(title: "Bunny", description: "Just look at this bunny", url: "http://theartmad.com/wp-content/uploads/2015/03/Bunny-2.jpg")
Picture.create!(title: "Bird", description: "Standing on a branch and yelling", url: "http://40.media.tumblr.com/e0496fd38f282d7996bdce8618e6d2a5/tumblr_n7fwydGtMF1tu0z5no1_500.jpg")
Picture.create!(title: "Guinea Pig", description: "A pepper for a hat", url: "http://i.imgur.com/5bNMuVa.jpg")

animal_tag = Tag.create!(name: "Animals")
hat_tag = Tag.create!(name: "Hats")

Picture.all.each do |pic|
  pic.tags << animal_tag
end

Picture.last.tags << hat_tag