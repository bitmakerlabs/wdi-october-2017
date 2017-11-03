class Person

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @awake = true
    @tail  = false
  end

  # READER
  def first_name
    @first_name
  end

  # READER
  def last_name
    @last_name
  end

  # WRITER
  def first_name=(first_name)
    @first_name = first_name
  end

  # WRITER
  def last_name=(last_name)
    @last_name = last_name
  end

  # INSTANCE METHOD
  def full_name
    "#{ first_name } #{ last_name }"
  end

  # INSTANCE METHOD
  def greetings
    if @awake
      "Hi, my name is #{ full_name }, pleased to meetchu. #{ '(Bounces away)' if @tail }"
    else
      "Zzzzzz"
    end
  end

  def slumber
    @awake = false
  end

  def wake
    @awake = true
  end

  def mutate
    @tail = true
  end

end
