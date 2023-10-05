#!/bin/sh
# Install homebrew
echo "Checking if Homebrew is installed..."
if ! brew --version > /dev/null; then
    echo "Homebrew isn't installed, installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed, proceeding..."
fi
# Select profile
echo "Which brew bundle would you like to install? (mbp, mb-air)"
read -r profile
case "$profile" in
  mbp | complete)
    echo "Setting brewfile bundle to mbp profile..."
    HOMEBREW_BREWFILE=../config/brewfile/Brewfile.mbp
    ;;
  mb-air | minimal)
    echo "Setting brewfile bundle to mb-air profile..."
    HOMEBREW_BREWFILE=../config/brewfile/Brewfile.mb-air
    ;;
  *)
    echo "Invalid choice. Please choose mbp or mb-air."
    ;;
esac
# brew bundle install
echo "installing $HOMEBREW_BREWFILE"
