require_relative 'violation_category'

class Violation
  def initialize(fine, date, inspection_id)
    @money_owed = fine
    @date = date
    @inspection_id = inspection_id
  end

  def self.create(fine, date, inspection_id, category)
    new_violation = Violation.new(fine, date, inspection_id)
    category.add(new_violation)
    return new_violation
  end

  def money_owed=(new_amount)
    @money_owed = new_amount
  end

  def date
    @date
  end

  def date=(new_date)
    @date = new_date
  end

  #4
  def money_owed
    @money_owed
  end

end
unsanitary = ViolationCategory.new("Unsanitary Conditions")
garbage = ViolationCategory.new("Garbage and Refuse")
vegetation = ViolationCategory.new("Vegetation")
animals = ViolationCategory.new("Animals and Pests")
violations = [unsanitary, garbage, animals, vegetation]

Violation.create(10, "2012-01-01", "1232423423", unsanitary)
Violation.create(20, "2012-03-09", "943598743", unsanitary)
Violation.create(35, "2012-06-11", "098753453", garbage)
Violation.create(10, "2012-11-21", "8578459874", garbage)
Violation.create(100, "2012-08-15", "2743853984", animals)

violations.each do |category|
  puts category.name
  puts "Total owed: #{category.total_owed}"
  puts "Number of violations: #{category.count}"
  puts "Earliest violation: #{category.earliest}"
  puts "Latest violation: #{category.latest}"
end
