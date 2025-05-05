#!/bin/sh
swaylock -i "$(swww query | grep -oP '(?<=image: ).*')"
