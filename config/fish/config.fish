# ENVIRONMENT
# set -gx EDITOR 'code --wait'
# set -gx DBUS_SESSION_BUS_ADDRESS "unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx KUBECONFIG $HOME/.kube/config
set -gx GOPATH $HOME/.go
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx FISHRC $HOME/.config/fish/config.fish
set -gx SOPS_AGE_KEY_FILE $XDG_CONFIG_HOME/sops/age/age.agekey
set -gx VENDOR_DIR $HOME/Developer/repos/vendor
set -gx BLOG_DIR $HOME/Developer/repos/clanktron/blog/src/contents

# Bind-keys
# bind -M insert \t accept-autosuggestion

## PATH
set -gx PATH /usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
set -px PATH $HOME/Developer/vendor/google-cloud-sdk/bin
set -px PATH $HOME/.go/bin
set -px PATH $HOME/.local/bin

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
alias resource '. $FISHRC'
alias la 'ls -a'
alias ll 'ls -l'
alias lh 'ls -d .*'
alias c 'clear'
alias gitroot 'cd $(git rev-parse --show-toplevel)'
alias gr gitroot
alias ta 'tmux attach -t'
alias k kubectl
alias kd 'kubectl describe'
alias kg 'kubectl get'
alias ka 'kubectl apply'
alias kc 'kubectx'
alias lg 'lazygit'
alias vmbox 'VBoxManage'
alias get_idf '. $VENDOR_DIR/esp-idf/export.fish'

# zoxide integration
zoxide init fish | source

# Functions
function kn
    kubectl config set-context --current --namespace="$argv" && kubectl config view --minify | grep namespace:
end

function ide
    tmux split-window -v -p 30
    tmux split-window -h -p 53
    vi
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

# Source local config
# source (dirname (status --current-filename))/local.fish
