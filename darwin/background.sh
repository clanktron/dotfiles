#!/bin/sh
DOTFILES_DIR=$(git rev-parse --show-toplevel)
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$DOTFILES_DIR/assets/black-grey-mountain.png\""
