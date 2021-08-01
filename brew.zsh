#!/bin/zsh
set -Eeuxo pipefail

echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Adding homebrew to PATH'
LINE='eval "$(/opt/homebrew/bin/brew shellenv)"'
grep -xF $LINE  ~/.zprofile || echo $LINE >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'Installing rosetta'
sudo softwareupdate --install-rosetta

echo 'Tapping casks'
brew tap homebrew/cask-drivers

echo 'Installing casks'
brew reinstall rectangle
brew reinstall vlc
brew reinstall google-backup-and-sync
brew reinstall webtorrent
brew reinstall homebrew/cask-drivers/sony-ps-remote-play
brew reinstall openemu
brew reinstall expressvpn
brew reinstall google-chrome
