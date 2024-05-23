#!/bin/sh
gpu="${1:-/sys/class/hwmon/hwmon3}"
load=$(cat "$gpu"/device/gpu_busy_percent)
temp=$(cat "$gpu"/temp1_input)
temp=$(("$temp" / 1000))
printf " %s%% %s°C" "$load" "$temp"
