cameron's ruby scripts:
----------------------
<br />
mp3grab.rb
==========

Created: August 2013

Last Updated: August 2013 (1.0)

Purpose: orchestrates vid.rb, mp3_filename_parse.rb and mp3_update.rb to grab
videos from youtube, convert them to mp3, and (hopefully) update the metadata
with artist and title.

Dependencies:

    vid.rb
    mp3_filename_parse.rb
    mp3_update.rb
    (all from this repository)
    
Usage:
    
    mp3grab.rb "path-to-youtube-video-without-playlist-data"
    mp3grab.rb "https://www.youtube.com/watch?v=R3Gd8rfiKCo"
    
vid.rb
======

Created: July 2013

Last Updated: August 2013 (1.2)

Purpose: Part of the mp3grab.rb pipeline or usable alone, this script grabs a
youtube video using viddl-rb and converts it into mp3 using ffmpeg.

Dependencies:

    ffmpeg
    viddl-rb
    
Usage:

    vid.rb "https://www.youtube.com/watch?v=R3Gd8rfiKCo"
    (or as part as mp3grab.rb)
    
mp3_filename_parse.rb
=====================

Created: August 2013

Last Updated: August 2013

Purpose: Dissects the 'title' string which viddl-rb grabs from youtube
and attempts to get artist, title, and any feat/remix notes.

Usage:

    (pipe in)
    filename (as part of mp3grab) or title string
    
    (pipes out as single string, separated by newlines)
    original filename/title string
    cleaned up filename
    artist
    title
    
mp3_update.rb
=============

Created: August 2013

Last Updated: August 2013 (1.0)

Purpose: Part of the mp3grab.rb pipeline, this script updates an mp3 file's
title and artist metadata and also renames or moves it.

Dependencies:

    taglib
    
Usage:

    (pipe in as a single string, separated by newlines:)
    old_filename
    new_filename
    artist
    title
    
screenshot.rb:
==============

Created: July 2013

Last Updated: July 2013 (1.4)

Purpose: takes a screenshot using scrot after argv[0] number of seconds

Dependencies: 

    scrot

Configuration & Installation:

    a) replace SCREENSHOT_FOLDER with your own home folder
    b) select a reasonable MAX_DELAY_TIME
    c) symlink and chmod +x screenshot.rb into your favorite bin folder

Usage:

     screenshot.rb            # Take a screenshot immediately
     screenshot.rb 10       # wait 10 seconds before taking screenshot
     screenshot.rb clear   # clear screenshots folder
     
cpufreq.rb:
===========

Created: July 2013

Last Updated: August 2013

Purpose: Simply prints out a grep of /proc/cpuinfo, yielding cpu frequencies

Usage: 

    cpufreq.rb -->
                #cpu MHz      : 1407.000
                #cpu MHz    : 1344.000
                #cpu MHz    : 1533.000
                #cpu MHz    : 1596.000
                
cleanup.rb
==========

Created: August 2013

Last Updated: August 2013

Purpose: Just deletes some specific folders for now.

