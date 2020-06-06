#!/bin/bash
set -Eeuo pipefail

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo "Copying .nvmrc"
cp -f $(dirname $0)/.nvmrc ~/.nvmrc
