#!/bin/zsh
set -Eeuo pipefail

echo 'Configuring theme'
plutil -replace AppleInterfaceStyle -string Dark ~/Library/Preferences/.GlobalPreferences.plist
defaults read -g AppleInterfaceStyle -string Dark

echo 'Configuring background image'
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$PWD/background.jpg\""

echo 'Configuring profile photo, you may be asked for your password'
sudo dscl . delete "/Users/$USER" JPEGPhoto
sudo dscl . create "/Users/$USER" Picture "$PWD/avatar.jpg"

echo 'Configuring dock'
plutil -replace static-only -bool true ~/Library/Preferences/com.apple.dock.plist
defaults read com.apple.dock static-only

plutil -replace tilesize -integer 128 ~/Library/Preferences/com.apple.dock.plist
defaults read com.apple.dock tilesize

plutil -replace autohide -bool true ~/Library/Preferences/com.apple.dock.plist
defaults read com.apple.dock autohide

plutil -replace show-recents -bool false ~/Library/Preferences/com.apple.dock.plist
defaults read com.apple.dock show-recents

echo 'Configuring keyboard'
plutil -replace InitialKeyRepeat -integer 10 ~/Library/Preferences/.GlobalPreferences.plist
defaults read -g InitialKeyRepeat

plutil -replace KeyRepeat -integer 1 ~/Library/Preferences/.GlobalPreferences.plist
defaults read -g KeyRepeat

echo 'Configuring track pad'
plutil -replace Clicking -bool true ~/Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad.plist
defaults read com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking

plutil -replace Clicking -bool true ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist
defaults read com.apple.AppleMultitouchTrackpad Clicking

plutil -replace "com\.apple\.swipescrolldirection" -bool false ~/Library/Preferences/.GlobalPreferences.plist
defaults read -g com.apple.swipescrolldirection 
