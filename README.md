# Dotfiles

![screenshot](assets/screenshot.png)

Configuration files for my development environment. Feel free to grab anything you like.

## Installation

There are two options to install the contents of this repo. One is to symlink all files, allowing you to continue tracking them with git in your own fork of this repo. The other is to simply install (copy) the files without tracking them. 

>/bin contents will be placed in ~/.local/bin and /config contents will be placed in ~/.config

Make sure your $HOME and $XDG_CONFIG_HOME environment variables are set properly before running any of the following scripts.

This will link all config files and executables from this repository to their respective destinations:
```bash
./install link
```
This will copy all config files and executables from this repository to their respective destinations:
```bash
./install
```
>both scripts are idempotent

## Uninstall

To remove all previously installed/linked files:
```bash
./uninstall
```
>Warning: This will remove the config directories installed, so if files were added to them after installation those will be removed as well.

## Software

* Terminal Emulator: [Alacritty](https://alacritty.org)
* Shells: [fish](https://fishshell.com), [bash](https://www.gnu.org/software/bash/)
* Multiplexer: [tmux](https://github.com/tmux/tmux/wiki)
* Editor: [Neovim](https://neovim.io)
* Package Manager: [Homebrew](https://brew.sh)
