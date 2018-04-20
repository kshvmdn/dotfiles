#!/usr/bin/env bash

if [ -x $("which subl") ]; then
  DIR=$(cd "$(dirname "$0")"; pwd -P)

  for fi in "Package Control" "Preferences"; do
    ln -sf "$DIR/$fi.sublime-settings" \
      "~/Library/Application Support/Sublime Text 3/Packages/User/$fi.sublime-settings"
  done
fi
