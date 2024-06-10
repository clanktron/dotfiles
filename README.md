# Dotfiles

![screenshot](assets/screenshot.png)

Configuration files for my development environment. Feel free to grab anything you like.

## Installation

>Warning: These scripts will remove all current contents of the target config directories, so please be sure to make backups first. I'll be adding another line or two to the scripts soon that makes backups by default.

There are two options to install the contents of this repo. One is to symlink all files, allowing you to continue tracking them with git in your own fork of this repo. The other is to simply install (copy) the files without tracking them. 

>/bin contents will be placed in ~/.local/bin and /config contents will be placed in ~/.config

Make sure your $HOME and $XDG_CONFIG_HOME environment variables are set properly before running any of the following scripts.

This will link all config files and executables from this repository to their respective destinations:
```bash
./install -l
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

## Configured Software

* Terminal Emulator(s): [Wezterm](https://wezfurlong.org/wezterm), [Alacritty](https://alacritty.org)
* Shell(s): [fish](https://fishshell.com), [bash](https://www.gnu.org/software/bash)
* Multiplexer: [tmux](https://github.com/tmux/tmux/wiki)
* Editor: [Neovim](https://neovim.io)
    * Plugin Manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
* Keyboard Manager: [Kmonad](https://github.com/kmonad/kmonad)
* Kubernetes Management: [K9s](https://k9scli.io)
* Mac Specific:
    * Package Manager: [Homebrew](https://brew.sh)
    * Window Manager: [Yabai](https://github.com/koekeishiya/yabai)
    * General Scripting: [Hammerspoon](https://www.hammerspoon.org/)
* Linux Specific:
    * Window Manager/Compositor(s): [Sway](https://swaywm.org), [Hyprland](https://hyprland.org) 
    * Widgets: [Waybar](https://github.com/alexays/waybar), [Wlogout](https://github.com/ArtsyMacaw/wlogout)
    * Notifications: [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
    * Launcher: [Wofi](https://hg.sr.ht/~scoopta/wofi)
