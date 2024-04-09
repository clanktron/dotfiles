# Start Sway on login
if test -z $DISPLAY; and test (tty) = "/dev/tty1"
	exec sway
end

# Aliases
alias poke pokemon-showdown

# PATH
set -px PATH /var/lib/flatpak/exports/bin
