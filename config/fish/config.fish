# ENVIRONMENT
set -gx EDITOR nvim
#set -gx EDITOR 'code --wait'
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx SOPS_AGE_KEY_FILE ~/.config/sops/age/age.agekey

## PATH
set -gx PATH $HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
set -gx GOPATH ~/Developer/go
set -px PATH $GOPATH/bin
set -px PATH ~/.local/bin
set -px PATH ~/.cargo/bin
set -px PATH ~/.rd/bin

# Fish defaults
set fish_greeting ""
fish_vi_key_bindings

# Colorscheme
set COLOR tokyonight 
source (dirname (status --current-filename))/colors/$COLOR.fish

# Prompt
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# General aliases
alias ip "ifconfig | grep 'broadcast' | awk '{print \$2}'"
alias restart 'sudo shutdown -r now'
alias la 'ls -a'
alias ll 'ls -lh'
alias k kubectl
alias kd 'kubectl describe'
alias kg 'kubectl get'
alias ka 'kubectl apply -f'
alias kc 'kubectx'
alias docker 'nerdctl'
alias ucla-vpn 'sudo openconnect --protocol=anyconnect https://ssl.vpn.ucla.edu'
alias c 'clear'
# zoxide integration
zoxide init fish | source

# Functions
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
    open -a firefox https://google.com/search"?q=$argv"
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
    source (dirname (status --current-filename))/os/mac.fish
  case Linux
    source (dirname (status --current-filename))/os/linux.fish
  case '*'
    source (dirname (status --current-filename))/os/windows.fish
end

