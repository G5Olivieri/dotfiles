#!/usr/bin/env sh

set -eou pipefail

apt install python3.10-venv
curl -sSL https://install.python-poetry.org | python3 -
