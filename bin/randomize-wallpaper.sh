#!/bin/sh
new_wallpaper=$(find /home/clayton/Developer/repos/clanktron/dotfiles/assets/wallpapers/ -type f | shuf -n 1)
ln -sf $new_wallpaper ~/.config/background
swww img ~/.config/background
