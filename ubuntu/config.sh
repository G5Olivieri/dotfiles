#!/usr/bin/env bash

set -xeuo pipefail

create_link_if_not_exists () {
  if [ ! -L "$2" ]; then
    echo "Link $1 -> $2"
    ln -s $1 $2
  fi
}

# Create links
create_link_if_not_exists "$HOME/Data/dotfiles/.vimrc" "$HOME/.vimrc"
create_link_if_not_exists "$HOME/Data/dotfiles/.zshrc" "$HOME/.zshrc"
create_link_if_not_exists "$HOME/Data/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
create_link_if_not_exists "$HOME/Data/dotfiles/.ideavimrc" "$HOME/.ideavimrc"
