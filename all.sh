#!/bin/bash
set -Eeuo pipefail

echo "==== OSX ===="
sh osx.sh

echo "==== Homebrew ===="
sh brew.sh

echo "==== zsh ===="
sh zsh.sh

echo "==== nvm ===="
sh nvm.sh

echo "==== vim ===="
sh vim.sh
