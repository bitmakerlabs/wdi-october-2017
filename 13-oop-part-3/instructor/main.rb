require './contact.rb'

clark = Contact.new('Clark', 'Kent', 'clark@dailyplanet.com', 'goes into the phone booth a lot...')
diana = Contact.new('Diana', 'Prince', 'diana@amazon.com', '')

puts clark.full_name
puts diana.full_name
