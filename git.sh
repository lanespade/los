#!/bin/bash
set -Eeuo pipefail

echo 'Copying .gitignore_global'
cp -f $(dirname $0)/.gitignore_global $HOME

echo 'Configuring global ignores'
git config --global core.excludesfile $HOME/.gitignore_global
