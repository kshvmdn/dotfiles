#!/usr/bin/env bash

if ! [ -x "$(which brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL \
    https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

DIR=$(cd "$(dirname "$0")"; pwd -P)
brew bundle --file="$DIR"/Brewfile --verbose
