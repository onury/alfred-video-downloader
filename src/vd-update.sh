#!/bin/bash

# -------------------------------------
# CONSTANTS
# -------------------------------------

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# -------------------------------------
# VARIABLES
# -------------------------------------

yt="$CURRENT_DIR/bin/youtube-dl"

# -------------------------------------
# PROGRAM ROUTINE
# -------------------------------------

if [ -f "$yt" ]; then
    update_result=$("$yt" -U)
    echo $update_result
else
    echo "Update failed! Please re-install Video Downloader."
fi