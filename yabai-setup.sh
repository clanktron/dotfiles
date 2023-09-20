#!/bin/sh
# yabai post-install setup

YABAI=$(which yabai)
HASH=$(shasum -a 256 "$(which yabai)")

user="${1:-clayton}"
yabai_sudoers_file=/private/etc/sudoers.d/yabai

echo "$user ALL=(root) NOPASSWD: sha256:$HASH $YABAI --load-sa" | EDITOR='tee' visudo -f "$yabai_sudoers_file"
