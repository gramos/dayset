require 'date'
class DaySet < Array

  attr_reader :sets

  def last_day_of_the_month
    d = Date.new @date.year, @date.month
    d += 42
    last_d = Date.new(d.year, d.month) - 1
    last_d.day
  end

  def initialize(args)
    @date         = args[:date]
    @group_number = args[:group_number]
    @move_residue = args[:move_residue]
    @sets          = gen_range!.each_slice(@group_number).to_a
    move_residue!(@group_number / 2) if @move_residue
  end

  def self.gen_for_year(year, options)
    sets = []

    (1..12).each do |month|
      date = Date.new year, month
      self.new(options.merge(:date => date)).sets.each do |s|
        sets << s
      end
    end

    sets
  end

  private

  def gen_range!
    last_day   = last_day_of_the_month
    low_limit  = Date.new @date.year, @date.month, 1
    high_limit = Date.new @date.year, @date.month, last_day
    low_limit..high_limit
  end

  def move_residue!(limit)
    if @sets.last.size < limit
      last = @sets.pop
      @sets.last << last.first
    end

  end


end
