class Driver

  # car subroutine
  def car_routine
    prepare_to_drive
    # dont drive to work on saturday or sunday
    if day == 'Saturday' || day == 'Sunday'
      drive_to_beach
    else
      drive_to_work
    end
  end

  # preparing to drive
  def prepare_to_drive
    # put on seatbelt
    put_on(@seatbelt)
    # start the car
    @car.start
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
