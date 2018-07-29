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

# Empty the Trash on all mounted volumes and the main HDD
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
