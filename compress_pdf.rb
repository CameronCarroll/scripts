#!/usr/bin/ruby
#
# Script File: compress_pdf.rb
# Purpose: Feeds filename into ghostscript to compress it.
if ARGV.first
  file = ARGV.first
  puts file
  if file && File.exists?(file)
    puts `gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=#{file}c #{file}`
  end
else
  Dir["*.pdf"].each do |pdf_file|
    `pdfcompress #{pdf_file} >/dev/null`
  end
end
