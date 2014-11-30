#!/usr/bin/env ruby

# given the pattern:
# 1^2+2^3+3^4...19^20 
# print the last 5 char of the total sum
#
# output: 51634

j=0;i=0
20.times {
	i=i+(j**(j+1))
	j+=1
}

puts i.to_s[-5..-1]