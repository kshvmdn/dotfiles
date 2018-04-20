#!/usr/bin/env bash

if [ -n "$GOPATH" ]; then
  mkdir -p "$GOPATH/{bin,pkg,src}"
  go get -u -v github.com/golang/dep \
               github.com/golang/lint
fi
