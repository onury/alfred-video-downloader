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

# -------------------------------------
# VARIABLES
# -------------------------------------

yt="$CURRENT_DIR/bin/youtube-dl"
video_url="$1" # "{query}"
download_dir="$HOME/Desktop"
output_format="$download_dir/%(title)s.%(ext)s"
options="-i -q -o "$output_format"" # --restrict-filenames

# -------------------------------------
# PROGRAM ROUTINE
# -------------------------------------

video_title="$("$yt" $options --get-title --write-info-json "$video_url")"
result=$?

if [ $result -eq 0 ]; then
    filepath="$("$yt" $options --get-filename "$video_url")"
    filepath="$filepath.info.json"
    info_json="$(<"$filepath")" # $(cat "$filepath.info.json")
    info_json=$(remove_newlines "$info_json")

    # title=$(get_json_value "$info_json" "fulltitle")
    vid=$(get_json_value "$info_json" "id")
    duration=$(get_json_value "$info_json" "duration")
    uploader=$(get_json_value "$info_json" "uploader")
    upload_date=$(get_json_value "$info_json" "upload_date")
    description=$(get_json_value "$info_json" "description")
    ext=$(get_json_value "$info_json" "ext") # | tr '[a-z]' '[A-Z]'
    format=$(get_json_value "$info_json" "format")

    echo "Info file is created: $filepath"
    echo "––––––––––––––––––––––––––––––––––––––"
    echo "Video URL: $video_url"
    echo "Video Title: $video_title"
    echo "ID: $vid"
    echo "Video Format: $(upper $ext)"
    echo "Resolution: $(echo $format | sed 's/.*\- //')"
    echo "Duration: $(secs_to_time $duration)"
    echo "Uploaded by: $uploader"
    echo "Upload Date: $(delim_date $upload_date)"
    echo
    echo "Description:"
    echo "$description"
    echo "..."
else
    echo "Failed to retrieve data from \"$video_url\"! ($result) "
    echo "Make sure you've entered a valid video URL or parameter. Otherwise, try updating or re-installing Video Downloader."
fi

