#!/bin/sh

if [ ! -e "${ZIM_HOME}/zimfw.zsh" ]; then
  if command -v curl > /dev/null; then
    sh -c "$(curl -fsSL get.chezmoi.io/lb)" -- init --apply hiraginoyuki
  elif command -v wget > /dev/null; then
    sh -c "$(wget -nv -O- get.chezmoi.io/lb)" -- init --apply hiraginoyuki
  else
    echo 'To run this script, either `curl` or `wget` is required.'
    exit 1
  fi
fi

