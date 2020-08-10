#!/bin/zsh
set -Eeuo pipefail

echo '==== macOS ===='
sh macOS.sh

echo '==== Homebrew ===='
sh brew.sh

echo '==== fd ===='
sh fd.sh

echo '==== zsh ===='
sh zsh.sh

echo '==== nvm ===='
sh nvm.sh

echo '==== npm ===='
sh npm.sh

echo '==== vim ===='
sh vim.sh
