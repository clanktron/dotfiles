# Misc Arch/General Linux Notes
>keep in mind this is all for a wayland setup

## Gnome Settings
```bash
# Set screen to just go blank on inactive login, rather than suspend
sudo -u gdm dbus-run-session gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type blank
# Set power button to actually power off instead of suspend at login screen
sudo -u gdm dbus-run-session gsettings set org.gnome.settings-daemon.plugins.power power-button-action interactive
```

## Keyboard maps
[wev](https://aur.archlinux.org/packages/wev)
- useful for finding keybindsym for sway

## Systemd Servies
list of services to manually enable since they aren't by default:
- tailscale
- bluetooth
- seat (*needed for Sway to start!!!*)
    - user should also be apart of seat group

## Nerdctl (all my homies hate docker)
```bash
pacman -Syu nerdctl 
# for rootless containers
pacman -Syu rootlesskit slirp4nets
# for building containers
pacman -Syu buildkit
# for running containers
pacman -Syu cni-plugins
```

### Misc

#### Beep kernel mod
the builtin "beeper" PC speaker can be disabled with
```bash
modprobe -r pcspkr snd_pcsp
```
or add a blacklist entry in /etc/modprobe.d/blacklist
```/etc/modprobe.d/blacklist
blacklist pcspkr
blacklist snd_pcsp
```
