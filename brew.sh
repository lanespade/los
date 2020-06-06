#!/bin/bash
set -Eeuo pipefail

echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing brews"
brew install nvm
brew install fzf
brew install ripgrep

echo "Configuring nvm"
mkdir -p ~/.nvm
cp -f $(dirname $0)/.nvmrc ~/.nvmrc

echo "Installing casks"
brew cask install shiftit
brew cask install vlc
brew cask install google-chrome
brew cask install google-backup-and-sync
brew cask install marshallofsound-google-play-music-player
brew cask install webtorrent
brew cask install homebrew/cask-drivers/sony-ps4-remote-play
brew cask install openemu
