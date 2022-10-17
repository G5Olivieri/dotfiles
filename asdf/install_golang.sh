#!/usr/bin/env bash

set -euo pipefail

asdf plugin-add golang https://github.com/kennyp/asdf-golang

asdf install golang 1.16
asdf global golang 1.16
