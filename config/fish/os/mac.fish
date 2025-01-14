# Environment variables
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx HOMEBREW_NO_VERIFY_ATTESTATIONS 1

# Path
# Use GNU coreutils instead of any mac builtins
set -px PATH /opt/homebrew/bin
set -px PATH /usr/local/opt/coreutils/libexec/gnubin
set -px PATH /nix/var/nix/profiles/default/bin
set -ax PATH /Library/Apple/usr/bin
set -ax PATH /Applications/VMware\ Fusion.app/Contents/Public
set -ax PATH /Applications/Wireshark.app/Contents/MacOS

# Aliases
alias sleep1 'sudo pmset disablesleep -1'
alias sleep0 'sudo pmset disablesleep -0'
alias dns 'sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias poweroff 'sudo shutdown -h now'
