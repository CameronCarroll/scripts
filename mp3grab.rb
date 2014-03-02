#!/usr/bin/ruby
# script file: mp3grab.rb
# copyright 2013; cameron carroll
# released under gnu gpl

sources = [
  'https://www.youtube.com/watch?v=Kxlq7B0i7p4',
  'https://www.youtube.com/watch?v=oXhYxDWgk9c',
  'https://www.youtube.com/watch?v=hERrQJEJ96A',
  'https://www.youtube.com/watch?v=TQLIpbqJsfg',
  'https://www.youtube.com/watch?v=78KqFgSCLao',
  'https://www.youtube.com/watch?v=yyhPl1o-g9E',
  'https://www.youtube.com/watch?v=bHIRoiT8uA4',
  'https://www.youtube.com/watch?v=gdEtc00kGM4',
  'https://www.youtube.com/watch?v=T_-w-_-fIOI',
  'https://www.youtube.com/watch?v=2W83EWg7gnM',
  'https://www.youtube.com/watch?v=9DVtSP_fK7k',
  'https://www.youtube.com/watch?v=S3vDBPO0FcQ',
  'https://www.youtube.com/watch?v=Dg5xZnB2F_4',
  'https://www.youtube.com/watch?v=eK0sbj4dsKE',
  'https://www.youtube.com/watch?v=td_sGb2CRMo',
  'https://www.youtube.com/watch?v=3Cq3p3ab564',
  'https://www.youtube.com/watch?v=7ae2TWxQ2L4',
  'https://www.youtube.com/watch?v=pe2puEIgzi8',
  'https://www.youtube.com/watch?v=1y7asJHWV0Q',
  'https://www.youtube.com/watch?v=SQRUQEK1fTs',
  'https://www.youtube.com/watch?v=GckDQxPCFKE',
  'https://www.youtube.com/watch?v=GuhVSxHESMw',
  'https://www.youtube.com/watch?v=RIwPTjVbIaA',
  'https://www.youtube.com/watch?v=uBaSpcmimww',
  'https://www.youtube.com/watch?v=fGNlYsqDeZ4',
  'https://www.youtube.com/watch?v=MXGgRhcz_tQ',
  'https://www.youtube.com/watch?v=egdydYFsqTw',
  'https://www.youtube.com/watch?v=_lDjbJUXFK0',
  'https://www.youtube.com/watch?v=GbPdcgdduqs',
  'https://www.youtube.com/watch?v=M5OndIQ0MH0',
  'https://www.youtube.com/watch?v=em6RpkqMmZA',
  'https://www.youtube.com/watch?v=Yqeb5PsqY8M',
  'https://www.youtube.com/watch?v=-9UARETvA68'
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

