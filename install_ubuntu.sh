#!/usr/bin/env bash

set -xeuo pipefail

create_link_if_not_exists () {
  if [ ! -L "$2" ]; then
    echo "Link $1 -> $2"
    ln -s $1 $2
  fi
}


sudo apt-get update && sudo apt-get upgrade

sudo apt-get install -y \
	apt-transport-https \
	build-essential \
	ca-certificates \
  cmake \
	curl \
	curl \
	git \
  gnome-tweaks \
	gnupg-agent \
	jq \
  openjdk-11-jdk \
  openjdk-11-source \
  python \
	python3 \
	python3-dev \
	python3-pip \
  qemu-kvm \
	silversearcher-ag \
	software-properties-common \
	tig \
	tmux \
	unzip \
	vim-gtk3 \
	xclip \
	zsh


# Install docker and docker-compose
sudo apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable edge"

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable edge test"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER


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

# Pip install
sudo python3 -m pip install pygments docker-compose

# Create links
create_link_if_not_exists "$HOME/Data/dotfiles/.vimrc" "$HOME/.vimrc"
create_link_if_not_exists "$HOME/Data/dotfiles/.zshrc" "$HOME/.zshrc"
create_link_if_not_exists "$HOME/Data/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
create_link_if_not_exists "$HOME/Data/dotfiles/.ideavimrc" "$HOME/.ideavimrc"

# ssh key
cp -r $HOME/Data/.ssh $HOME/
eval "$(ssh-agent -s)"
echo "User password"
ssh-add $HOME/.ssh/id_rsa

# Git config
git config --global user.name "Glayson Olivieri"
git config --global user.email "glayson@vizir.com.br"

# Add user in KVM group
sudo usermod -aG kvm $USER
