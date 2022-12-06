#!/usr/bin/env sh

set -eou pipefail

curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.50.1
go install github.com/nametake/golangci-lint-langserver@v0.0.7
