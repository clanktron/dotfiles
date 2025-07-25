PS1='\[\e[32m\]\u@\[\e[37m\]\h \[\e[34m\]\w \[\e[37m\]>> '
set -o vi

# ENVIRONMENT
export EDITOR=nvim
GPG_TTY="$(tty)" && export GPG_TTY="$GPG"
# set -gx EDITOR 'code --wait'
export XDG_CONFIG_HOME="$HOME"/.config
export KUEBCONFIG="$HOME"/.kube/config
export GOPATH="$HOME"/.go
export BASHRC="$HOME"/.bashrc
export VENDOR_DIR="$HOME"/Developer/repos/vendor
export BLOG_DIR="$HOME"/Developer/repos/clanktron/blog/src/contents

## PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/opt/pkg/sbin:/opt/pkg/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/run/current-system/sw/bin:$PATH
export PATH=/run/wrappers/bin:$PATH
export PATH=$HOME/.nix-profile/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=$HOME/Developer/vendor/google-cloud-sdk/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.rd/bin:$PATH
export PATH=$HOME/Developer/repos/clanktron/restic-backups:$PATH

# General aliases
alias resource='. $BASHRC'
alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -d .*'
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gr=gitroot
alias gl='git log'
alias gs='git status'
alias ga='git add'
alias k=kubectl
alias kd='kubectl describe'
alias kg='kubectl get'
alias ka='kubectl apply'
alias kc='kubectx'
alias c='clear'
alias lg='lazygit'
alias ta='tmux attach -t'
alias nas='ssh git@nas'
alias vmbox='VBoxManage'

# Enable zoxide integration
if command -v zoxide > /dev/null; then
	eval "$(zoxide init bash)"
fi

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

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/clayton.castro/.lmstudio/bin"
# End of LM Studio CLI section
