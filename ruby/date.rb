#!/usr/bin/env ruby

# we know for sure that 01/01/1900 was a Monday
#
# 30 days counts November with April, June and September 
# with 28 there is one 
# all the rest have 31
#
# one every four years and years divisible by 400 are leap years,
#
# print the count of all sundays at first of the month
# from 01/01/1901 to 01/01/2014
#
# output: 194

#puts "01/01/1900 is Monday? "+Date.new(1900,1,1).monday?.to_s

######################## The Easy Way ########################

require 'date'
days = (Date.new(1901,1,1)..Date.new(2014,1,1)).select {|d| d.day == 1}
count=0
days.each {|d|
	if d.sunday? then
		count+=1
	end
}
puts count

######################## The Other Way ########################

count=0
ma={1=>31,2=>28,3=>31,4=>30,5=>31,6=>30,7=>31,8=>31,9=>30,10=>31,11=>30,12=>31}
d=0;m=1;y=1900
start_d=1;start_m=1;start_y=1901
stop_d=1;stop_m=1;stop_y=2014

loop do
	if (d + 7 > ma[m]) then
		d = (d + 7) - ma[m]
		if m == 12 then
			m = 1
			y += 1
			if y % 4 != 0 then 
				ma[2] = 28
			else
				if y % 100 != 0 then 
					ma[2] = 29
				else 
					if y % 400 != 0 then 
						ma[2] = 28
					else 
						ma[2] = 29
					end
				end
			end
		else
			m += 1
		end
	else 
		d += 7
	end
	if (d == 1) and (y>=start_y and m>=start_m and d>=start_d) then
		count += 1
		#puts d.to_s+" "+m.to_s+" "+y.to_s
	end
	break if !((y<stop_y) or (m<stop_m) or (d<stop_d))
end

puts count