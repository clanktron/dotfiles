#!/bin/sh
HOME="${HOME:?}"
## Fast key repeat
# both of these can go lower than their minimum
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)
# remap capslock to "left" control
# official reference table https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
cp ./launchd/local.capslockToControl.plist "$HOME"/Library/LaunchAgents/
# tap to touch
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# trackpad speed (doesn't work even after reboot)
# defaults write -g com.apple.mouse.scaling 5.0
# apply settings
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
