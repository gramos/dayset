dayset
======

With this gem you can generate a set of any number of days for a month
or for a year, is useful for example when you have to divide a month
in a fixed number of days, to create table partitions based on a date:


Generating set of 2 days January of 2012
--------------------------------------

     require 'day_set'
	 
	 DaySet.gen(:date => Date.new(2012, 1), :group_number => 2).first
	 
	 #=> [#<Date: 2012-01-01 ((2455928j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-02 ((2455929j,0s,0n),+0s,2299161j)>]
 
Generating set of 6 days January of 2012
--------------------------------------

     require 'day_set'
	 
	 DaySet.gen(:date => Date.new(2012, 1), :group_number => 6).last
	 
     => [#<Date: 2012-01-31 ((2455958j,0s,0n),+0s,2299161j)>]
     
	 DaySet.gen(:date => Date.new(2012, 1), :group_number => 6, 
                :move_residue => true).last
	 
	 => [#<Date: 2012-01-25 ((2455952j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-26 ((2455953j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-27 ((2455954j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-28 ((2455955j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-29 ((2455956j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-30 ((2455957j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-31 ((2455958j,0s,0n),+0s,2299161j)>]


Generating set of 6 days for year 2012
--------------------------------------


     @args = { :group_number => 6, :move_residue => true }

     DaySet.gen_for_year(2012, @args).each{|s|
      date = s.first
      puts "#{date.year}-#{date.month}--#{date.day}-#{s.last.day}"
     }

