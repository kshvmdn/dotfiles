# Always enable colored `grep` output
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# File/directory listing
alias ls="ls -Fh"
alias la="ls -AFh"
alias ll="ls -AFhl"

# Make sudo play nicely with other aliases.
alias sudo='sudo '

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd"
alias -- -="cd -"

# Shortcuts
alias dev="cd $HOME/dev"
alias dl="cd $HOME/Downloads"
alias dt="cd $HOME/Desktop"

# School
alias madankas="ssh -i ~/.ssh/cdf madankas@teach.cs.toronto.edu"
alias school="cd $HOME/dev/src/github.com/kshvmdn/uoft"

# Lock the screen
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Hide/show all desktop icons
alias dhide="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias dshow="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Empty the Trash on all mounted volumes and the main HDD.
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Hide/show hidden files in Finder
alias hhide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hshow="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"

# Search history faster
alias hs='history | grep'

# IP addresses
alias iploc="ipconfig getifaddr en0"
alias ippub="dig +short myip.opendns.com @resolver1.opendns.com"

# Merge PDF files, usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Quick exit!
alias :q="exit 1"
