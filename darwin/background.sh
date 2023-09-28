#!/bin/sh
DOTFILES_DIR=$(git rev-parse --show-toplevel)
# set background picture
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DOTFILES_DIR/assets/black-grey-mountain.png\""
# set profile picture
dscl . create /Users/"$USER" Picture "$DOTFILES_DIR/assets/profile-garfield.png"
