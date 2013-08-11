#!/usr/bin/ruby
# script file: mp3_update.rb
# author: cameron carroll; created august 2013
# purpose: uses ruby-taglib to assign artist and title to an mp3
# dependencies: ruby-taglib

require 'pry'

require 'taglib'

def parse_arguments()
  raw_input = ARGF.read
  input = raw_input.split("\n")
  real_filename = input[0]
  filename = input[1]
  artist = input[2]
  title = input[3]
  return real_filename, filename, artist, title
end

def main()
  real_filename, filename, artist, title = parse_arguments
  if File.exists? real_filename
    TagLib::MPEG::File.open(real_filename) do |file|
      tag = file.tag()
      puts 'artist: ' + artist
      puts 'title: ' + title
      tag.artist = artist if artist
      tag.title = title if title
      file.save
    end
    File.rename(real_filename, File.dirname(real_filename) + '/' + filename + '.mp3')
  else
    puts 1
  end
end

main