#!/bin/bash
set -Eeuo pipefail

echo "Copying .vimrc"
cp -f $(dirname $0)/.vimrc ~/.vimrc

echo "Installing plugins"
vi +PlugInstall +qall
