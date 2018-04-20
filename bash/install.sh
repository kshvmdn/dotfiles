#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd -P)

ln -sf "$DIR/bash_profile" ~/.bash_profile
ln -sf "$DIR/bashrc" ~/.bashrc
ln -sf "$DIR/inputrc" ~/.inputrc

mkdir -p "$HOME/.config/bash"

for f in aliases exports functions path; do
  ln -sf "$DIR/bash_$f" "$HOME/.config/bash/$f"
done
