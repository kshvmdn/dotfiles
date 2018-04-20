#!/usr/bin/env bash

mkdir -p "$HOME/.vim/{autoload,tmp/{backup,swap,undo}}"
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf "$(cd "$(dirname "$0")"; pwd -P)/vimrc" "$HOME/.vim/vimrc"
vim +PlugInstall +qall
