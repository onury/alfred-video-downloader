#!/bin/bash
# Author: Onur YILDIRIM (oy@onuryildirim.com)

# ----------------------------------------------
#   FILE/SCRIPT HELPER FUNCTIONS
# ----------------------------------------------

# Gets the path of the specified program.
function program_path() {
    echo $(type -p "$1") # echo $(which "$1")
}

# Checks whether the specified program exists.
# example:
#       if $(program_exists "git"); then ...
function program_exists() {
    local ppath=$(program_path "$1")
    [ -n "$ppath" ] && echo true || echo false
}

# ----------------------------------------------
#   STRING HELPER FUNCTIONS
# ----------------------------------------------

# Converts the given string to upper case.
# example: 
#       upper "some string" # SOME STRING
function upper {
    echo $1 | tr '[a-z]' '[A-Z]'
}
# Converts the given string to lower case.
function lower {
    echo $1 | tr '[A-Z]' '[a-z]'
}

# Checks whether a string contains the given sub-string.
# example: 
#       is_2013=$(contains_str "2013-04-10" "2013-")
function contains_str() {
    [[ "$1" == *"$2"* ]] && echo true || echo false
}

# Removes the extension portion of a (file name) string.
# example: 
#       filename=$(remove_extension "somefile.txt")
function remove_extension() {
    echo "$1" | cut -f1 -d'.'
}

# Removes new-line (\n) characters from the given string.
# example:
#       no_new_lines=$(remove_newlines "$input_string")
function remove_newlines() {
    echo "$1" | sed 's/\\n//g'
}

# Gets the value of the specified property name from a JSON string.
# Parameter $1 should be a valid JSON.
# example:
#       json_value=$(get_json_value "$json" "$prop_name")
function get_json_value() {
    echo "$1" | sed -E -n 's/^.*"'$2'"(: |: ")([^",}]*).*$/\2/gp'
}

# Escapes special characters in the given string.
# example:
#       escaped_string=$(escape "$input_string")
function escape() {
    echo "$1" | sed -e 's/\//\\\//g' -e 's/\&/\\\&/g' -e 's/\n/\\\n/g'
}

# ----------------------------------------------
#   ARRAY HELPER FUNCTIONS
# ----------------------------------------------

function in_array() {
    [[ "$1[@]" =~ "$2 " || "$1[${#1[@]-1]}" == "$2" ]] && echo true || echo false
}

# ----------------------------------------------
#   DATE/TIME HELPER FUNCTIONS
# ----------------------------------------------

# Converts seconds to formatted time string.
# example:
#       secs_to_time 4000 # 01:06:40
function secs_to_time() {
    ((h=$1/3600))
    ((m=($1%3600)/60))
    ((s=$1%60))
    printf "%02d:%02d:%02d\n" $h $m $s
}

# Inserts delimeter dashes to a (number-only) date string.
# example:
#       dash_date "20130410" # 2013-04-10
#       dash_date "20130410" "/" # 2013/04/10
function dash_date() {
    d=$2 # delimeter
    if [ -z $d ]; then d="-"; fi
    echo ${1:0:4}$d${1:4:2}$d${1:6:2}
}




