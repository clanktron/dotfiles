function ide
    tmux split-window -v -p 30
    tmux split-window -h -p 53
    nvim
end
