require 'minitest/spec'
require 'minitest/autorun'
require 'week_period'
require 'date'

describe DaySet do

  it "should get periods grouped in set of 7 days" do
    @date = Date.new(2012, 1)
    @expected = (Date.new(2012, 1, 1)..Date.new(2012, 1, 7)).to_a
    @args = { :date => @date, :group_number => 7 }

    DaySet.get(@args)[0].must_equal @expected
  end

  # it "should get the second set of 7 days" do
  #   @date = Date.new(2012, 1)
  #   @expected = Date.new(2012, 1, 8)..Date.new(2012, 1, 14)
  #   WeekPeriod.get(@date, 2).must_equal @expected
  # end

  # It "should get the last set of 7 days" do
  #   @date     = Date.new(2012, 1)
  #   @expected = Date.new(2012, 1, 29)..Date.new(2012, 1, 31)
  #   WeekPeriod.get(@date, 4).must_equal @expected
  # end
end
