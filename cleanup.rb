#!/usr/bin/ruby
#script file: cleanup.rb
#copyright 2013; cameron carroll
#released under GNU GPL



def main()
  `rm /home/cameron/music/downloads/*.mp4`
  `rm /home/cameron/music/downloads/*.webm`
end

main()
