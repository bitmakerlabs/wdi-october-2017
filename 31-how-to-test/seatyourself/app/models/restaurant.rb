class Restaurant < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  validates :name, :opening_hour, :closing_hour, presence: true

  belongs_to :category
  has_many :reservations

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  # This method will return a list of times in which a reservation can be made
  def time_slots

    # you can book by the hour, and you can stay for an hour
    reservation_interval = 1.hour

    # Determine the earliest time we will allow reservation
    # It can't be in the past, we'll start 10 minutes from now
    start_time = Time.zone.now + 10.minutes
    # Then we have to round to the next hour block
    start_time = Time.zone.at( (start_time.to_f / reservation_interval).ceil * reservation_interval )
    # Then, if we are still earlier than opening hour, just use the opening hour
    # We can use the 'max' Array method
    start_time = [start_time, start_time.change(hour: opening_hour)].max

    # Determine the furthest in the future we will allow reservations
    end_time = (start_time + 3.days).change(hour: closing_hour)

    # Now, we want to make a list of every hour between our start_time and our end_time
    # For this we can use a begin... end while condition loop.
    # We'll start with an empty array that will hold all the hours,
    #   and a variable to hold each hour, which we will keep increasing by 1 hour, and then add to our array
    # Our loop condition will have us stop looping once we've reached the end time

    all_times = []
    a_time = start_time

    begin

      # add this time to our list of times
      all_times << a_time

      # increment the time
      a_time += reservation_interval

      # Once we get to closing time, we have to skip ahead to the next day's opening
      # That way you can't make a reservation at 2am
      if (a_time + reservation_interval) > a_time.change(hour: closing_hour)
        a_time = (a_time + 1.day).change(hour:opening_hour)
      end

    end while a_time < end_time

    all_times
  end

  def display_distance_to(other_restaurant)
    self.distance_to(other_restaurant, :km).round(3)
  end

end
