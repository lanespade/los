#!/bin/zsh
set -Eeuxo pipefail

echo 'Configuring theme'
defaults write -g AppleInterfaceStyle -string Dark

echo 'Configuring dock'
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
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
