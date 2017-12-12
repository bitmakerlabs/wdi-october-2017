class Driver
  def car_routine
    prepare_to_drive
    if day == 'Saturday' || day == 'Sunday'
      drive_to_beach
    elsif false
      # Used to go to gym on Thursdays
      drive_to_gym
    else
      drive_to_work
    end
  end


























# This code just here to make the method above function

  def prepare_to_drive
    put_on(@seatbelt)
    @car.start
  end

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
