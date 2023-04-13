#!/bin/sh
HOME="${HOME:-/home/clayton}"
PWD=$(git rev-parse --show-toplevel)

install_executables() {
    # Ensure ~/.local/bin path is available for install
    if [ ! -d "$HOME/.local" ]; then
        echo "Creating $HOME/.local directory..."
        mkdir "$HOME/.local"
        echo "Creating $HOME/.local/bin directory..."
        mkdir "$HOME/.local/bin"
    else
        if [ ! -d "$HOME/.local/bin" ]; then
            mkdir "$HOME/.local/bin"
        fi
    fi
    
    # Softlink all executables
    printf "\nSoftlinking scripts/excecutables...\n\n"
    excecutables=$(find ./bin -maxdepth 1 -exec basename {} \;)
    echo "$excecutables" | while read -r file; do 
        ln -svf "$PWD/bin/$file" "$HOME/.local/bin/$file"
    done
    rm "$HOME/.local/bin/bin"
}

install_config () {
    # Ensure ~/.config path is available
    if [ ! -d "$HOME/.config" ]; then
        echo "Creating $HOME/.config directory..."
        mkdir "$HOME/.config"
    fi
    
    # Softlink all configs
    printf "\nSoftlinking configuration files...\n\n"
    configs=$(find ./config -maxdepth 1 -exec basename {} \;)
    echo "$configs" | while read -r file; do 
        ln -svf "$PWD/config/$file" "$HOME/.config/$file"
    done
    rm "$HOME/.config/config"
    printf "\n"
}

main () {
    install_executables
    install_config
}

main
