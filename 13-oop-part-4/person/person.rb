class Person

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

end

class Professor < Person

  attr_accessor :field_of_study

  def initialize(first_name, last_name, field_of_study)
    super(first_name, last_name)
    @field_of_study = field_of_study
  end

  def full_name
    # "Professor #{@first_name} #{@last_name}"
    # --- same as ---
    "Professor #{ super }"
  end

  def teach(placeholders)
    #students.each do |student|
    #  student.learn
    #end
    # --- same as ---
    placeholders.each { |placeholder| placeholder.learn }
  end

end

class Student < Person

  attr_reader :knowledge_level

  def initialize(first_name, last_name)
    super(first_name, last_name)
    @knowledge_level = 0
  end

  def learn
    @knowledge_level += 1
  end

  def slack
    @knowledge_level -= 1 if @knowledge_level > 0
  end

end
