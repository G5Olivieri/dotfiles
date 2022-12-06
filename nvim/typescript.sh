#!/usr/bin/env sh

set -eou pipefail

npm -v > /dev/null || (echo "npm not installed"; exit 1)

echo "# Instaling typescript-language-server typescript"
npm i --global typescript-language-server typescript

echo "# Don't forget to add require(\"lspconfig\")[\"tsserver\"].setup{} to init.lua"
