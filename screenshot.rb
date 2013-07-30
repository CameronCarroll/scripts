#!/usr/bin/ruby
# script file: screenshot.rb
# author: cameron carroll; created july 2013
# purpose: takes a screenshot using imagemagick import after argv[0] number of seconds
# dependencies: imagemagick

VERSION = '1.1'

def shoot()
  time = Time.new
  puts "Taking screenshot at #{time}"
  time = time.to_s[0...-6].gsub(' ', '_').gsub('-', '').gsub(':', '')
  `scrot ~/images/screenshots/#{time}.png`
end

def delay_shoot(delay_time)
  puts "Waiting #{delay_time} seconds before taking screenshot"
  sleep(delay_time.to_i) if delay_time.to_i < 60
  shoot()
end

def main
  puts "screenshot.rb #{VERSION}"
  delay = ARGV[0] if ARGV[0]
  if delay && delay.numeric?
    delay_shoot(ARGV[0])
  elsif delay && !delay.numeric?
    input = delay # rarely we will call with a proper string, so now we'll just call it input
    if input == 'clear'
      `rm /home/cameron/images/screenshots/* -rf`
    else
      puts 'unknown input'
    end
  end
end

class String
  def numeric?
    !!(self =~ /^[-+]?[0-9]+$/)
  end
end

main
