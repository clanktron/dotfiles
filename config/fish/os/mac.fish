# Path
set -ax PATH /Library/Apple/usr/bin
set -ax PATH /Applications/VMware\ Fusion.app/Contents/Public
set -ax PATH /Applications/Wireshark.app/Contents/MacOS

# Aliases
alias sleep1 'sudo pmset disablesleep -1'
alias sleep0 'sudo pmset disablesleep -0'
alias dns 'sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
