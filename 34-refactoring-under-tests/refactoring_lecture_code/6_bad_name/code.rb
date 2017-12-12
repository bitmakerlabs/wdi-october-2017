# Note: rate must be a float i.e. 9.2 or 14.4
def total_accrued_amount_on_loan(starting_amount, interest_rate_percent, years)
  annual_interest_rate = interest_rate_percent / 100
  starting_amount * (1 + annual_interest_rate * years)
end
