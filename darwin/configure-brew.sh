#!/bin/sh
DOTFILES_DIR="${DOTFILES_DIR:?}"
. "$DOTFILES_DIR"/bin/formatting.sh

install_homebrew() {
    info "Checking if Homebrew is installed...\n"
    if ! brew --version > /dev/null; then
        info "Homebrew isn't installed, installing now...\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        info "Homebrew is already installed, proceeding...\n"
    fi
    info "Finished installing homebrew!\n"
}

install_brewfile() {
    # Select profile
    WORKDIR=$DOTFILES_DIR/darwin
    BASE_BREWFILE="$WORKDIR"/Brewfile
    if [ -z "$BREWFILE" ]; then
        msg "Which brew bundle would you like to install? default: none (base, mbp, mb-air, none): "
        read -r BREWFILE
    fi
    case "$BREWFILE" in
      base | default )
        info "Installing base brewfile bundle...\n"
        HOMEBREW_CASK_OPTS=--no-quarantine brew bundle install --file="$BASE_BREWFILE"
        ;;
      macbook-air | mb-air )
        info "Installing macbook air brewfile bundle...\n"
        HOMEBREW_CASK_OPTS=--no-quarantine brew bundle install --file="$BASE_BREWFILE" --file="$WORKDIR/mb-air/Brewfile"
        ;;
      macbook-pro | mbp )
        info "Installing macbook pro brewfile bundle...\n"
        HOMEBREW_CASK_OPTS=--no-quarantine brew bundle install --file="$BASE_BREWFILE" --file="$WORKDIR/mbp/Brewfile"
        ;;
      none | *)
        info "No valid bundle specified, skipping...\n"
        ;;
    esac
    info "Finished installing homebrew packages!\n"
}

if ! brew --version > /dev/null; then
    prompt "Would you like to install homebrew? (y/n): " install_homebrew
fi
prompt "Would you like to install a set of applications from a brewfile? (y/n): " install_brewfile
