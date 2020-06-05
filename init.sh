#! /bin/sh

# Mac

# Remove Dock Items
defaults delete com.apple.dock persistent-apps; killall Dock

# Set Key Repeat Rates
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# OhMyZsh
sh -c '$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'

# Homebrew Installation
/usr/bin/ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'

# Homebrews
brew install zsh
brew install nvm

# Homebrew Configs
mkdir ~/.nvm

# Homebrew Casks
brew cask install shiftit
brew cask install vlc
brew cask install google-chrome
brew cask install google-backup-and-sync
brew cask install marshallofsound-google-play-music-player
brew cask install webtorrent
brew cask install homebrew/cask-drivers/sony-ps4-remote-play
brew cask install openemu
