#!/bin/zsh
set -Eeuo pipefail

echo 'Deleting dock items'
defaults delete com.apple.dock persistent-apps; killall Dock

echo 'Setting key repeat rates'
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

echo 'Configuring tap to click'
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
