#!/usr/bin/env sh

set -eou pipefail

cd $(mktemp -d -t nvim-XXXX)

curl -LO https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
curl -LO https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb.sha256sum

cat nvim-linux64.deb.sha256sum | sha256sum --check

sudo apt install nvim-linux64.deb
