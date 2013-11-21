#!/usr/bin/ruby

# Script Name: cleantex.rb
# Author: Cameron Carroll, November 2013

VERSION = '1.0'

current_directory = Dir.pwd

puts "Cleantex #{VERSION}"
print "Are you sure you want to delete all '.fdb_latexmk', '.aux', '.log', '.toc' and '.gz' files in [#{current_directory}]? (Y/n): "
confirmation = gets.chomp

case confirmation
when "Y", "y", "yes", "YES", ""
  puts "Ok, I'm doing it."
when "N", "n", "no", "NO"
  puts "Okay nevermind then."
  abort
end

deleted_count = 0

Dir.entries(current_directory).each do |entry|
  extension = File.extname entry
  case extension
  when ".fdb_latexmk", ".aux", ".log", ".toc", ".gz"
    File.delete(current_directory + '/' + entry)
    deleted_count += 1
  end
end

puts "Deleted #{deleted_count} items."
