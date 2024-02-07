# Start Sway on login
if test -z $DISPLAY; and test (tty) = "/dev/tty1"
	exec sway
end

# Aliases
# alias docker "sudo nerdctl"

# PATH
set -px PATH /var/lib/flatpak/exports/bin
