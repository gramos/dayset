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

describe "DaySet group in set of 6 days" do

  before do
    @date = Date.new(2012, 1)
    @args = { :date => @date, :group_number => 6,
              :move_residue => true }
  end

  it "should move the residue to the previous week" do
    expected = (Date.new(2012, 1, 25)..Date.new(2012, 1, 31)).to_a

    DaySet.gen(@args).last.must_equal expected
  end

  it "should generate set of days for a year" do
    @args.delete(:date)
    expected = (Date.new(2012, 12, 25)..Date.new(2012, 12, 31)).to_a

    DaySet.gen_for_year(2012, @args).last.must_equal expected
  end

end
