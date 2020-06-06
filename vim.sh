#!/bin/bash
set -Eeuo pipefail

cp -f $(dirname $0)/.vimrc ~/.vimrc
vi +PlugInstall +qall
