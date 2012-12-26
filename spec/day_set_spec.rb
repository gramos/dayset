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
    DaySet.gen(@args)[0].must_equal expected
  end

  it "should get the second set of 7 days" do
    expected = (Date.new(2012, 1, 8)..Date.new(2012, 1, 14)).to_a
    DaySet.gen(@args)[1].must_equal expected
  end

end
