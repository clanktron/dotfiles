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
BASE_BREWFILE=./Brewfile
echo "Which brew bundle would you like to install? (mbp, mb-air)"
read -r profile
case "$profile" in
  mbp | complete)
    echo "Setting brewfile bundle to mbp profile..."
    BREWFILE=./mbp/Brewfile
    ;;
  mb-air | minimal)
    echo "Setting brewfile bundle to mb-air profile..."
    BREWFILE=./mb-air/Brewfile
    ;;
  *)
    echo "Invalid choice. Please choose mbp or mb-air."
    ;;
esac
echo "installing brewfile contents..."
HOMEBREW_CASK_OPTS=--no-quarantine brew bundle install --file="$BASE_BREWFILE" --file="$BREWFILE"
echo "Done!"
