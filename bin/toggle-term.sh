#!/bin/sh

TERM_PROCESS=wezterm
TERM=org.wezfurlong.wezterm

if pgrep -f "$TERM_PROCESS" > /dev/null; then
    pkill "$TERM_PROCESS"
else
    "$TERM" &
fi
