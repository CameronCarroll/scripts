#!/bin/ruby

# scan.rb -- Cameron Carroll, 5/15/14
#
# Purpose: A helper for scanning multiple pages and building pdf documents out of them.
#           Scans and binds sheets together, compresses and renames.
#
# Usage:
#
#   One-off Mode: Accepts a filename, then scans a single sheet and compresses it.
#                 The only argument required is the filename.
#
#   Batch Mode: Accepts a filename, then enters a loop allowing you to scan multiple sheets in a row. Then binds everything together, compresses it, and renames accordingly.
#                Simply include 'batch', '-b', or '-batch' in the arguments in addition to the filename.

batch_mode = nil
USAGE = "Usage: 'scan.rb {filename}' or 'scan.rb {filename} -batch'"

ARGV.each do |arg|
	if arg =~ /batch/i || arg =~ /-b/i
		batch_mode = true
		ARGV.delete arg
	end
end

filename = ARGV.first

if batch_mode
	pages = 0
	finished = false
	until finished
		puts "(Prep next page.) -- Continue scanning? (Y / n)"
		value = STDIN.gets.chomp
		if value =~ /n/i
			finished = true
		elsif value =~ /y/i || value == ''
			pages += 1
			system("hp-scan --file=#{pages}.png")
			system("convert #{pages}.png #{pages}.pdf")
			system("rm #{pages}.png")
		else
			puts "I don't understand what you're trying to say. Y for yes, N for no."
		end
	end

	if pages >= 1
		list_string = ''
		for ii in 1..pages
			list_string += "#{ii}.pdf "
		end
		list_string += filename
	else
		puts "Quitting -- Didn't scan any pages."
	end


	system("pdfunite #{list_string}")
	system("pdfcompress #{filename}")

	for ii in 1..pages
		system("rm #{ii}.pdf")
	end

else
	system("hp-scan --file=#{filename}.png")
	system("convert #{filename}.png #{filename}")
	system("rm #{filename}.png")
	system("pdfcompress #{filename}")
end