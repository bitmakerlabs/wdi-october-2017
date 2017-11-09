require_relative 'instructor'
require_relative 'student'

albert = Instructor.new('Albert', 'Einstein')

joe  = Student.new('Joe', 'Bloggs')
john = Student.new('John', 'Doe')
mary = Student.new('Mary', 'Blythe')

cohort = []
cohort << joe
cohort << john
cohort << mary

dave = Person.new('Dave', 'Chan')
#cohort << dave

puts "#{ joe.full_name }'s knowledge level: #{ joe.knowledge_level }"
puts "#{ john.full_name }'s knowledge level: #{ john.knowledge_level }"
puts "#{ mary.full_name }'s knowledge level: #{ mary.knowledge_level }"

10.times { albert.teach(cohort) }

mary.slack

puts "#{ joe.full_name }'s knowledge level: #{ joe.knowledge_level }"
puts "#{ john.full_name }'s knowledge level: #{ john.knowledge_level }"
puts "#{ mary.full_name }'s knowledge level: #{ mary.knowledge_level }"

albert.teach(mary)
