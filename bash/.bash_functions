#!/usr/bin/env bash

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# Change working directory to the top-most Finder window location
function cdf() {
  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# Create a git.io short URL
function gitio() {
  if [ -z "${1}" -o -z "${2}" ]; then
    echo "Usage: \`gitio slug url\`";
    return 1;
  fi;
  curl -i https://git.io/ -F "url=${2}" -F "code=${1}";
}

# `s` with no arguments opens the current directory in Sublime Text, otherwise
# opens the given location
function s() {
  if [ $# -eq 0 ]; then
    subl .;
  else
    subl "$@";
  fi;
}

# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
function v() {
  if [ $# -eq 0 ]; then
    vim .;
  else
    vim "$@";
  fi;
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRX;
}

function shortpwd() {
  cwd=$(pwd | sed "s#${HOME}#~#g" | perl -F/ -ane 'print join( "/", map { $i++ < @F - 1 ?  substr $_,0,1 : $_ } @F)')
  echo -n $cwd
}
