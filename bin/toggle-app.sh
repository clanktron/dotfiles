#!/bin/sh
APP="${1:-org.wezfurlong.wezterm}"
APP_PATH="${2:-$APP}"
if hyprctl clients | grep class:."$APP" > /dev/null; then
    wlrctl window focus "$APP"
else
 "$APP_PATH" &
fi


# below is the inspiration for the script, don't think I need all of this tho?
# hyprctl clients | grep class:."$TERM" \
#  && echo hyprctl keyword workspace $( hyprctl clients |grep class.."$TERM" -B4 && wlrctl window focus "$TERM")
#  || "$TERM"
