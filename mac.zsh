#!/bin/zsh
set -Eeuo pipefail

echo 'Configuring theme'
defaults write -g AppleInterfaceStyle -string Dark

echo 'Configuring background image'
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$PWD/background.jpg\""

echo 'Configuring profile photo'
sudo dscl . delete "/Users/$USER" JPEGPhoto
sudo dscl . create "/Users/$USER" Picture "$PWD/avatar.jpg"

echo 'Configuring dock'
defaults write com.apple.dock static-only -bool TRUE
defaults write com.apple.dock tilesize -int 128
defaults write com.apple.dock autohide -bool TRUE
defaults write com.apple.dock show-recents -bool FALSE
killall Dock

echo 'Configuring keyboard'
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

echo 'Configuring track pad'
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool TRUE
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool TRUE
defaults write -g com.apple.swipescrolldirection -bool FALSE
