#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd -P)
mkdir -p "$DIR"/.vim/{autoload,bundle,tmp/{backup,swap,undo}} &&
  curl -LSso "$DIR"/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
ln -sf "$DIR"/.vim "$HOME"/.vim
ln -sf "$DIR"/.vimrc "$HOME"/.vimrc
