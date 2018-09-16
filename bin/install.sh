#!/usr/bin/env bash

__install_scripts() {
  local URLS=(
    https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
    https://raw.githubusercontent.com/hnarayanan/shpotify/master/spotify
  )

  for url in ${URLS[@]}; do
    curl -sSL "$url" > /usr/local/bin/"$(basename "$url")"
    chmod +x /usr/local/bin/"$(basename "$url")"
  done
}

__setup_go() {
  # TODO
  exit 1
}

__setup_node() {
  # TODO
  exit 1
}

__setup_rust() {
  # TODO
  exit 1
}

__usage() {
  echo -e "install.sh\\n"
  echo "Usage:"
  echo "  golang    install golang and packages"
  echo "  node      install node and packages"
  echo "  rust      install rust"
  echo "  scripts   install scripts"
}

__main() {
  case "$1" in
    golang) __setup_go ;;
    node) __setup_node ;;
    rust) __setup_rust ;;
    scripts) __install_scripts ;;
    *) __usage "$@"
       exit 1
       ;;
  esac
}

__main "$@"
