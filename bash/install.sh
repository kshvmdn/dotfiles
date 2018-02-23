#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd -P)
find "$DIR"/.bash* -exec ln -sf {} "$HOME" \;
