def work_out
  treadmill = Treadmill.first_available

  treadmill.pace = :jogging
  treadmill.set_time(5)
  treadmill.start
  treadmill.stop

  treadmill.pace = :running
  treadmill.set_time(40)
  treadmill.start
  treadmill.stop

  treadmill.pace = :walking
  treadmill.set_time(5)
  treadmill.start
  treadmill.stop
end











































# Just here to make the above method work....
class Treadmill
  def self.first_available
  end
  def pace=(pace)
  end
  def set_time(time)
  end
  def start
  end
  def stop
  end
end
