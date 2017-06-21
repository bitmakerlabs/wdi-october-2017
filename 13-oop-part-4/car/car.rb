class Car

  attr_reader :crashed, :odometer

  @@total_kilometres = 0

  def initialize(license_plate_num, owners_name)
    @license_plate_num = license_plate_num
    @owners_name       = owners_name

    @running  = false
    @crashed  = false
    @odometer = 0
  end

  def self.total_kilometres
    @@total_kilometres
  end

  def start
    #if @running == false
    #  @running = true
    #end

    @running = true unless @running
  end

  def stop
    @running = false if @running
  end

  def drive(km)
    if @running && !@crashed
      @odometer += km
      @@total_kilometres += km
    end
  end

  # replace with attr_reader
  #def odometer
  #  return @odometer
  #end

  def crash(another_car = nil)
    @crashed = true
    @running = false if @running

    #if another_car
    #  another_car.crash
    #end
    # --- same as ---
    #another_car && another_car.crash
    # --- same as ---
    another_car&.crash
  end

end
