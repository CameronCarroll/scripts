#!/usr/bin/ruby
# script file: vid.rb
# author: cameron carroll; created july 2013
# purpose: uses viddl-rb to grab youtube video audio tracks
# dependencies: viddl-rb

DOWNLOAD_PATH = "/home/cameron/music/downloadtest"
VERSION = "1.3"

require 'pry'

def download_video(url)

  $stderr.puts `viddl-rb -d curl #{url} --save-dir #{DOWNLOAD_PATH}`
end

def grab_title(url)
  `viddl-rb #{url} -t`.lines.map(&:chomp).last
end

def convert_video(path)

  mp3_path = File.dirname(path) + '/' + File.basename(path, ".*") + '.mp3'
  if path =~ /.mp4\z/i
    `ffmpeg -i #{path} -b:a 320K -vn #{mp3_path}`
  elsif path =~ /.webm\z/i
    `ffmpeg -i #{path} -b:a 320K -acodec libmp3lame -aq 4 #{mp3_path}`
  end
  return mp3_path
end

def main
  if ARGV[0]
    url = ARGV[0]
    title = grab_title(url)
    video_file_path = DOWNLOAD_PATH + "/" + title
    download_video(url)
    if File.size? video_file_path
      audio_path = convert_video(video_file_path)
      if File.exists? audio_path
        File.delete video_file_path
        puts audio_path
      end
    else
      puts 'vid.rb improper exit'
    end
    
  else
    puts 0
  end
end

main