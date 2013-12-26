#!/usr/bin/ruby
# Script File: daylog.rb
# Author: Cameron Carroll 2013
# Purpose: Accepts one-off statements and adds them to the appropriate write_everyday file
# Version: 1.2
if ARGV.length > 0
  input = ' '
  ARGV.each do |arg|
    input += arg + ' '
  end
else
  TEMPFILE = 'daylog.tmp'
  system("vim #{TEMPFILE}")
  input = ""
  begin
    File.open(TEMPFILE, 'r') do |tempfile|
      while (line = tempfile.gets)
        input << line
      end
    end
  rescue => err
    puts err
    err
  end
  File.delete TEMPFILE
end
DOC_DIRECTORY = '/home/cameron/docs/write_everyday/'
Dir.mkdir(DOC_DIRECTORY) unless Dir.exists?(DOC_DIRECTORY)

month = Time.new.strftime("%B")
day = Time.new.day
file = DOC_DIRECTORY + month


unless File.exists?(file)
  File.new(file, 'w')
end

File.open(file, 'a') do |file|
  date_banner = Time.new.strftime("On %m/%d/%Y, at %I:%M%p:")
  file << date_banner << "\n"
  file << input << "\n" << "\n"
end
