#!/usr/bin/ruby
#
# Script Name: puppy.rb
# Author: Cameron Carroll, December 2013
# Purpose: How old is my puppy?
#


today = Time.now
birthday = Time.local(2013,9,11)
adoption = Time.local(2013,11,24)

age = ((today - birthday) / 3600 / 24).to_i
time_with_us = ((today - adoption) / 3600 / 24).to_i

def weeks(days)
  days / 7
end

def months(days)
  days / 30
end

def months_and_weeks(days)
  remainder = days % 30
  "#{months(days)} months, #{weeks(remainder)}"
end

puts "Puppy has been here #{time_with_us} days."
puts "She is " + months_and_weeks(age) + " weeks old."
