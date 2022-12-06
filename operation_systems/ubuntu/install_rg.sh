#!/usr/bin/env sh

set -eou pipefail

tmpdir="$(mktemp -d -t rg-XXXX)"
depfile="${tmpdir}/ripgrep.deb"
version="13.0.0"

curl -Lo $depfile "https://github.com/BurntSushi/ripgrep/releases/download/${version}/ripgrep_${version}_amd64.deb"
sudo apt install $depfile
