#!/usr/bin/env bash

for file in ~/.{aliases,functions,exports,dockerfunc}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file

# Autocorrect typos in path names when using `cd`.
shopt -s cdspell

# Append to the Bash history file, rather than overwriting it.
shopt -s histappend

# Don't automatically run history commands.
shopt -s histverify

# Case-insensitive globbing (used in pathname expansion).
shopt -s nocaseglob

# Enable forward-i-search
[[ $- == *i* ]] && stty -ixon

# Bash completion
if [[ -f "$(brew --prefix)/etc/bash_completion" ]]; then
  source "$(brew --prefix)/etc/bash_completion"
fi
