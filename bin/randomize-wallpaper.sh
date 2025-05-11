#!/bin/sh
new_wallpaper=$(find /home/clayton/Developer/repos/clanktron/dotfiles/assets/wallpapers/ -type f | shuf -n 1)
swww img "$new_wallpaper"
