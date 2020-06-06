#!/bin/bash
set -Eeuxo pipefail

VIMRC=~/.vimrc
if test -f "$VIMRC"; then
    echo "$VIMRC exists, exiting"
    exit
fi

cp -f $(dirname $0)/.vimrc ~/.vimrc
vi +PlugInstall +qall
