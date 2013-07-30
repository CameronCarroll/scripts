cameron's ruby scripts
----------------------

screenshot.rb:
==============
Created: July 2013
Last Updated: July 2013 (1.4)
Purpose: takes a screenshot using scrot after argv[0] number of seconds
Dependencies: scrot
Configuration & Installation:
    a) replace SCREENSHOT_FOLDER with your own home folder
    b) select a reasonable MAX_DELAY_TIME
    c) symlink and chmod +x screenshot.rb into your favorite bin folder
Usage:
	screenshot.rb # Take a screenshot immediately
	screenshot.rb 10 # wait 10 seconds before taking screenshot
	screenshot.rb clear # clear screenshots folder
