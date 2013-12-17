#!/usr/bin/ruby
# Script File: daylog.rb
# Author: Cameron Carroll 2013
# Purpose: Accepts one-off statements and adds them to the appropriate write_everyday file

DOC_DIRECTORY = '/home/cameron/docs/write_everyday/'

month = Time.new.strftime("%B")
day = Time.new.day
file = DOC_DIRECTORY + month

input = ' '
ARGV.each do |arg|
  input += arg + ' '
end

unless File.exists?(file)
  File.new(file, 'w')
end

File.open(file, 'a') do |file|
  date_banner = Time.new.strftime("On %m/%d/%Y, at %I:%M%p:")
  file << date_banner << "\n"
  file << input << "\n" << "\n"
end
