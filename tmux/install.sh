#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd -P)
ln -sf "$DIR"/tmux.conf ~/.tmux.conf
