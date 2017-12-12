def work_out
  jogging
  running
  walking
end

def treadmill
  Treadmill.first_available
end

def treadmill_session(activity, minutes)
  treadmill.pace = activity
  treadmill.set_time(minutes)
  start_stop
end

def walking
  treadmill_session(:walking, 5)
end

def running
  treadmill_session(:running, 40)
end

def jogging
  treadmill_session(:jogging, 5)
end

def start_stop
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
