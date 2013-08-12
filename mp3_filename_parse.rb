#!/usr/bin/ruby
# script file: mp3_filename_parse.rb
# author: cameron carroll; created august 2013
# purpose: strips apart filenames downloaded from youtube into artist/title
# dependencies:

require 'pathname'
require 'pry'

def parse_arguments()
  filename = ARGF.read
  return filename
end

def main()
  test_files = Dir["/home/cameron/music/downloads/*"]
  real_filename = parse_arguments
  filename = Pathname.new(real_filename).basename.to_s
  filename = filename.chomp(File.extname(filename))
  filename = filename.split('___')
  artist, title, filename = clean(filename)
  puts real_filename.chomp, filename.chomp, artist.chomp, title.chomp
end


def clean(mp3_info)
  artist, title, filename = nil, nil, nil
  special = false
  artist, filename_artist = parse_artist(mp3_info[0])

  if mp3_info.length > 1
    title_pieces = mp3_info[1].split('__')
    title, filename_title = parse_title(title_pieces[0])
  end

  if title_pieces && title_pieces.length > 2
    $stderr.puts 'ERROR: Cant parse this special case. Tag it by hand.'
    abort
  end

  if title_pieces && title_pieces.length > 1 && !special
    note, filename_note = parse_note(title_pieces[1])
  end

  if note
    title = title + ' ' + note
    filename_title = filename_title + '_' + filename_note
  end

  
  if filename_title
    filename = filename_artist + '_' + filename_title
  else
    filename = filename_artist
  end

 artist ||= ''
 title ||= ''
 filename ||= ''
 return artist, title, filename
end

def parse_artist(artist_string)
  artist_string = clean_outside(artist_string)
  artist = artist_string.gsub('_', ' ')
  filename_artist = artist_string.gsub('_', '')
  return artist, filename_artist
end

def parse_title(title_string)
  title_string = clean_outside(title_string)
  title = title_string.gsub('_', ' ')
  filename_title = title_string.gsub('_', '')
  return title, filename_title
end

def parse_note(note_string)
  note_string = clean_outside(note_string)
  note = '(' + note_string.gsub('_', ' ') + ')'
  filename_note = note_string.gsub('_', '')
  return note, filename_note
end

def clean_outside(part)
  part = clean_first_characters(part) 
  part = clean_last_characters(part)
  return part
end

def clean_last_characters(part)
  ultimate_character_match = part[-1].match(/[^a-z|\d]/i)
  penultimate_character_match = part[-2].match(/[^a-z|\d]/i) if part[-2]

  if ultimate_character_match && penultimate_character_match
    return part[0..-3]
  elsif ultimate_character_match
    return part[0..-2]
  else
    return part
  end
end

def clean_first_characters(part)
  first_character_match = part[0].match(/[^a-z|\d]/i)
  second_character_match = part[1].match(/[^a-z|\d]/i) if part[1]

  if first_character_match && second_character_match
    return part[2..-1]
  elsif first_character_match
    return part[1..-1]
  else
    return part
  end
end

main()