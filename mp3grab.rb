#!/usr/bin/ruby
# script file: mp3grab.rb
# copyright 2013; cameron carroll
# released under gnu gpl

sources = [
'https://www.youtube.com/watch?v=jx54yvDrM8Y',
'https://www.youtube.com/watch?v=tpL5rnNq39I'
]

def get_video(source)
  filename = `vid #{source}`
  file_data = `echo '#{filename}' | mp3_parse`
  puts `echo '#{file_data}' | mp3_update`
end

if ARGV[0]
  get_video(ARGV[0])
else
  sources.each do |source|
    get_video(source)
   sleep 10
  end
end

