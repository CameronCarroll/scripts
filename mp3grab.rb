#!/usr/bin/ruby
# script file: mp3grab.rb
# copyright 2013; cameron carroll
# released under gnu gpl

sources = [
'http://www.youtube.com/watch?v=2JqcpRHxchU',
'http://www.youtube.com/watch?v=ZftuhcuJBRQ',
'http://www.youtube.com/watch?v=G81fXljxbSY',
'https://www.youtube.com/watch?v=XMjERLbzj8w',
'https://www.youtube.com/watch?v=EhaQ_eeA1lI',
'https://www.youtube.com/watch?v=k_7yohrlQv4',
'https://www.youtube.com/watch?v=BVomQtrtMTM',
'https://www.youtube.com/watch?v=lc0cbgdsqdM',
'https://www.youtube.com/watch?v=0kizOG_Et_0',
'https://www.youtube.com/watch?v=3Tc92k7xBoE',
'https://www.youtube.com/watch?v=jx54yvDrM8Y',
'https://www.youtube.com/watch?v=tpL5rnNq39I',
'https://www.youtube.com/watch?v=mVG579ciMlM',
'https://www.youtube.com/watch?v=wjNJ3sE6nvY',
'https://www.youtube.com/watch?v=VgwHgQXZmmk',
'https://www.youtube.com/watch?v=LJ4s4vkMLKM',
'https://www.youtube.com/watch?v=OiXWtjZcfhM',
'https://www.youtube.com/watch?v=yYXC7iZWnQI',
'https://www.youtube.com/watch?v=TbCaPLt03lo',
'https://www.youtube.com/watch?v=Jm8Ev0DUZFM',
'https://www.youtube.com/watch?v=CNGhzZjgll8',
'https://www.youtube.com/watch?v=QMaixnd9uqA'
]

sources.each do |source|
  filename = `vid #{source}`
  file_data = `echo '#{filename}' | mp3_parse`
  puts `echo '#{file_data}' | mp3_update`
  sleep 10
end
