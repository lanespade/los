#!/bin/zsh
set -Eeuo pipefail

echo '==== macOS ===='
sh macOS.sh

echo '==== Homebrew ===='
sh brew.sh
