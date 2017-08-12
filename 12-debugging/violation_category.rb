class ViolationCategory

  def initialize(name)
    @name = name
    #1
    @violations = []
  end

  def add(violation)
    @violations << violation
  end

  def total_owed
    total = 0

    #3
    @violations.each do |violation|
      total += violation.money_owed
    end

    return total 
  end

  def earliest
    #7
    return nil if @violations.empty?

    earliest = @violations.first.date


    @violations.each do |violation|
      
      #6
      if violation.date < earliest
        earliest = violation.date
      end
      
    end

    return earliest
  end

  def latest
    return nil if @violations.empty?

    latest = @violations.first.date

    @violations.each do |violation|
      
      if violation.date > latest
        latest = violation.date
      end

    end

    return latest
  end

  #2
  def name
    @name
  end

  #5
  def count
    @violations.count
  end

end

