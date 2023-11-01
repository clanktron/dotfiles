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


