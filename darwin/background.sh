#!/bin/sh
DOTFILES_DIR=$(git rev-parse --show-toplevel)
ASSETS_DIR="${ASSETS_DIR:-$DOTFILES_DIR/assets}"
WALLPAPER="${WALLPAPER:-$ASSETS_DIR/black-grey-mountain.png}"
PROFILE_PICTURE="${PROFILE_PICTURE:-$ASSETS_DIR/profile-rose.jpeg}"
# set background picture
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""
# set profile picture
sudo dscl . create /Users/"$USER" Picture "$PROFILE_PICTURE"
