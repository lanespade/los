#!/bin/zsh
set -Eeuxo pipefail

echo '==== macOS ===='
zsh macOS.sh

echo '==== Homebrew ===='
zsh brew.sh
