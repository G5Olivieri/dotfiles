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

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# Pip install
sudo python3 -m pip install docker-compose

# Git config
git config --global user.name "Glayson Olivieri"
git config --global user.email "glayson.murollo75@gmail.com"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

