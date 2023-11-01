#!/bin/sh

export XDG_DATA_DIR="${XDG_DATA_DIR:-${HOME}/.local/share}"
export ZIM_HOME="${XDG_DATA_DIR}/zim"

# Download `zimfw` if missing.
if [ ! -e "${ZIM_HOME}/zimfw.zsh" ]; then
  if command -v curl > /dev/null; then
    curl -fsSL --create-dirs -o "${ZIM_HOME}/zimfw.zsh" \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  elif command -v wget > /dev/null; then
    mkdir -p "${ZIM_HOME}" && wget -nv -O "${ZIM_HOME}/zimfw.zsh" \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    echo 'To setup zim (zsh plugin manager), either `curl` or `wget` must be installed.'
    exit 1
  fi
fi

# vim: et sw=2
