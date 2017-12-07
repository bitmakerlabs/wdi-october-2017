require 'minitest/autorun'
require 'minitest/pride'
require_relative '../contact'

class TestContact < Minitest::Test

  def setup
    @contact = Contact.create('Grace', 'Hopper', 'grace@hopper.com', 'computer scientist')
  end

  def teardown
    Contact.delete_all
  end

  def test_all
    expected_value = [@contact]
    actual_value = Contact.all

    assert_equal(expected_value, actual_value)
  end

  def test_find
    expected_value = @contact
    actual_value = Contact.find(@contact.id)

    assert_equal(expected_value, actual_value)
  end

  def test_find_by
    expected_value = @contact
    actual_value = Contact.find_by('first_name', 'Grace')

    assert_equal(expected_value, actual_value)
  end

  def test_delete_all
    Contact.delete_all

    expected_value = []
    actual_value = Contact.all

    assert_equal(expected_value, actual_value)
  end

  def test_full_name
    expected_value = 'Grace Hopper'
    actual_value = @contact.full_name

    assert_equal(expected_value, actual_value)
  end

  def test_update
    @contact.update('note', 'wrote the first compiler in 1952')

    expected_value = 'wrote the first compiler in 1952'
    actual_value = @contact.note

    assert_equal(expected_value, actual_value)
  end

  def test_delete
    @contact.delete

    expected_value = []
    actual_value = Contact.all

    assert_equal(expected_value, actual_value)
  end

end
