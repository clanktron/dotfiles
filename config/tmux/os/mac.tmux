# Open current directory
bind o run-shell "open #{pane_current_path}"

# Vim-like copy mode
set -s copy-command 'pbcopy'
# bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
# bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "pbcopy"

# Undercurl
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
