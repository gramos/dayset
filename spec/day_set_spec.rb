require 'minitest/spec'
require 'minitest/autorun'
require 'day_set'
require 'date'

describe "DaySet group in set of 7 days" do

  before do
    @date = Date.new(2012, 1)
    @args = { :date => @date, :group_number => 7 }
  end

  it "should get first set of 7 days" do
    expected = (Date.new(2012, 1, 1)..Date.new(2012, 1, 7)).to_a
    DaySet.get(@args)[0].must_equal expected
  end

  it "should get the second set of 7 days" do
    expected = (Date.new(2012, 1, 8)..Date.new(2012, 1, 14)).to_a
    DaySet.get(@args)[1].must_equal expected
  end

  # It "should get the last set of 7 days" do
  #   @date     = Date.new(2012, 1)
  #   @expected = Date.new(2012, 1, 29)..Date.new(2012, 1, 31)
  #   WeekPeriod.get(@date, 4).must_equal @expected
  # end
end
