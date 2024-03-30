#!/bin/sh
DOTFILES_DIR="${DOTFILES_DIR:?}"
. "$DOTFILES_DIR"/formatting.sh
info "Installing LaunchAgents..."
find "$LAUNCHD_DIR" -maxdepth 1 -exec basename {} \; | sed 1d | while read -r file; do 
    eval "$INSTALL" "$LAUNCHD_DIR"/"$file" "$HOME"/Library/LaunchAgents/"$file"
done

