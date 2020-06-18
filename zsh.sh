#!/bin/bash
set -Eeuo pipefail

echo 'Installing Oh My Zsh'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

THEME=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

if test -d '$THEME'; then
	echo 'Updating theme'
	git -C $THEME pull
else
	echo 'Installing theme'
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $THEME
fi

echo 'Copying .zshrc'
cp -f $(dirname $0)/.zshrc ~

echo 'Copying .p10k.zsh'
cp -f $(dirname $0)/.p10k.zsh ~

echo 'sourcing .zshrc'
source ~/.zshrc
