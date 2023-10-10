#!/bin/sh
WORKDIR=$(dirname "$(realpath "$0")")
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

# Install homebrew
info "Checking if Homebrew is installed..."
if ! brew --version > /dev/null; then
    info "Homebrew isn't installed, installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    info "Homebrew is already installed, proceeding..."
fi
# Select profile
BASE_BREWFILE="$WORKDIR"/Brewfile
if [ -z "$BREWFILE" ]; then
    echo "Which brew bundle would you like to install? (base, mbp, mb-air, none) default: none"
    read -r BREWFILE
fi
case "$BREWFILE" in
  base | default )
    info "Installing base brewfile bundle..."
    HOMEBREW_CASK_OPTS=--no-quarantine brew bundle install --file="$BASE_BREWFILE"
    ;;
  macbook-air | mb-air )
    info "Installing macbook air brewfile bundle..."
    HOMEBREW_CASK_OPTS=--no-quarantine brew bundle install --file="$BASE_BREWFILE" --file="$WORKDIR/mb-air/Brewfile"
    ;;
  macbook-pro | mbp )
    info "Installing macbook pro brewfile bundle..."
    HOMEBREW_CASK_OPTS=--no-quarantine brew bundle install --file="$BASE_BREWFILE" --file="$WORKDIR/mbp/Brewfile"
    ;;
  none | *)
    info "No valid bundle specified, skipping..."
    ;;
esac
info "Finished installing homebrew and packages!"
