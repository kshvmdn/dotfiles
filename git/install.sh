#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd -P)
find "$DIR"/.git* -exec ln -sf {} "$HOME" \;
