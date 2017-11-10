#!/bin/bash -e

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brews and casks
brew install $(cat ./misc/Brewfile | grep -v "#")
brew cask install $(cat ./misc/Caskfile | grep -v "#")
brew cleanup

# Go tools
export GOPATH="$HOME/go" && (
  mkdir -p $GOPATH/{bin,pkg,src}
  go get -u -v github.com/golang/dep \
               github.com/golang/lint
)

# nvm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"

# latest stable Node / npm
nvm install stable
nvm alias default stable

# misc. npm packages
npm install --global create-react-app \
                     david \
                     live-server \
                     tldr \
                     yarn
