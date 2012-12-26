class DaySet

  def self.last_day_of_the_month(yyyy, mm)
    d = Date.new yyyy, mm
    d += 42
    last_d = Date.new(d.year, d.month) - 1
    last_d.day
  end

  def self.get(args)
    last_day = last_day_of_the_month args[:date].year, args[:date].month
    low_limit  = Date.new(args[:date].year, args[:date].month, 1)
    high_limit = Date.new(args[:date].year, args[:date].month, last_day)
    array_days = (low_limit..high_limit)
    array_days.each_slice(args[:group_number]).to_a
  end
end
