### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/clayton/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Set Defaults
set fish_greeting ""
set -gx EDITOR vim
#set -gx EDITOR 'code --wait'
set -gx HOMEBREW_NO_ENV_HINTS 1

# Theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Aliases
alias ip "ifconfig | grep 'broadcast' | awk '{print \$2}'"
alias sleep1 "sudo pmset disablesleep -1"
alias sleep0 "sudo pmset disablesleep -0"
alias dns "sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias restart 'sudo shutdown -r now'
alias la 'ls -a'
alias ll 'ls -lha'
alias k kubectl
alias kd 'kubectl describe'
alias kg 'kubectl get'
alias ka 'kubectl apply -f'
alias kc 'kubectx'
alias docker 'nerdctl'
alias ucla-vpn 'sudo openconnect --protocol=anyconnect https://ssl.vpn.ucla.edu'

# Functions (might move these to dedicated folder or file)
function kn 
    kubectl config set-context --current --namespace="$argv" && kubectl config view --minify | grep namespace:
end

function ide
    tmux split-window -h -p 66
    tmux split-window -h -p 30
end

function ...
     cd ../..
end

function ....
     cd ../../..
end

function search 
    open -a firefox http://www.google.com/search"?q=$argv"
end

function sudo 
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
end

# Start TMUX on login
if status is-interactive 
and not set -q TMUX
    tmux attach -t main || tmux new -s main
end

# Source additional config based on OS
switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end
