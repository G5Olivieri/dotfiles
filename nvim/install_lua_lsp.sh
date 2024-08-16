#!/usr/bin/env sh

set -euo pipefail

sudo apt install ninja-build

git clone --depth=1 https://github.com/sumneko/lua-language-server $HOME/lua-language-server

cd $HOME/lua-language-server

git submodule update --depth 1 --init --recursive

cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

sudo ln -s $HOME/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server
