### Toggle key bindings for remote session interaction
color_status_text_remote="colour245"
color_window_off_status_bg_remote="colour238"
color_light_remote="white" #colour015
color_dark_remote="colour232" # black= colour232
color_window_off_status_current_bg_remote="colour254"

# Sets statusbar to have alternate colorscheme and disables all tmux keybindings
# 
# - should eventually make this colorscheme agnostic (changes dynamically depenging on startup colorscheme)
# - as of now its a copy-paste of tokyonight with some custom values changed to "white" 
bind -T root F2  \
  set prefix None \;\
  set key-table off \;\
  set status-style "fg=#7aa2f7,bg=white" \;\
  set status-right "#[fg=#1f2335,bg=white,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#1f2335] #{prefix_highlight} #[fg=#3b4261,bg=#1f2335,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261] %Y-%m-%d  %I:%M %p #[fg=#7aa2f7,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#1d202f,bg=#7aa2f7,bold] #h " \;\
  set window-status-current-format "#[fg=#1f2335,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=white,bg=#3b4261,bold] #I  #W #F #[fg=#3b4261,bg=white,nobold,nounderscore,noitalics]" \;\
  if -F '#{pane_in_mode}' 'send-keys -X cancel' \;\
  refresh-client -S \;\

bind -T off F2 \
  set -u prefix \;\
  set -u key-table \;\
  set -u status-style \;\
  set -u status-right \;\
  set -u window-status-current-format \;\
  refresh-client -S
