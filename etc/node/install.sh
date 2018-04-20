#!/usr/bin/env bash

if [ -n "$NVM_DIR" ]; then
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout "$(git describe --abbrev=0 --tags --match "v[0-9]*" origin)"

  source "$NVM_DIR/nvm.sh"

  nvm install stable
  nvm alias default stable

  npm install --global create-react-app \
                       david \
                       live-server \
                       prettier \
                       typescript
fi
