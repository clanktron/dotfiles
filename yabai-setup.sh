#!/bin/sh
# yabai post-install setup

YABAI=$(which yabai)
HASH=$(shasum -a 256 "$(which yabai)")

user="${1:-clayton}"
yabai_sudoers_file=/private/etc/sudoers.d/yabai

echo "$user ALL=(root) NOPASSWD: sha256:$HASH $YABAI --load-sa" | sudo EDITOR='tee' visudo -f "$yabai_sudoers_file"

# enable service daemons
echo "Attempting to install yabai service" && yabai --install-service || echo "Already installed, restarting now..." yabai --restart-service
echo "Attempting to install skhd service" && skhd --install-service || echo "Already installed, restarting now..." skhd --restart-service
