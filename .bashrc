# Shell look
PS1='\[\e[32m\]\u@\e[37m\]\h \e[34m\]\w \e[37m\]>> '

# ENVIRONMENT
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME"/.config
export GOPATH="$HOME"/.go
export bashrc=~/.bashrc
# set -gx EDITOR 'code --wait'

## PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$HOME/Developer/vendor/google-cloud-sdk/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# General aliases
alias restart='shutdown -r now'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -d .*'
alias k=kubectl
alias kd='kubectl describe'
alias kg='kubectl get'
alias ka='kubectl apply'
alias kc='kubectx'
alias c='clear'
alias lg='lazygit'
alias ta='tmux attach -t'
alias vm='VBoxManage'

# Enable zoxide integration
eval "$(zoxide init bash)"

# Functions
function kn() {
    kubectl config set-context --current --namespace="$1" && kubectl config view --minify | grep namespace:
}

function env-source() {
    set -a; source "$PWD"/.env; set +a
}

function ide() {
    tmux split-window -v -p 30
    tmux split-window -h -p 53
    vi
}
