require 'minitest'
require 'minitest/mock'
require 'minitest/autorun'
require_relative './code.rb'

class LongMethodTest < Minitest::Test
  def test_that
    treadmill = Minitest::Mock.new
    treadmill.expect(:pace=, true, [:jogging])
    treadmill.expect(:pace=, true, [:running])
    treadmill.expect(:pace=, true, [:walking])
    treadmill.expect(:set_time, nil, [5])
    treadmill.expect(:set_time, nil, [40])
    treadmill.expect(:set_time, nil, [5])
    3.times do
      treadmill.expect(:start, nil)
    end
    3.times do
      treadmill.expect(:stop, nil)
    end
    Treadmill.stub(:first_available, treadmill) do
      work_out
    end
    treadmill.verify
  end
end
