#!/bin/bash
# sHelper Script v.0.41
# © 2013, Onur Yildirim (onur@cutepilot.com)

# ----------------------------------------------
#   FILE/SCRIPT HELPER FUNCTIONS
# ----------------------------------------------

# Gets the path of the specified program.
program_path() {
    echo $(type -p "$1") # echo $(which "$1")
}

# Checks whether the specified program exists.
# example:
#       if $(program_exists "git"); then ...
program_exists() {
    local ppath=$(program_path "$1")
    [ -n "$ppath" ] && echo true || echo false
}

# Prompt Mac OS password dialog for authorizing a script (such as a sudo ...)
os_authorize() {
    echo "$(osascript -e 'do shell script "'"sudo $@"'" with administrator privileges')"
}

# ----------------------------------------------
#   STRING HELPER FUNCTIONS
# ----------------------------------------------

# Converts the given string to upper case.
# example: 
#       upper "some string" # SOME STRING
upper() {
    echo $1 | tr '[a-z]' '[A-Z]'
}
# Converts the given string to lower case.
lower() {
    echo $1 | tr '[A-Z]' '[a-z]'
}

# Checks whether a string contains the given sub-string.
# example: 
#       found=$(contains_str "this is some text" "text")
contains_str() {
    [[ "$1" == *"$2"* ]] && echo true || echo false
}

# Checks whether a string starts with the given sub-string.
# example: 
#       found=$(starts_with "this is some text" "this")
starts_with() {
    [[ "$1" == "$2"* ]] && echo true || echo false
}

# Checks whether a string ends with the given sub-string.
# example: 
#       found=$(ends_with "this is some text" "text")
ends_with() {
    [[ "$1" == *"$2" ]] && echo true || echo false
}

# Removes the extension portion of a (file name) string.
# example: 
#       filename=$(remove_ext "somefile.txt") # somefile
remove_ext() {
    echo "${1%.*}"
}

# Removes the extension portion of a (file name) string.
# example: 
#       filename=$(get_ext "somefile.txt") # txt
get_ext() {
    echo "${1##*.}"
}

# Removes new-line (\n) characters from the given string.
# example:
#       no_new_lines=$(remove_newlines "$input_string")
remove_newlines() {
    echo "$1" | sed 's/\n//g'
}

# Removes tab characters from the given string.
# example:
#       no_tabs=$(remove_tabs "$input_string")
remove_tabs() {
    echo "$1" | tr -d '\011'
}

# Gets the value of the specified property name from a JSON string.
# Parameter $1 should be a valid JSON.
# example:
#       json_value=$(get_json_value "$json" "$prop_name")
get_json_value() {
    echo "$1" | sed -E -n 's/^.*"'$2'"(: |: "|:|:")([^",}]*).*$/\2/gp'
}

# Escapes special characters in the given string.
# example:
#       escaped_string=$(escape "$input_string")
escape() {
    echo "$1" | sed -e 's/\//\\\//g' -e 's/\&/\\\&/g' -e 's/\n/\\\n/g'
}

# Prints the given character (or string) for specified number of times.
# usage:
#       reprint "*" 20
reprint() {
    local str=$1
    local num=$2
    v=$(printf "%-${num}s" "$str")
    echo "${v// /$str}"
}

dot_line() {
    local str="$1"
    local target="$2"
    local total_chars=$3
    local ndots=$((total_chars-${#str}-3))
    local dots="$(reprint "." $ndots)"
    echo "$str" | sed 's/'$target'/ '$dots' /g'
}

# ----------------------------------------------
#   ARRAY HELPER FUNCTIONS
# ----------------------------------------------

# Checks whether the given array contains the specified string.
# Arguments:
#   $1  string - The string to be searched for.
#   $2  array - The array to be searched. Should be passed as "${arr[@]}".
# Example:
#   arr=("cat 1" dog "blue bird" monkey)
#   in_array "monkey" "${arr[@]}"
in_array () {
    local e
    for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
    return 1
}

# ----------------------------------------------
#   DATE/TIME HELPER FUNCTIONS
# ----------------------------------------------

# Converts seconds to formatted time string.
# example:
#       secs_to_time 4000 # 01:06:40
secs_to_time() {
    ((h=$1/3600))
    ((m=($1%3600)/60))
    ((s=$1%60))
    printf "%02d:%02d:%02d\n" $h $m $s
}

# Inserts delimeter dashes to a (number-only) date string.
# example:
#       dash_date "20130410" # 2013-04-10
#       dash_date "20130410" "/" # 2013/04/10
dash_date() {
    d=$2 # delimeter
    if [ -z $d ]; then d="-"; fi
    echo ${1:0:4}$d${1:4:2}$d${1:6:2}
}
