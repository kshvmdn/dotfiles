### SHELL OPTIONS ##############################################################

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Don't automatically run history commands.
shopt -s histverify

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Enable forward-i-search
[[ $- == *i* ]] && stty -ixon

### AUTOCOMPLETION #############################################################

# Bash completion
[[ -f "$(brew --prefix)/etc/bash_completion" ]] && \
  source "$(brew --prefix)/etc/bash_completion"

# Git completion
[[ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]] && \
  source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"

### ALIASES ####################################################################

# Always enable colored `grep` output
alias grep='grep --color=auto'

# File/directory listing
alias ls="ls -F"
alias ll="ls -lhiF"
alias la="ls -alhiF"
alias lt="ls -Alhrt"

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd'
alias -- -='cd -'

# Shortcuts
alias dev='cd ~/dev'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias school='cd ~/dev/src/github.com/kshvmdn/uoft'

# Hide/show all Desktop icons
alias desktop-hide='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'
alias desktop-show='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'

# Empty the Trash on all mounted volumes and the main HDD.
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Hide/show hidden files in Finder
alias hidden-hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias hidden-show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'

# IP addresses
alias iploc='ipconfig getifaddr en0'
alias ippub='dig +short myip.opendns.com @resolver1.opendns.com'

# Reload the shell (i.e. invoke as a login shell)
alias reload='exec $SHELL -l'

# :)
alias :q='exit 1'

### FUNCTIONS  #################################################################

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# Change working directory to the top-most Finder window location
function cdf() {
  if [ "$(uname)" != "Darwin" ]; then
    exit 1
  fi

  cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
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

# Shortened $PWD
function shortpwd() {
  cwd=$(pwd | sed "s#${HOME}#~#g" | perl -F/ -ane 'print join( "/", map { $i++ < @F - 1 ?  substr $_,0,1 : $_ } @F)')
  echo -n $cwd
}

### EXPORTS ####################################################################

# Prompts
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\033]0;\$(shortpwd)\007\]\W\$(__git_ps1 ' (%s)') \[$(tput bold)$(tput setaf 5)\]\$\[$(tput sgr0)\] "

# Editor
export EDITOR='vim'

# Increase Bash history nsize; allow 32³ entries (default is 500); omit
# duplicates and commands that begin with a space from history.
export HISTSIZE="32768"
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL="ignoreboth"

# LS colors
export LSCOLORS="hxFxCxdxBxegedabagacad"

# Enable persistent REPL history for `node`, allow upto 32³ entries (default is
# 1000), and use sloppy mode by default, matching web browsers.
export NODE_REPL_HISTORY=~/.node_history
export NODE_REPL_HISTORY_SIZE="32768"
export NODE_REPL_MODE="sloppy"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING="UTF-8"

# Go
export GOPATH="$HOME/go"

# GPG
export GPG_TTY=$(tty)

# Android
export ANDROID_HOME="/usr/local/share/android-sdk"

### PATH #######################################################################

# ~/bin
[[ -d "$HOME/bin" && ":$PATH" != *":$HOME/bin"* ]] && \
  export PATH="$PATH:$HOME/bin"

# Cargo
[[ -d "$HOME/.cargo/bin" && ":$PATH:" != *":$HOME/.cargo/bin"* ]] && \
  export PATH="$PATH:$HOME/.cargo/bin"

# Go
[[ -d "$GOPATH/bin" && ":$PATH:" != *":$GOPATH/bin"* ]] && \
  export PATH="$PATH:$GOPATH/bin"
