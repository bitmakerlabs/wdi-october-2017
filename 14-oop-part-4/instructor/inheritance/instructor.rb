require_relative 'person'

class Instructor < Person

  def teach(cohort)
    cohort.each { |student| student.learn }
  end

  def full_name
    "Prof. #{ super }"
  end

end
