#!/usr/bin/env bash

set -xeuo pipefail

create_link_if_not_exists () {
  if [ ! -L "$2" ]; then
    echo "Link $1 -> $2"
    ln -s $1 $2
  fi
}


sudo zypper in -y -t pattern devel_basis

sudo zypper in -y \
	docker \
	docker-compose \
	git \
	python3-devel \
	tig \
	zsh \
  cmake \
  jq \
  the_silver_searcher \
  tmux \
  unzip \
  xclip

# Install zsh
chsh -s /bin/zsh

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/fzf
~/fzf/install \
  --key-bindings \
  --xdg \
  --completion \
  --no-update-rc \
  --no-bash \
  --no-fish

sudo python3 -m pip install pygments

# Install docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Create links
create_link_if_not_exists "$HOME/Data/dotfiles/.vimrc" "$HOME/.vimrc"
create_link_if_not_exists "$HOME/Data/dotfiles/.zshrc" "$HOME/.zshrc"
create_link_if_not_exists "$HOME/Data/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
