#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd -P)

ln -sf "$DIR"/bash_profile ~/.bash_profile
ln -sf "$DIR"/bashrc ~/.bashrc

mkdir -p "$HOME"/.config/bash
for fn in aliases exports functions path; do
    ln -sf "$DIR/bash_$fn" "$HOME/.config/bash/$fn"
done
