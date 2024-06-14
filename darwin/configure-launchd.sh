#!/bin/sh
DOTFILES_DIR="${DOTFILES_DIR:?}"
. "$DOTFILES_DIR"/bin/formatting.sh

info "Installing LaunchAgents...\n"
for plist in "$LAUNCHD_DIR"/*; do
    eval "$INSTALL" "$plist" "$HOME/Library/LaunchAgents/${plist##*/}"
done
