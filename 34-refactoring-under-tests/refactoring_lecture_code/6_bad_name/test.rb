require 'minitest'
require 'minitest/autorun'

require_relative './code.rb'

class BadNameTest < Minitest::Test
  def test_that_calculates_simple_interest
    principal = 1000
    interest = 12.0
    years = 5

    loan = tot(principal, interest, years)

    assert_equal(1600, loan)
  end

  def test_that_wont_charge_if_interest_zero
    principal = 1000
    interest = 0.0
    years = 5

    loan = tot(principal, interest, years)

    assert_equal(1000, loan)
  end

  def test_that_wont_charge_if_years_zero
    principal = 1000
    interest = 9.0
    years = 0

    loan = tot(principal, interest, years)

    assert_equal(1000, loan)
  end

  def test_that_wont_charge_if_principal_zero
    principal = 0
    interest = 9.0
    years = 10

    loan = tot(principal, interest, years)

    assert_equal(0.0, loan)
  end

end
