for file in ~/.bash_{aliases,functions,exports,path}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Tab completion
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# Git completion
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi
