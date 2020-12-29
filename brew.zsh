#!/bin/zsh
set -Eeuxo pipefail

echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Installing casks'
brew reinstall rectangle
brew reinstall vlc
brew reinstall google-backup-and-sync
brew reinstall webtorrent
brew reinstall homebrew/cask-drivers/sony-ps4-remote-play
brew reinstall openemu
brew reinstall expressvpn
brew reinstall google-chrome
