#!/usr/bin/env bash

set -xeuo pipefail

sudo apt-get update && sudo apt-get upgrade

sudo apt-get install -y \
	apt-transport-https \
	build-essential \
	ca-certificates \
	curl \
	git \
	gnome-tweaks \
	gnupg-agent \
	jq \
	python \
	python3 \
	python3-dev \
	python3-pip \
	silversearcher-ag \
	software-properties-common \
	tig \
	tmux \
	unzip \
	vim-gtk3 \
	xclip \
	zsh


# Install docker and docker-compose
sudo apt-get remove docker docker.io containerd runc
sudo apt autoremove
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs)\
   stable edge"

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
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

# ssh key
cp -r $HOME/Data/.ssh $HOME/
eval "$(ssh-agent -s)"
echo "User password"
ssh-add $HOME/.ssh/id_rsa

# Git config
git config --global user.name "Glayson Olivieri"
git config --global user.email "glayson@vizir.com.br"
