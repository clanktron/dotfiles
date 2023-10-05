#!/bin/sh
DOTFILES_DIR=$(git rev-parse --show-toplevel)
ASSETS_DIR="${ASSETS_DIR:-$DOTFILES_DIR/assets}"
WALLPAPER="${WALLPAPER:-$ASSETS_DIR/black-grey-mountain.png}"
PROFILE_PICTURE="${PROFILE_PICTURE:-$ASSETS_DIR/profile-rose.jpeg}"
PLIST_DIR="${PLIST_DIR:-$DOTFILES_DIR/darwin/plist}"

# text attributes
# bold=$(tput bold)
green=$(tput setaf 2)
orange=$(tput setaf 166)
red=$(tput setaf 1)
light_green=$(tput setaf 178)
light_orange=$(tput setaf 208)
light_red=$(tput setaf 196)
reset=$(tput sgr0)

info() {
    echo "${green}[ INFO ]${reset} ${light_green}$1${reset}"
}

warn() {
    echo "${orange}[ WARN ]${reset} ${light_orange}$1${reset}"
}

error() {
    echo "${red}[ ERROR ]${reset} ${light_red}$1${reset}"
}

add_login_item() {
    info "Adding $1 to login items"
    osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"/Applications/$1.app\", name:\"$1\", hidden:true}" > /dev/null
}

set_plist() {
    APP=$1
    DOMAIN=$2
    plist_file="$PLIST_DIR"/"$APP".plist
    [ ! -f "$plist_file" ] && warn "no plist file to import, skipping..." && return
    info "Checking for $APP domain with defaults utility..."
    if defaults domains | grep "$DOMAIN" > /dev/null; then
        info "Importing $APP preferences with defaults utility..."
        if defaults import "$DOMAIN" "$plist_file"; then
            info "$APP preferences set!"
            info "restarting $APP for changes to take effect..."
            if pkill "$APP" ; then
                info "successfully killed $APP process"
                if open -a "$APP"; then
                    info "restarted $APP!"
                else
                    error "$APP failed to start again"
                fi
            else
                error "failed to kill $APP process, skipping restart"
            fi
        else
            error "failed to import $APP preferences"
        fi
    else 
        error "$APP domain is missing from system, skipping preferences import"
    fi
}

configure_app() {
    APP=$1
    DOMAIN=$2
    login_item=$3
    set_plist=$4
    info "Checking if $APP is installed..."
    if ls /Applications/"$APP".app > /dev/null; then
        info "$APP is installed, proceeding..."
        if [ "$login_item" = 1 ]; then
            add_login_item "$APP"
        fi
        if [ "$set_plist" = 1 ]; then
            set_plist "$APP" "$DOMAIN"
        fi
    else
        warn "$APP is not installed, skipping..."
    fi
}

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
# Set profile picture
info "Setting profile picture with dscl utility (sudo permissions required)..."
if sudo dscl . create /Users/"$USER" Picture "$PROFILE_PICTURE"; then
    info "Profile picture set!"
else 
    error "Error setting profile picture"
fi
# Dock Preferences
info "Importing dock preferences from binary plist with defaults utility..."
if defaults import com.apple.dock ./mbp/dock.plist; then
    info "  restarting dock..."
    killall Dock
    info "Dock preferences set!"
else 
    error "Error setting dock preferences"
fi

APP=Stats
DOMAIN=eu.exelban.Stats
login_item=1
set_plist=1
configure_app "$APP" "$DOMAIN" "$login_item" "$set_plist"

APP=Itsycal
DOMAIN=com.mowglii.ItsycalApp
login_item=1
set_plist=1
configure_app "$APP" "$DOMAIN" "$login_item" "$set_plist"

APP=Hammerspoon
DOMAIN=org.hammerspoon.Hammerspoon
login_item=1
set_plist=1
configure_app "$APP" "$DOMAIN" "$login_item" "$set_plist"

APP="Hidden Bar"
DOMAIN=com.dwarvesv.minimalbar
login_item=1
set_plist=1
configure_app "$APP" "$DOMAIN" "$login_item" "$set_plist"

APP="AlDente"
DOMAIN=com.apphousekitchen.aldente-pro
login_item=1
set_plist=1
configure_app "$APP" "$DOMAIN" "$login_item" "$set_plist"

APP="Proton Mail Bridge"
DOMAIN=com.protonmail.bridge
login_item=1
set_plist=0
configure_app "$APP" "$DOMAIN" "$login_item" "$set_plist"

APP="Tailscale"
DOMAIN=io.tailscale.ipn.macsys
login_item=1
set_plist=0
configure_app "$APP" "$DOMAIN" "$login_item" "$set_plist"

info "Done!"
