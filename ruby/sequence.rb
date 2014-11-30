#!/usr/bin/env ruby

# given the following pattern:
# 1250 = 1^2+5^0 = 1+1 = 2
#
# print the resulting number of this sequence:
# 4910293057285623823983012910451034
#
# output: 378550

s="4910293057285623823983012910451034"
if s.size % 2 == 0 then
	puts s.size
	i=0;sum=0
	(s.size/2).times {
		#puts i 
		sum+=s[i].to_i**s[i+1].to_i
		i+=2
	}
	puts sum
else
	puts "error"
end