#!/usr/bin/env bash

set -eou pipefail

if [ -z "$ZSH" ]; then
  echo "ZSH variable not set"
  exit 0
fi

completions_path="$ZSH/completions"

if [ ! -d "$completions_path" ]; then
  mkdir "$completions_path"
fi

kind completion zsh > "$completions_path/_kind"
