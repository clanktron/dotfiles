#!/bin/sh
DOTFILES_DIR="${DOTFILES_DIR:?}"
. "$DOTFILES_DIR"/formatting.sh
# Set profile picture
info "Setting profile picture with dscl utility (sudo permissions required)..."
if sudo dscl . create /Users/"$USER" Picture "$PROFILE_PICTURE"; then
    info "Profile picture set!"
else 
    error "Error setting profile picture"
fi
# Set wallpaper
info "Setting wallpaper with applescript..."
if osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""; then
    info "Wallpaper set successfully!"
else 
    error "Error setting wallpaper"
fi
# Disable wallpaper icons
info "Disabling wallpaper icons with defaults utility..."
if defaults write com.apple.finder CreateDesktop false; then
    info "Wallpaper icons disabled!"
else 
    error "Error disabling wallpaper icons"
fi
# Dock Preferences
info "Importing dock preferences from binary plist with defaults utility..."
if defaults import com.apple.dock "$DARWIN_DIR"/mbp/dock.plist; then
    info "  restarting dock..."
    killall Dock
    info "Dock preferences set!"
else 
    error "Error setting dock preferences"
fi
# InitialKeyRepeat minimum is 15 (225 ms)
# KeyRepeat minimum is 2 (30 ms)
# both of these can go lower than their "normal" minimum
info "Setting key repeat speed to normal minimum delay..."
if defaults write -g InitialKeyRepeat -int 15 && defaults write -g KeyRepeat -int 2; then
    info "Key repeat speed set!"
else
    error "Failed to set keyrepeat values"
fi
# tap to touch
info "Enabling tap to touch..."
if defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true \
    && defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true \
    && defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 \
    && defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1; then
    info "Tap to touch is now enabled!"
else
    error "failed to enable tap to touch"
fi
# trackpad speed (doesn't work even after reboot)
# defaults write -g com.apple.mouse.scaling 5.0
# apply settings
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
