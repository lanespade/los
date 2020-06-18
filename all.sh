#!/bin/bash
set -Eeuo pipefail

echo '==== macOS ===='
sh macOS.sh

echo '==== Homebrew ===='
sh brew.sh

echo '==== zsh ===='
sh zsh.sh

echo '==== nvm ===='
sh nvm.sh

echo '==== vim ===='
sh vim.sh
