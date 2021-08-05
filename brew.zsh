#!/bin/zsh
set -Eeuo pipefail

echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Adding homebrew to PATH'
LINE='eval "$(/opt/homebrew/bin/brew shellenv)"'
grep -xqF $LINE  ~/.zprofile || echo $LINE >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'Installing rosetta'
sudo softwareupdate --install-rosetta

echo 'Tapping casks'
brew tap homebrew/cask-drivers

echo 'Installing casks'
brew install rectangle
brew install vlc
brew install google-backup-and-sync
brew install webtorrent
brew install homebrew/cask-drivers/sony-ps-remote-play
brew install openemu
brew install expressvpn
brew install google-chrome
