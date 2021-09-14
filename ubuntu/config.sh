#!/usr/bin/env bash

set -xeuo pipefail

config_path=$(dirname $(dirname $(readlink -f $0)))

echo $current_path

create_link_if_not_exists () {
  if [ ! -L "$2" ]; then
    echo "Link $1 -> $2"
    ln -s $1 $2
  fi
}

# Create links
create_link_if_not_exists "$config_path/.vimrc" "$HOME/.vimrc"
create_link_if_not_exists "$config_path/.zshrc" "$HOME/.zshrc"
create_link_if_not_exists "$config_path/.tmux.conf" "$HOME/.tmux.conf"
