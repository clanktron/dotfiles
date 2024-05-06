if not status --is-interactive
    exit
end

# Attach to tmux session if it already exists
if command -q TMUX; and not set -q TMUX
    tmux attach > /dev/null 2>&1
end

# ENVIRONMENT
# set -gx EDITOR 'code --wait'
set -gx EDITOR nvim
set -gx GPG_TTY (tty)
set -gx XDG_CONFIG_HOME $HOME/.config
set -px XDG_DATA_DIRS $HOME/.local/share
set -gx KUBECONFIG $HOME/.kube/config
set -gx GOPATH $HOME/.go
set -gx FISHRC $HOME/.config/fish/config.fish
set -gx VENDOR_DIR $HOME/Developer/repos/vendor

## PATH
set -gx PATH /usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
set -px PATH /opt/pkg/sbin:/opt/pkg/bin
set -px PATH /usr/local/go/bin
set -px PATH /nix/var/nix/profiles/default/bin
set -px PATH $HOME/.local/bin
set -px PATH $HOME/.local/share/nvim/mason/bin
set -px PATH $HOME/.go/bin
set -px PATH $HOME/.cargo/bin
set -px PATH $HOME/Developer/repos/clanktron/restic-backups
set -px PATH $HOME/.rd/bin
set -px PATH $HOME/Developer/vendor/google-cloud-sdk/bin

# Fish defaults
set fish_greeting ""
fish_vi_key_bindings
## Prompt
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Colorscheme
set COLOR nightfox
source (dirname (status --current-filename))/colors/$COLOR.fish

# General aliases
alias resource '. $FISHRC'
alias l 'ls -l'
alias la 'ls -a'
alias ll 'ls -l'
alias lh 'ls -d .*'
alias c 'clear'
alias gitroot 'cd (git rev-parse --show-toplevel)'
alias gr gitroot
alias gl 'git log'
alias gs 'git status'
alias ga 'git add'
alias ta 'tmux attach'
alias k kubectl
alias kd 'kubectl describe'
alias kg 'kubectl get'
alias ka 'kubectl apply'
alias kc 'kubectx'
alias lg 'lazygit'
alias vmbox 'VBoxManage'
alias get_idf '. $VENDOR_DIR/esp-idf/export.fish'

# zoxide integration
if command -q zoxide
    zoxide init fish | source
end

if command -q opam
    eval (opam env)
end

# Ensure ssh agent
if test -z (pgrep ssh-agent | string collect)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
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
if [ -f (dirname (status --current-filename))/local.fish ]
    source (dirname (status --current-filename))/local.fish
end

# Start TMUX on login
if command -q tmux; and not set -q TMUX
    tmux new -s main
end
