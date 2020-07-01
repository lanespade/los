#!/bin/zsh
set -Eeuo pipefail

echo 'Installing homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'Installing brews'
brew reinstall fzf
brew reinstall ripgrep
brew reinstall fd
brew reinstall bat

echo 'Installing casks'
brew cask reinstall shiftit
brew cask reinstall vlc
brew cask reinstall google-chrome
brew cask reinstall google-backup-and-sync
brew cask reinstall webtorrent
brew cask reinstall homebrew/cask-drivers/sony-ps4-remote-play
brew cask reinstall openemu
