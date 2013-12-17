#!/usr/bin/ruby
#
# Script Name: puppy.rb
# Author: Cameron Carroll, December 2013
# Purpose: How old is my puppy?
#

today_yday = Time.now.yday
puppy_birthday_yday = Time.local(2013,9,11).yday
puppy_adoption_yday = Time.local(2013,11,24).yday

puppy_age = today_yday - puppy_birthday_yday
puppy_time_with_us = today_yday - puppy_adoption_yday

def weeks(days)
  days / 7
end

def months(days)
  days / 30
end

puts "Puppy is #{puppy_age} days, #{weeks(puppy_age)} weeks, and #{months(puppy_age)} months old today."
puts "Puppy has been here #{puppy_time_with_us} days, #{weeks(puppy_time_with_us)} weeks, and #{months(puppy_time_with_us)} months."
