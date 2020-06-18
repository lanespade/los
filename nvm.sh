#!/bin/bash
set -Eeuo pipefail

echo 'Installing nvm'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo 'Creating .nvmrc'
echo 'lts/' cp > ~/.nvmrc
