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
brew reinstall rectangle
brew reinstall vlc
brew reinstall google-drive
brew reinstall webtorrent
brew reinstall sony-ps-remote-play
brew reinstall openemu
brew reinstall google-chrome
brew reinstall nordvpn
brew reinstall nordpass
