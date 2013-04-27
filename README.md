## Video Downloader (Workflow) for Alfred ##

Video Downloader is an Alfred workflow written in Bash/Shell for easily downloading videos (and/or extracting audio) from various websites such as YouTube, Vimeo, DailyMotion and more... It uses [youtube-dl](http://rg3.github.io/youtube-dl) as the core component.

## Requirements ##
[Alfred 2](http://www.alfredapp.com)
[Python](http://www.python.org) version 2.6, 2.7, or 3.3+
[FFmpeg](http://www.ffmpeg.org) (optional, required for extract-audio feature)

## Supported Sites ##
YouTube, Vimeo, Dailymotion, MetaCafe, Google Video, MTV, Soundcloud, Photobucket Videos, DepositFiles, blip.tv, myvideo.de, Google Plus, The Daily Show / Colbert Nation, The Escapist, CollegeHumor, arte.tv, xvideos, infoq, mixcloud, Stanford Open Content, Youku, XNXX, more... See the full (and updated) list [here](http://rg3.github.io/youtube-dl/documentation.html). 

---

### Audio Extraction ###
For this (vd-audio) feature, you should install FFmpeg yourself manually (because of licensing issues).

One way to install FFmpeg is;

1. Install XCode
2. Install Command Line Tools for Xcode
3. Install MacPorts (from www.macports.org)
4. Install FFmpeg by running the command below in Terminal:

```shell
    $ sudo port install ffmpeg
```

You can append these options to enable support for various codecs and FFmpeg features:

```shell
    +gpl +postproc +lame +theora +libogg +vorbis +xvid +x264 +a52 +faac +faad +dts +nonfree
```

---

## License ##
Video Downloader workflow is released to the public domain. (Do whatever you like with it.)
FFmpeg is a trademark of Fabrice Bellard and it is licensed under LGPL version 2.1
http://www.ffmpeg.org/legal.html
