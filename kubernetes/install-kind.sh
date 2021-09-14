#!/usr/bin/env bash

set -euo pipefail

# check if go is installed
go version 2> /dev/null
exit_code=$?
if [ "$exit_code" -ne "0" ]; then
  echo 'go not found'
  exit 1
fi

# check if docker is installed
docker version 2> /dev/null
exit_code=$?
if [ "$exit_code" -ne "0" ]; then
  echo 'docker not found'
  exit 1
fi

GO111MODULE="on" go get sigs.k8s.io/kind@v0.11.1

