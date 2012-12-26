class DaySet

  def self.last_day_of_the_month(yyyy, mm)
    d = Date.new yyyy, mm
    d += 42
    last_d = Date.new(d.year, d.month) - 1
    last_d.day
  end

  def self.gen(args)
    sets = gen_range(args[:date]).each_slice(args[:group_number]).to_a
    move_residue(sets, args[:group_number] / 2) if args[:move_residue]
    sets
  end

  def self.gen_range(date)
    last_day   = last_day_of_the_month date.year, date.month
    low_limit  = Date.new date.year, date.month, 1
    high_limit = Date.new date.year, date.month, last_day
    low_limit..high_limit
  end

  def self.move_residue(sets, limit)
    if sets.last.size < limit
      last = sets.pop
      sets.last << last.first
    end
    sets
  end

  def self.gen_for_year(year, options)
    sets = []
    (1..12).each do |month|
      date = Date.new year, month
      gen(options.merge(:date => date)).each do |s|
        sets << s
      end
    end

    sets
  end

end
