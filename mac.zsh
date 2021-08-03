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
defaults write com.apple.dock static-only -bool true
defaults write com.apple.dock tilesize -int 128
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock show-recents -int 0
killall Dock

echo 'Configuring keyboard'
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

echo 'Configuring track pad'
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write -g com.apple.swipescrolldirection -int 0
