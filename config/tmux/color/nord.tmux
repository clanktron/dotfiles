COLOR1="#2e3440"
COLOR2="#3b4252"
COLOR3="#434c5e"
COLOR4="#d8dee9"
COLOR5="#a9b1d6"

set -g mode-style "fg=#{COLOR4},bg=#{COLOR2}"

set -g message-style "fg=#{COLOR4},bg=#{COLOR2}"
set -g message-command-style "fg=#{COLOR4},bg=#{COLOR2}"

set -g pane-border-style "fg=#{COLOR2}"
set -g pane-active-border-style "fg=#{COLOR4}"

set -g status "on"
set -g status-justify "left"

set -g status-style bg=default

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#{COLOR1},bg=#{COLOR4},bold] #S #[fg=#{COLOR4},bg=default,nobold,nounderscore,noitalics] "
set -g status-right "#[fg=#{COLOR2},bg=default,nobold,nounderscore,noitalics]#[fg=#{COLOR4},bg=#{COLOR2}] %Y-%m-%d  %I:%M %p #[fg=#{COLOR4},bg=#{COLOR2},nobold,nounderscore,noitalics]#[fg=#{COLOR1},bg=#{COLOR4},bold] #h "

setw -g window-status-activity-style "underscore,fg=#{COLOR5},bg=#{COLOR3}"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#{COLOR5},bg=default"
setw -g window-status-format "#[fg=#{COLOR5},default] #I  #W #F "
setw -g window-status-current-format "#[fg=#{COLOR4},bg=#{COLOR2},bold] #I  #W #F #[fg=#{COLOR2},bg=default,nobold,nounderscore,noitalics]"
