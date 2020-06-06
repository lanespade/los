#!/bin/bash
set -Eeuo pipefail

echo "==== OSX ===="
sh osx.sh

echo "==== Homebrew ===="
sh brew.sh

echo "==== ZSH ===="
sh zsh.sh

echo "==== VIM ===="
sh vim.sh
