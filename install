#!/bin/sh
HOME="${HOME:?}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:?}"
PWD=$(git rev-parse --show-toplevel)
install_action="cp -r"
action_msg="Copying"

if [ "$1" = "link" ]; then
   install_action="ln -svf"
   action_msg="Symlinking"
fi

ensure_paths() {
    # Ensure ~/.config path is available
    if [ ! -d "$HOME"/.config ]; then
        echo "Creating $HOME/.config directory..."
        mkdir "$HOME"/.config
    fi

    # Ensure ~/.local/bin path is available for install
    if [ ! -d "$HOME"/.local ]; then
        echo "Creating $HOME/.local directory..."
        mkdir "$HOME"/.local
        echo "Creating $HOME/.local/bin directory..."
        mkdir "$HOME"/.local/bin
    else
        if [ ! -d "$HOME"/.local/bin ]; then
            mkdir "$HOME"/.local/bin
        fi
    fi
}

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

install_executables() {
    # Softlink all executables in bin directory to ~/.local/bin
    printf "%s scripts/excecutables...\n" "$action_msg"
    find ./bin -maxdepth 1 -exec basename {} \; | sed 1d | while read -r file; do 
        eval "$install_action" "$PWD"/bin/"$file" "$HOME"/.local/bin/"$file"
    done
}

install_config () {
    # Install all directories in ./config to ~/.config
    printf "%s config folders...\n" "$action_msg"
    find ./config -maxdepth 1 -exec basename {} \; | sed 1d | while read -r dir; do 
        eval "$install_action" "$PWD"/config/"$dir" "$XDG_CONFIG_HOME/$dir"
    done

    eval "$install_action" "$PWD"/.bashrc "$HOME"/.bashrc
}

main () {
    ensure_paths
    remove_installation
    install_config
    install_executables
    printf "Done!\n"
}

main
