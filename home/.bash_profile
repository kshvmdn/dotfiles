for n in "aliases" "functions" "exports" "path"; do
  if [[ -f "$HOME/.bash_$n" ]]; then
    source "$HOME/.bash_$n"
    unset n
  fi
done

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Don't automatically run history commands.
shopt -s histverify

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Enable forward-i-search
[[ $- == *i* ]] && stty -ixon

# Bash completion
[[ -f "$(brew --prefix)/etc/bash_completion" ]] && \
  source "$(brew --prefix)/etc/bash_completion"

# Git completion
[[ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]] && \
  source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
