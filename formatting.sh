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
    echo -e "${green}[ INFO ]${reset} ${light_green}$1${reset}"
}

warn() {
    echo -e "${orange}[ WARN ]${reset} ${light_orange}$1${reset}"
}

error() {
    echo -e "${red}[ ERROR ]${reset} ${light_red}$1${reset}"
}

