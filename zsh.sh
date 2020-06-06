#!/bin/bash
set -Eeuo pipefail

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

THEME=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

if test -f "$THEME"; then
	echo "Installing Theme"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
else
	echo "Updating Theme"
	git -C $THEME pull
fi

echo "Copying .zshrc"
cp -f $(dirname $0)/.zshrc ~/.zshrc

echo "Copying .p10k.zsh"
cp -f $(dirname $0)/.p10k.zsh ~/.p10k.zsh

echo "Done, source ~/.zshrc or restart terminal"
