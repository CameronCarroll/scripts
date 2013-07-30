#!/usr/bin/ruby
# script file: vid.rb
# author: cameron carroll; created july 2013
# purpose: uses viddl-rb to grab youtube video audio tracks
# dependencies: viddl-rb

DOWNLOAD_PATH = "/home/cameron/music/downloads"

def download_video(url)
  `viddl-rb #{url} --save-dir #{DOWNLOAD_PATH}`
end

def grab_title(url)
  `viddl-rb #{url} -t`.lines.map(&:chomp).last
end

def convert_video(path)
  mp3_path = path[0..-4] + 'mp3'
  `ffmpeg -i #{path} -b:a 320K -vn #{mp3_path}`
  return mp3_path
end

if ARGV[0]
  url = ARGV[0]
  title = grab_title(url)
  video_file_path = DOWNLOAD_PATH + "/" + title
  puts "found video: " + title
  puts "saving video to: " + video_file_path
  download_video(url)
  puts "converting video to audio..."
  audio_path = convert_video(video_file_path)
  puts "deleting video file"
  if File.exists? audio_path
    File.delete video_file_path
  end
else
  puts "requires an argument. don't forget to stick it in quotes!"
end