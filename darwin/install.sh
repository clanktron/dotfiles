#!/bin/sh
DOTFILES_DIR="${DOTFILES_DIR:?}"
. "$DOTFILES_DIR"/formatting.sh

echo "Would you like to install homebrew and/or your preferred bundle of applications?"
read -r response
case $response in
    Yes | yes | Y | y )
        ./homebrew.sh
    ;;
    *)
        echo "Skipping..."
    ;;
esac

"$DARWIN_DIR"/system-preferences.sh
"$DARWIN_DIR"/app-defaults.sh
"$DARWIN_DIR"/launchd.sh
