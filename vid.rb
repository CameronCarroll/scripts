#!/usr/bin/ruby
# script file: vid.rb
# author: cameron carroll; created july 2013
# purpose: uses viddl-rb to grab youtube video audio tracks
# dependencies: viddl-rb

DOWNLOAD_PATH = "/home/cameron/music/downloadtest"
VERSION = "1.2"

def download_video(url)

  $stderr.puts `viddl-rb #{url} --save-dir #{DOWNLOAD_PATH}`
end

def grab_title(url)
  `viddl-rb #{url} -t`.lines.map(&:chomp).last
end

def convert_video(path)
  mp3_path = path[0..-4] + 'mp3'
  `ffmpeg -i #{path} -b:a 320K -vn #{mp3_path}`
  return mp3_path
end

def main
  if ARGV[0]
    url = ARGV[0]
    title = grab_title(url)
    video_file_path = DOWNLOAD_PATH + "/" + title
    download_video(url)
    audio_path = convert_video(video_file_path)
    if File.exists? audio_path
      File.delete video_file_path
      puts audio_path
    end
  else
    puts '0'
  end
end

main