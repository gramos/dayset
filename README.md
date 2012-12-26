dayset
======

Generate a set of any number of days of a month

     @args = { :group_number => 6, :move_residue => true }

     DaySet.gen_for_year(2012, @args).each{|s|
      date = s.first
      puts "#{date.year}-#{date.month}--#{date.day}-#{s.last.day}"
     }

