# This is where the method we're testing will go
#  (T(°F) - 32) × 5/9
#  T(°C) × 9/5 + 32

def f_to_c(f_temp)
  (f_temp - 32) * 5.0/9.0
end

def c_to_f(c_temp)
  c_temp * 9.0/5.0 + 32
end