#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd -P)

ln -sf "$DIR/gitconfig" ~/.gitconfig
ln -sf "$DIR/gitignore_global" ~/.gitignore_global
