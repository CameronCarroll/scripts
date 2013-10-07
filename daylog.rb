#!/usr/bin/ruby
# script file: daylog.rb
# author: cameron carroll 2013
# purpose:
#     Accepts one-off statements and adds them to the appropriate write_everyday file

DOC_DIRECTORY = '/home/cameron/docs/write_everyday/'

def main
  month = Date.today.strftime("%B")
  day = Time.new.day
  filestring = DOC_DIRECTORY + "#{month}"

  inputstring = ' '
  ARGV.each do |arg|
    inputstring += arg + ' '
  end

  unless File.exists?(filestring)
    File.new(filestring, 'w')
  end

  File.open(filestring, 'a') do |file|
    date_banner = Time.new.strftime("On %m/%d/%Y, at %I:%M%p:")
    file << date_banner << "\n"
    file << inputstring << "\n" << "\n"
  end

end

main
