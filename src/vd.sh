#!/bin/bash
# Author: Onur Yildirim (onur@cutepilot.com)

# -------------------------------------
# CONSTANTS
# -------------------------------------

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# -------------------------------------
# IMPORTS
# -------------------------------------

# create if doesn't exist
touch ~/.bash_profile

source ~/.bash_profile
source "$CURRENT_DIR"/shelper.sh
source "$CURRENT_DIR"/workflowHandler.sh

# -------------------------------------
# VARIABLES
# -------------------------------------

yt="$CURRENT_DIR/bin/youtube-dl"
video_url="$1" # "{query}"
download_dir="$HOME/Desktop"
output_format="$download_dir/%(title)s.%(ext)s"
ffmpeg_installed=$(program_exists "ffmpeg")
extract_audio=$(contains_str "$2" "-audio")
play=$(contains_str "$2" "-play")
audio_format="mp3"
options="-i -q -o "$output_format"" # --restrict-filenames
message=""

# -------------------------------------
# PROGRAM ROUTINE
# -------------------------------------

if $extract_audio; then
    if $ffmpeg_installed; then
        options="$options --extract-audio --audio-format $audio_format"
    else
        echo "Failed! Install ffmpeg for audio conversion."
        echo "Type \"vd-help\" for instructions."
        exit 1
    fi
fi

yt_output=$("$yt" $options "$video_url")
download_result=$?

if [ $download_result -eq 0 ]; then
    filepath="$("$yt" $options --get-filename "$video_url")"
    if $extract_audio && $ffmpeg_installed; then filepath="$(remove_ext "$filepath").$audio_format"; fi
    if $play; then
        sleep 2
        open "$filepath"
        echo "Now Playing: $filepath"
    else
        echo "Download complete: $filepath"
    fi
else
    echo "Download failed! ($download_result)"
    echo "Make sure you've entered a valid video URL or parameter. Otherwise, try updating or re-installing Video Downloader."
fi
