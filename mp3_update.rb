#!/usr/bin/ruby
# script file: mp3_update.rb
# author: cameron carroll; created august 2013
# purpose: uses ruby-taglib to assign artist and title to an mp3
# dependencies: ruby-taglib

require 'taglib'

def parse_arguments()
  filename = ARGV[0] if ARGV[0]
  artist = ARGV[1] if ARGV[1]
  title = ARGV[2] if ARGV[2]
  return filename, artist, title
end

def main()
  filename, artist, title = parse_arguments
  if File.exists? filename
    TagLib::MPEG::File.open(filename) do |file|
      tag = file.tag()
      tag.artist = artist if artist
      tag.title = title if title
      file.save
      puts 0
    end
  else
    puts 1
  end
end

main