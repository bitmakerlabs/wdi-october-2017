require 'minitest/autorun'
require 'minitest/pride'
require_relative 'temperature.rb'

class TestTemperature < MiniTest::Test
   # tests go in here

   def test_c_to_f_positive
     expected_value = 50
     actual_value = c_to_f(10)

     assert_equal(expected_value, actual_value)
   end

   def test_c_to_f_negative
     expected_value = -4
     actual_value = c_to_f(-20)

     assert_equal(expected_value, actual_value)
   end

   def test_f_to_c_positive
     # 50 to 10
     expected_value = 10
     actual = f_to_c(50)

     assert_equal(expected_value, actual)
   end

   def test_f_to_c_negative
     # -4 is -20
     expected_value = -20
     actual_value = f_to_c(-4)

     assert_equal(expected_value, actual_value)
   end
end
