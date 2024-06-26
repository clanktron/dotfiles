#!/bin/sh
export HOME="${HOME:?}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"
export DOTFILES_DIR="$(dirname "$(realpath "$0")")"
export ASSETS_DIR="$(realpath "$DOTFILES_DIR"/assets)"
export PROFILE_PICTURE="${PROFILE_PICTURE:-$ASSETS_DIR/profile-rose.jpeg}"
export DARWIN_DIR="${DARWIN_DIR:-$DOTFILES_DIR/darwin}"
export PLIST_DIR="${PLIST_DIR:-$DOTFILES_DIR/darwin/defaults}"
export LAUNCHD_DIR="${LAUNCHD_DIR:-$DOTFILES_DIR/darwin/launchd}"
