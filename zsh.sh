#!/bin/bash
set -Eeuo pipefail

ZSHRC=~/.zshrc
if test -f "$ZSHRC"; then
    echo "$ZSHRC exists, exiting"
    exit
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
cp -f $(dirname $0)/.zshrc ~/.zshrc
