# Environment variables
set -gx HOMEBREW_NO_ENV_HINTS 1
set -x XDG_CONFIG_HOME /Users/clayton/.config

# Path
# Use GNU coreutils instead of any mac builtins
set -px PATH /usr/local/opt/coreutils/libexec/gnubin
# set -gx GOPATH ~/Developer/go
set -px PATH $GOPATH/bin
set -px PATH ~/.cargo/bin
# set -px PATH ~/.rd/bin
set -ax PATH /Library/Apple/usr/bin
set -ax PATH /Applications/VMware\ Fusion.app/Contents/Public
set -ax PATH /Applications/Wireshark.app/Contents/MacOS

# Aliases
alias sleep1 'sudo pmset disablesleep -1'
alias sleep0 'sudo pmset disablesleep -0'
alias dns 'sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias poweroff 'sudo shutdown -h now'
alias docker 'colima nerdctl --'
