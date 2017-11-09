require_relative 'person'

class Student < Person

  def initialize(first_name, last_name)
    super(first_name, last_name)
    @knowledge_level = 0
  end

  def knowledge_level
    @knowledge_level
  end

  def learn
    @knowledge_level += 1
  end

  def slack
    @knowledge_level -= 1 if @knowledge_level > 0
  end

end
