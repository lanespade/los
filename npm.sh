#!/bin/bash
set -Eeuo pipefail

echo 'Installing global packages'
npm i -g spaceship-prompt
npm i -g diff-so-fancy

echo 'Configuring global packages'
git config --global core.pager 'diff-so-fancy | less --tabs=4 -RFX'
