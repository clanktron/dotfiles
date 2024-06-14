#!/bin/sh
# text attributes
green="\033[32m"
orange="\033[38;5;166m"
red="\033[31m"
light_green="\033[38;5;178m"
light_orange="\033[38;5;208m"
light_red="\033[38;5;196m"
reset="\033[0m"

info() {
    printf "${green}[ INFO ]${reset} ${light_green}%b${reset}" "$1"
}

warn() {
    printf "${orange}[ WARN ]${reset} ${light_orange}%b${reset}" "$1"
}

error() {
    printf "${red}[ ERROR ]${reset} ${light_red}%b${reset}" "$1"
}

msg() {
    printf "${light_green}%b${reset}" "$1"
}

prompt() {
    while true; do
        msg "$1"
        read -r response
        case $response in
            Yes | yes | Y | y )
                "$2"
                break
            ;;
            No | no | N | n )
                info "Skipping...\n"
                exit
            ;;
            *)
                warn "Bad input\n"
            ;;
        esac
    done
}
