# Dotfiles

Configuration files for my development environment. Feel free to grab anything
you like.

## Installation

There are two options to install the contents of this repo. One is to symlink
all files, allowing you to continue tracking them with git in your own fork of
this repo. The other is to simply install (copy) the files without tracking
them. 

>/bin contents will be placed in ~/.local/bin and /config contents will be
>placed in ~/.config

Make sure your $HOME and $XDG_CONFIG_HOME environment variables are set
properly before running any of the following scripts.

```bash
$ ./install -h
Usage: ./install [options]

Options:
  -l, --link       Create symbolic links instead of copying files
  -b, --backup     Backup any non-symlink files to be overwritten
  -h, --help       Display this help message and exit
```

## Uninstall

To remove all previously installed/linked files:
```bash
./uninstall
```
