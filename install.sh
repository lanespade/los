#!/bin/zsh
set -Eeuxo pipefail

echo '==== macOS ===='
sh macOS.sh

echo '==== Homebrew ===='
sh brew.sh
