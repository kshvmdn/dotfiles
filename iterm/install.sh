#!/usr/bin/env bash

defaults write com.googlecode.iterm2 PrefsCustomFolder -string \
  "$(cd "$(dirname "$0")"; pwd -P)"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1
