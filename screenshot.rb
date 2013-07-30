#!/usr/bin/ruby
# script file: screenshot.rb
# author: cameron carroll; created july 2013
# purpose: takes a screenshot using scrot after argv[0] number of seconds
# dependencies: scrot
# configuration & installation:
#                a) replace SCREENSHOT_FOLDER with your own home folder
#                b) select a reasonable MAX_DELAY_TIME
#                c) symlink and chmod +x screenshot.rb into your favorite bin folder

VERSION = '1.3'
SCREENSHOT_FOLDER = '/home/cameron/images/screenshots'
MAX_DELAY_TIME = 20

def shoot()
  time = Time.new
  puts "Taking screenshot at #{time}"
  time = time.to_s[0...-6].gsub(' ', '_').gsub('-', '').gsub(':', '')
  `scrot #{SCREENSHOT_FOLDER}/#{time}.png`
end

def delay_shoot(delay_time)
  puts "Waiting #{delay_time} seconds before taking screenshot"
  sleep(delay_time.to_i) if delay_time.to_i < MAX_DELAY_TIME
  shoot()
end

def main
  puts "screenshot.rb #{VERSION}"
  delay &&= ARGV[0] # assign if it exists

  if delay && delay.numeric?
    delay_shoot(ARGV[0])
  elsif delay && !delay.numeric?
    input = delay # rarely we will call with a proper string, so now we'll just call it input
    if input == 'clear'
      `rm #{SCREENSHOT_FOLDER}/* -rf`
    else
      puts 'unknown input'
    end
  else
    shoot()
  end

end

class String
  def numeric?
    !!(self =~ /^[-+]?[0-9]+$/)
  end
end

main
