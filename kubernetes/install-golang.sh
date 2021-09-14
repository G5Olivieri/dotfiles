#!/usr/bin/env bash

set -euo pipefail

curl -LO "https://golang.org/dl/go1.17.1.linux-amd64.tar.gz"

sudo tar -C /usr/local -xzf go1.17.1.linux-amd64.tar.gz
rm go1.17.1.linux-amd64.tar.gz
