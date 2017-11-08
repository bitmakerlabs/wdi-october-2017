require './contact.rb'

Contact.create('Clark', 'Kent', 'clark@dailyplanet.com', 'goes into the phone booth a lot...')
Contact.create('Diana', 'Prince', 'diana@amazon.com')
Contact.create('Bruce', 'Wayne', 'bruce@wayne-foundation.com', 'kinda scary guy')
Contact.create('Barry', 'Allen', 'barry@centralcitypolice.com')
Contact.create('Dave', 'Wong', '')
Contact.create('Dave', 'Wong', '')

jen = Contact.new('Jen', 'Jones', '')
jen.save

Contact.all.each do |contact|
  puts "#{ contact.id } #{ contact.full_name }"
end

#mystery_person = Contact.find(1004)
#puts mystery_person.full_name
