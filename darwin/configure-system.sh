#!/bin/sh
DOTFILES_DIR="${DOTFILES_DIR:?}"
. "$DOTFILES_DIR"/bin/formatting.sh

prompt "Would you like to configure system settings? (y/n): "

# Set profile picture
info "Setting profile picture with dscl utility (sudo permissions required)...\n"
if sudo dscl . create /Users/"$USER" Picture "$PROFILE_PICTURE"; then
    info "Profile picture set!\n"
else
    error "Error setting profile picture\n"
fi
# Set wallpaper
info "Setting wallpaper with applescript...\n"
if osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$XDG_CONFIG_HOME/background\""; then
    info "Wallpaper set successfully!\n"
else
    error "Error setting wallpaper\n"
fi
# Disable wallpaper icons
info "Disabling wallpaper icons with defaults utility...\n"
if defaults write com.apple.finder CreateDesktop false; then
    info "Wallpaper icons disabled!\n"
else
    error "Error disabling wallpaper icons\n"
fi
# Dock Preferences
info "Importing dock preferences from binary plist with defaults utility...\n"
if defaults import com.apple.dock "$DARWIN_DIR"/mbp/dock.plist; then
    info "Restarting dock...\n"
    killall Dock
    info "Dock preferences set!\n"
else
    error "Error setting dock preferences\n"
fi
# InitialKeyRepeat minimum is 15 (225 ms)
# KeyRepeat minimum is 2 (30 ms)
# both of these can go lower than their "normal" minimum
info "Setting key repeat speed to normal minimum delay...\n"
if defaults write -g InitialKeyRepeat -int 15 && defaults write -g KeyRepeat -int 2; then
    info "Key repeat speed set!\n"
else
    error "Failed to set keyrepeat values\n"
fi
# tap to touch
info "Enabling tap to touch...\n"
if defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true \
    && defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true \
    && defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 \
    && defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1; then
    info "Tap to touch is now enabled!\n"
else
    error "failed to enable tap to touch\n"
fi
# trackpad speed (doesn't work even after reboot)
# defaults write -g com.apple.mouse.scaling 5.0
# apply settings
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
