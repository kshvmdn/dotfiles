#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd -P)
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DIR"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1
