class Contact

  @@contacts = []
  @@next_id  = 1000

  def initialize(first_name, last_name, email, notes = 'N/A')
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes

    @id = @@next_id
    @@next_id += 1
  end

  def self.create(first_name, last_name, email, notes = 'N/A')
    new_contact = Contact.new(first_name, last_name, email, notes)
    @@contacts << new_contact
    new_contact
  end

  def save
    @@contacts << self
  end

  def self.all
    @@contacts
  end

  def self.find(id)
    # Iterate through the list of contacts (@@contacts)
    # Find the specific instance denoted by the id
    # Return the specific instance being looked for
    # Left to the student as an exercise
  end

  # READERS
  def id
    @id
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def notes
    @notes
  end

  # WRITERS
  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email=(email)
    @email = email
  end

  def notes=(notes)
    @notes = notes
  end

  # Instance Method
  def full_name
    # All of these will work!
    # "#{ @first_name } #{ @last_name }"
    # "#{ @first_name } #{ last_name }"
    # "#{ first_name } #{ @last_name }"
    "#{ first_name } #{ last_name }"
  end

end
