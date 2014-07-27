Video Downloader (workflow) for Alfred

Video Downloader is an Alfred workflow written in Bash/Shell for easily downloading videos (and/or extracting audio) from various websites such as YouTube, Vimeo, DailyMotion and more... It uses youtube-dl as the core component.

Created by Onur Yildirim (onur@cutepilot.com)
youtube-dl (by Ricardo Garcia Gonzalez, rg3.github.io)

Requirements:
Python version 2.6, 2.7, or 3.3+
FFmpeg (optional, required for extract-audio feature)

Supported sites:
YouTube, Vimeo, Dailymotion, MetaCafe, Google Video, MTV, Soundcloud, Photobucket Videos, DepositFiles, blip.tv, myvideo.de, Google Plus, The Daily Show / Colbert Nation, The Escapist, CollegeHumor, arte.tv, xvideos, infoq, mixcloud, Stanford Open Content, Youku, XNXX, more...

––––––––––––––––––––––––––––––––––––––

For extract-audio feature (vd-audio), you should install FFmpeg yourself manually (because of licensing issues).

One way to install FFmpeg is;

1. Install XCode
2. Install Command Line Tools for Xcode
3. Install MacPorts (from www.macports.org)
4. Install FFmpeg by running the command below in Terminal:

            $ sudo port install ffmpeg

You can append these options to enable support for various codecs and FFmpeg features:

+gpl +postproc +lame +theora +libogg +vorbis +xvid +x264 +a52 +faac +faad +dts +nonfree

FFmpeg is a trademark of Fabrice Bellard and it is licensed under LGPL version 2.1
http://www.ffmpeg.org/legal.html