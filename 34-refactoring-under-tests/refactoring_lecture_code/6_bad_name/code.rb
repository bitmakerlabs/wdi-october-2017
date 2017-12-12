# Calculates the total accrued amount from principal loan
# Note: rate must be as a percentage float i.e. 9.2 or 14.4
# Note: number is number of periods in years
def tot(orig, rate, number)
  apr = rate / 100
  orig * (1 + apr * number)
end
