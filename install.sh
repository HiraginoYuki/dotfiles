#!/bin/sh

if [ ! -e "${ZIM_HOME}/zimfw.zsh" ]; then
  if command -v curl > /dev/null; then
    BINDIR="$HOME/.local/bin" sh -c "$(curl -fsS https://get.chezmoi.io/)" -- init --apply hiraginoyuki
  elif command -v wget > /dev/null; then
    BINDIR="$HOME/.local/bin" sh -c "$(wget -nv -O- https://get.chezmoi.io/)" -- init --apply hiraginoyuki
  else
    echo 'To run this script, either `curl` or `wget` is required.'
    exit 1
  fi
fi
