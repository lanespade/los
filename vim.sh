#!/bin/zsh
set -Eeuo pipefail

echo 'Copying .vimrc'
cp $(dirname $0)/.vimrc ~/.vimrc

echo 'Installing plugins'
vi +PlugInstall +qall
