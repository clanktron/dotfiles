# Vim-like copy mode
set -s copy-command 'wl-copy'
bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'wl-copy'
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'wl-copy'
