#!/usr/bin/env sh

set -eou pipefail

npm -v > /dev/null || (echo "npm is not installed"; exit 1)

npm i --global bash-language-server
