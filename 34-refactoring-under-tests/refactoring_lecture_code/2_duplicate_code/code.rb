class Driver

  def car_routine
    if day == 'Saturday' || day == 'Sunday'
      put_on(@seatbelt)
      @car.start
      drive_to_beach
    else
      put_on(@seatbelt)
      @car.start
      drive_to_work
    end
  end
















# This code just here to make the method above function
  def initialize
    @car = Car.new
  end
  def day
    ['Saturday', 'Sunday'].sample
  end
  def put_on(thing)
  end
  def drive_to_beach
  end
  def drive_to_work
  end
end

class Car
  def start
  end
end
