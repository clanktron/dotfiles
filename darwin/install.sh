#!/bin/sh
WORKDIR=$(dirname "$(realpath "$0")")

homebrew() {
    "$WORKDIR"/homebrew.sh
}

preferences() {
    "$WORKDIR"/preferences.sh
}

main() {
    if [ "$BREW_FLAG" = "true" ]; then
        homebrew
    fi
    preferences
}

main
