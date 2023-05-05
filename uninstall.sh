#!/bin/sh

remove_installation() {
    printf "Removing current config...\n"
    # Remove executables if they're installed
    find ./bin -maxdepth 1 -exec basename {} \; | sed 1d | while read -r file; do 
        if [ -e "${HOME:?}"/.local/bin/"$file" ]; then rm "${HOME:?}"/.local/bin/"$file"; fi
    done
    # Remove config directories if they're installed
    find ./config -maxdepth 1 -exec basename {} \; | sed 1d | while read -r dir; do 
        if [ -L "${XDG_CONFIG_HOME:?}"/"$dir" ]; then
            rm "${XDG_CONFIG_HOME:?}"/"$dir"
        else
            if [ -e "${XDG_CONFIG_HOME:?}"/"$dir" ]; then rm -r "${XDG_CONFIG_HOME:?}"/"$dir"; fi
        fi
    done
}

main() {
    remove_installation
    printf "Done!\n"
}

main

