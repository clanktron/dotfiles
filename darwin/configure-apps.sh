#!/bin/sh
DOTFILES_DIR="${DOTFILES_DIR:?}"
. "$DOTFILES_DIR"/bin/formatting.sh

prompt "Would you like to configure your default apps? (y/n): "

add_login_item() {
    info "Adding $1 to login items\n"
    osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"/Applications/$1.app\", name:\"$1\", hidden:true}" > /dev/null
}

import_plist() {
    APP=$1
    DOMAIN=$2
    plist_file="$PLIST_DIR"/"$APP".plist
    [ ! -f "$plist_file" ] && warn "no plist file to import, skipping...\n" && return
    if pgrep "$APP" > /dev/null; then
        info "$APP is running, killing process before import\n"
        pkill "$APP"
    fi
    info "Importing $APP preferences with defaults utility...\n"
    if defaults import "$DOMAIN" "$plist_file"; then
        info "$APP preferences set!\n"
    else
        error "Failed to import $APP preferences\n"
    fi
    if open -a "$APP"; then
        info "Restarted $APP!\n"
    else
        error "Failed to restart $APP\n" 
    fi
}

set_defaults() {
    APP=$1
    DOMAIN=$2
    info "Checking if $APP is installed...\n"
    if ls /Applications/"$APP".app > /dev/null; then
        info "$APP is installed, proceeding...\n"
            import_plist "$APP" "$DOMAIN"
    else
        warn "$APP is not installed, skipping...\n"
    fi
}

set_defaults "Stats" "eu.exelban.Stats"
set_defaults "Itsycal" "com.mowglii.ItsycalApp"
# defaults write com.mowglii.ItsycalApp ShowLocation -bool YES (bug #231)
set_defaults "Hammerspoon" "org.hammerspoon.Hammerspoon"
set_defaults "Hidden Bar" "com.dwarvesv.minimalbar"
set_defaults "Bitwarden" "com.bitwarden.desktop"
set_defaults "Tailscale" "io.tailscale.ipn.macsys"
add_login_item "Tailscale"

info "Finished settings system preferences!\n"
