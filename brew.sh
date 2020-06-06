#! /bin/bash
set -Eeuo pipefail

# Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Brews
brew install nvm
brew install fzf
brew install ripgrep

# Casks
brew cask install shiftit
brew cask install vlc
brew cask install google-chrome
brew cask install google-backup-and-sync
brew cask install marshallofsound-google-play-music-player
brew cask install webtorrent
brew cask install homebrew/cask-drivers/sony-ps4-remote-play
brew cask install openemu
