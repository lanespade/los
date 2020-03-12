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

# CLI 

# OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Tools
brew install zsh
brew install nvm

# Configs
mkdir ~/.nvm

# Homebrew App
brew cask install shiftit
brew cask install spotify
brew cask install vlc
brew cask install google-chrome
brew cask install google-backup-and-sync
brew cask install webtorrent
brew cask install sublime-text
