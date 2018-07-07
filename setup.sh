#!/usr/bin/env bash
#
# Install kshvmdn's dotfiles.
#
# Usage:
#   ./setup.sh <bash|brew|git|iterm|subl|tmux|vim> ...
#

if [ $# -lt 1 ]; then
  echo "usage: $0 <bash|bin|brew|git|iterm|subl|tmux|vim> ..."
  exit 1
fi

DIR=$(cd "$(dirname "$0")" || exit 1; pwd -P)

for var in "$@"
do
  case $var in
    bash)   ln -fsv "$DIR"/home/.{bash{_profile,rc},inputrc} ~
            ;;
    bin)    mkdir -p ~/bin
            ln -fsv "$DIR"/bin/* ~/bin
            ;;
    brew)   ! [ -x "$(command -v brew)" ] && \
              /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            brew bundle --file="$DIR"/brew/Brewfile --verbose
            ;;
    git)    ln -fsv "$DIR"/home/.git{config,ignore} ~
            ;;
    iterm)  defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DIR"/iterm
            defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1
            ;;
    subl)   ! [ -x "$(command -v subl)" ] && continue
            ln -fsv "$DIR"/sublime-text-3/*.sublime-settings \
              "$HOME/Library/Application Support/Sublime Text 3/Packages/User/"
            ;;
    tmux)   ln -fsv "$DIR"/home/.tmux.conf ~
            ;;
    vim)    mkdir -pv ~/.vim/{autoload,tmp/{backup,swap,undo}}
            curl -fsSLo ~/.vim/autoload/plug.vim --create-dirs \
              https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            ln -fsv "$DIR"/vim/vimrc ~/.vim
            vim +PlugInstall +qall
            ;;
    *)      echo "No match for \"$var\" :("
            ;;
  esac
done
