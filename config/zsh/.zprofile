# Start tmux on login
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t main || tmux new -s main
fi

#unlock bitwarden vault
#PASSWORD=clank-tronix!

#test=$(bw unlock $PASSWORD | grep -m2 -w 'BW_SESSION' | awk '{print $3}' |  tail -n1 )
#export $test
