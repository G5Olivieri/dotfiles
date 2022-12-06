#!/usr/bin/env sh

set -eou pipefail

rustup --version 2>1 > /dev/null || (echo "Rustup not installed"; exit 1)
cargo -v > /dev/null || (echo "Cargo not installed"; exit 1)

sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 libegl1-mesa-dev

git clone https://github.com/alacritty/alacritty.git $HOME/Projects/alacritty

cd $HOME/Projects/alacritty
rustup override set stable
rustup update stable

cargo build --release 

# Terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# Desktop Entry
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# man page
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

# auto completion
# cp extra/completions/_alacritty <I DONT KNOW THE PATH>
