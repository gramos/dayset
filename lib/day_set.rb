class DaySet

  def self.last_day_of_the_month(yyyy, mm)
    d = Date.new yyyy, mm
    d += 42
    last_d = Date.new(d.year, d.month) - 1
    last_d.day
  end

  def self.gen(args)
    gen_range(args[:date]).each_slice(args[:group_number]).to_a
  end

  def self.gen_range(date)
    last_day   = last_day_of_the_month date.year, date.month
    low_limit  = Date.new(date.year, date.month, 1)
    high_limit = Date.new(date.year, date.month, last_day)
    (low_limit..high_limit)
  end
end
