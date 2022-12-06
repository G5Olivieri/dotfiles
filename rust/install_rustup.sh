#!/usr/bin/env sh

set -eou pipefail

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
