#!/usr/bin/env sh

set -eou pipefail

sudo apt install ninja-build

git clone  --depth=1 https://github.com/sumneko/lua-language-server $HOME/Projects/lua-language-server

cd $HOME/Projects/lua-language-server

git submodule update --depth 1 --init --recursive

cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

sudo ln -s $HOME/Projects/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server
