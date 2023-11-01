# Misc Arch Notes

## Beep kernel mod
the builtin "beeper" PC speaker can be disabled with
```bash
modprobe -r pcspkr snd_pcsp
```
or add a blacklist entry in /etc/modprobe.d/blacklist
```/etc/modprobe.d/blacklist
blacklist pcspkr
blacklist snd_pcsp
```

# Systemd Servies
list of services to manually enable since they aren't by default:
- tailscale
- bluetooth
- seat (*needed for Sway to start!!!*)
    - user should also be apart of seat group

# Nerdctl (all my homies hate docker)
```bash
pacman -Syu nerdctl 
# for rootless containers
pacman -Syu rootlesskit slirp4nets
# for building containers
pacman -Syu buildkit
# for running containers
pacman -Syu cni-plugins
```
