DaySet
======

With this gem you can generate a set of any number of days for a month
or year, is useful for example when you have to divide a month
in a fixed number of days, to create table partitions based on a date:


Generating sets of 2 days January of 2012
--------------------------------------

     gem install dayset

     require 'day_set'
	 
	 DaySet.new(:date => Date.new(2012, 1), :group_number => 2).sets.first
	 
	 #=> [#<Date: 2012-01-01 ((2455928j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-02 ((2455929j,0s,0n),+0s,2299161j)>]
 
Generating sets of 6 days January of 2012
--------------------------------------

     require 'day_set'
	 
	 DaySet.new(:date => Date.new(2012, 1), :group_number => 6).sets.last
		 
	 # The last set has only one day because January has 31 days 
	 # 31 % 6 is 1, I have named this set "residue set"
		 
     => [#<Date: 2012-01-31 ((2455958j,0s,0n),+0s,2299161j)>]
     
	 # It generates set of 6 days but if there is a 'residue set' with
     # a number of days lower than group_number / 2 it will be moved to
	 # the previous set.
	 
	 # Take a look that  Date: 2012-01-31 was moved.

     DaySet.new(:date => Date.new(2012, 1), :group_number => 6, 
                :move_residue => true).sets.last
	 
	 => [#<Date: 2012-01-25 ((2455952j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-26 ((2455953j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-27 ((2455954j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-28 ((2455955j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-29 ((2455956j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-30 ((2455957j,0s,0n),+0s,2299161j)>, #<Date: 2012-01-31 ((2455958j,0s,0n),+0s,2299161j)>]


Generating labels of 6 days for year 2012
--------------------------------------

     # it will generate an array of  labels with this format:
	 #  YYYY-MM--(first_day_of_the_set)-(last_day_of_the_set)

     @args = { :group_number => 6, :move_residue => true }
 
     labels = DaySet.gen_for_year(2012, @args).map do |s|
       date = s.first
       "#{date.year}-#{date.month}--#{date.day}-#{s.last.day}"
     end
	
     ["2012-1--1-6", "2012-1--7-12", "2012-1--13-18", "2012-1--19-24", "2012-1--25-31", "2012-2--1-6", "2012-2--7-12", "2012-2--13-18", "2012-2--19-24", "2012-2--25-29", "2012-3--1-6", "2012-3--7-12", "2012-3--13-18", "2012-3--19-24", "2012-3--25-31", "2012-4--1-6", "2012-4--7-12", "2012-4--13-18", "2012-4--19-24", "2012-4--25-30", "2012-5--1-6", "2012-5--7-12", "2012-5--13-18", "2012-5--19-24", "2012-5--25-31", "2012-6--1-6", "2012-6--7-12", "2012-6--13-18", "2012-6--19-24", "2012-6--25-30", "2012-7--1-6", "2012-7--7-12", "2012-7--13-18", "2012-7--19-24", "2012-7--25-31", "2012-8--1-6", "2012-8--7-12", "2012-8--13-18", "2012-8--19-24", "2012-8--25-31", "2012-9--1-6", "2012-9--7-12", "2012-9--13-18", "2012-9--19-24", "2012-9--25-30", "2012-10--1-6", "2012-10--7-12", "2012-10--13-18", "2012-10--19-24", "2012-10--25-31", "2012-11--1-6", "2012-11--7-12", "2012-11--13-18", "2012-11--19-24", "2012-11--25-30", "2012-12--1-6", "2012-12--7-12", "2012-12--13-18", "2012-12--19-24", "2012-12--25-31"]

