def work_out
  warm_up
  aerobic_exercise
  cool_down
end

def warm_up
  treadmill.pace = :jogging
  treadmill.set_time(5)
  treadmill.start
  treadmill.stop
end

def aerobic_exercise
  treadmill.pace = :running
  treadmill.set_time(40)
  treadmill.start
  treadmill.stop
end

def cool_down
  treadmill.pace = :walking
  treadmill.set_time(5)
  treadmill.start
  treadmill.stop
end

def treadmill
  Treadmill.first_available
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
