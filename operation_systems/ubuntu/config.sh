#!/usr/bin/env bash

set -euo pipefail

config_path=${1:-""}

if [ -z $config_path ]; then
  echo "usage: ${0} <path_to_dotfiles>" 
  exit 1
fi

create_link_if_not_exists () {
  if [ ! -L "$2" ]; then
    echo "Link $1 -> $2"
    ln -s $1 $2
  fi
}

# Create links
create_link_if_not_exists "$config_path/.tmux.conf" "$HOME/.tmux.conf"
