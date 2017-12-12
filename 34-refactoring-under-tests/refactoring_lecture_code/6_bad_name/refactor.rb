def total_amount_accrued(principal, interest_rate_percent, number_of_years)
  annual_interest_rate = interest_rate_percent / 100
  principal * (1 + annual_interest_rate * number_of_years)
end
