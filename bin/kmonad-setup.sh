#!/bin/sh
user="$USER"
if ! cat /etc/group | grep uinput > /dev/null; then
    echo "adding uinput user..."
    sudo useradd uinput
    echo "adding user to input and uinput groups..."
    sudo usermod -aG input,uinput "$user"
fi

sudo sh -c 'echo "KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"" > /etc/udev/rules.d/99-kmonad-udev.rules'
