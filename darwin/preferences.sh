#!/bin/sh
#!/bin/sh
DOTFILES_DIR=$(git rev-parse --show-toplevel)
ASSETS_DIR="${ASSETS_DIR:-$DOTFILES_DIR/assets}"
WALLPAPER="${WALLPAPER:-$ASSETS_DIR/black-grey-mountain.png}"
PROFILE_PICTURE="${PROFILE_PICTURE:-$ASSETS_DIR/profile-rose.jpeg}"
# Set wallpaper
echo "Setting wallpaper with applescript..."
if osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""; then
    echo "Wallpaper set successfully!"
else 
    echo "Error setting wallpaper"
fi
# Disable wallpaper icons
echo "Disabling wallpaper icons with defaults utility..."
if defaults write com.apple.finder CreateDesktop false; then
    echo "Wallpaper icons disabled!"
else 
    echo "Error disabling wallpaper icons"
fi
# Set profile picture
echo "Setting profile picture with dscl utility (sudo permissions required)..."
if sudo dscl . create /Users/"$USER" Picture "$PROFILE_PICTURE"; then
    echo "Profile picture set!"
else 
    echo "Error setting profile picture"
fi
# Dock Preferences
echo "Importing dock preferences from binary plist with defaults utility..."
if defaults import com.apple.dock ./mbp/dock.plist; then
    echo "  restarting dock..."
    killall Dock
    echo "Dock preferences set!"
else 
    echo "Error setting dock preferences"
fi
# Stats
echo "Checking for stats installation..."
if defaults domains | grep eu.exelban.Stats > /dev/null; then
    echo "Stats is installed, proceeding..."
    echo "Importing stats app preferences from plaintext plist with defaults utility..."
    if defaults import eu.exelban.Stats ./stats.plist; then
        echo "  restarting stats..."
        pkill Stats && open -a Stats
        echo "Stats app preferences set!"
    else 
        echo "Error setting stats app preferences"
    fi
fi
# Itsycal
echo "Checking for itsycal installation..."
if defaults domains | grep com.mowglii.ItsycalApp > /dev/null; then
    echo "Itsycal is installed, proceeding..."
    echo "Setting itsycal preferences with defaults utility..."
    defaults write com.mowglii.ItsycalApp ClockFormat "E MMM d"
    defaults write com.mowglii.ItsycalApp HideIcon "1"
else
    echo "Itsycal install not found, skipping..."
fi
echo "Done!"
