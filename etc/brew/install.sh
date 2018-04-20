#!/usr/bin/env bash

if ! [ -x "$(which brew)" ]; then
  /usr/bin/ruby -e "$(curl -fsSL \
    https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle --file="$(cd "$(dirname "$0")"; pwd -P)/Brewfile" --verbose
