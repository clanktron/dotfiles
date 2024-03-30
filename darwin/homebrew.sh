#!/bin/sh
DOTFILES_DIR="${DOTFILES_DIR:?}"
. "$DOTFILES_DIR"/formatting.sh

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
