require_relative 'contact'
require_relative 'note'

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note_body = gets.chomp

    new_contact = Contact.create(first_name: first_name, last_name: last_name, email: email)
    Note.create(contact_id: new_contact.id, body: note_body, written_at: Time.now)
  end

  def modify_notes(contact_to_modify)
    # if user says they want to modify notes
    # prompt them to choose either deleting existing note or adding new note
    print 'Enter 1 if you want to delete an existing note or 2 to add a new note: '
    selected_option = gets.chomp.to_i

    if selected_option == 1

      # show user the ids of all the notes
      Note.all.each do |note|
        puts "#{note.id}, #{note.body}, #{note.written_at}"
      end

      print 'Enter the id of the note you want to delete: '
      id_of_note_to_delete = gets.chomp.to_i
      note_to_delete = Note.find(id_of_note_to_delete)
      note_to_delete.delete
    elsif selected_option == 2
      # ask user to input text of note
      print 'What is your note? '
      user_input = gets.chomp
      # save that in the database
      Note.create(body: user_input, written_at: Time.now, contact_id: contact_to_modify.id)

    end
  end

  def modify_existing_contact
    puts 'Enter the id of the contact that you would like to modify'
    id = gets.to_i
    contact = Contact.find(id)


    puts 'What would you like to change? 1. First name 2. Last name 3. email 4. note '
    attribute_number = gets.to_i
    attribute_name = translate_attr_num_to_name(attribute_number).to_sym

    if attribute_name == :note
      modify_notes(contact)
    else

      puts "What is the new #{attribute_name}?"
      attribute_value = gets.chomp

      contact.update({attribute_name => attribute_value})
    end

  end

  def delete_contact
    puts 'Enter the id of the contact you want to delete: '
    id = gets.to_i
    contact = Contact.find(id)

    # select * from notes where contact_id=id;
    Note.where(contact_id: id).each do |note|
      note.delete
    end

    contact.delete
  end

  def display_all_contacts
    display_contacts(Contact.all)
  end

  def search_by_attribute
    puts 'Which attribute do you wish to search by? 1. First name 2. Last name 3. email 4. note'
    attribute_number = gets.chomp.to_i
    attribute_name = translate_attr_num_to_name(attribute_number).to_sym

    puts "Search by #{attribute_name}: "
    attribute_value = gets.chomp

    # if user wants to search by note, handle that case separately
    if attribute_name == :note
      # first find note with the text the user enters
      matching_note = Note.find_by(body: attribute_value)
      # then find the contact that corresponds with that note using the foreign key
      contact = Contact.find_by(id: matching_note.contact_id )

    else

      contact = Contact.find_by({attribute_name => attribute_value})

    end

    display_contact(contact)
  end

  def display_contact(contact)
    # when displaying a contact, loop through the list of all notes that are about them
    # and display each note individually
    puts "#{contact.id}, #{ contact.full_name }, #{ contact.email }"

    notes = Note.where(contact_id: contact.id)
    notes.each do |note|
      puts "\t #{note.body} - #{note.written_at}"
    end
  end

  def display_contacts(contacts)
    contacts.each do |contact|
      display_contact(contact)
    end
  end

  def translate_attr_num_to_name(attribute_number)
    case attribute_number
    when 1 then
      return 'first_name'
    when 2 then
      return 'last_name'
    when 3 then
      return 'email'
    when 4 then
      return 'note'
    end
  end

end

my_crm = CRM.new('Bitmaker CRM')
my_crm.main_menu
