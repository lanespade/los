#!/bin/zsh
set -Eeuo pipefail

echo 'Configuring global preferences: theme, keyboard, and scroll direction'
plutil -replace AppleInterfaceStyle -string Dark ~/Library/Preferences/.GlobalPreferences.plist
plutil -replace InitialKeyRepeat -integer 10 ~/Library/Preferences/.GlobalPreferences.plist
plutil -replace KeyRepeat -integer 1 ~/Library/Preferences/.GlobalPreferences.plist
plutil -replace "com\.apple\.swipescrolldirection" -bool false ~/Library/Preferences/.GlobalPreferences.plist

echo 'Control center preferences'
plutil -replace "NSStatusItem Visible Bluetooth" -bool true ~/Library/Preferences/com.apple.controlcenter.plist

echo 'Configuring dock preferences'
plutil -replace static-only -bool true ~/Library/Preferences/com.apple.dock.plist
plutil -replace tilesize -integer 128 ~/Library/Preferences/com.apple.dock.plist
plutil -replace autohide -bool true ~/Library/Preferences/com.apple.dock.plist
plutil -replace show-recents -bool false ~/Library/Preferences/com.apple.dock.plist

echo 'Configuring track pad preferences'
plutil -replace Clicking -bool true ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist
plutil -replace TrackpadRightClick -bool true ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist

echo 'Configuring bluetooth track pad preferences'
plutil -replace Clicking -bool true ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist
plutil -replace TrackpadRightClick -bool true ~/Library/Preferences/com.apple.AppleMultitouchTrackpad.plist

echo 'Flush prefence cache'
defaults read > /dev/null

echo 'Configuring background image'
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$PWD/background.jpg\""

echo 'Configuring profile photo, you may be asked for your password'
sudo dscl . delete "/Users/$USER" JPEGPhoto
sudo dscl . create "/Users/$USER" Picture "$PWD/avatar.jpg"
