#!/bin/sh

TERM=alacritty
TERM_PROCESS=$TERM

if pgrep -f "$TERM_PROCESS" > /dev/null; then
    pkill "$TERM_PROCESS"
else
    "$TERM" &
fi
