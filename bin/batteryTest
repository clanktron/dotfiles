#!/bin/sh

RECIPIENT=hello@claytonc.dev
START_TIME="$(date)"
while true;
do
    if [ "$(pmset -g batt | grep -Eo "\d+%" | cut -d'%' -f1)" -lt 5 ]; then
        END_TIME="$(date)"
        EMAIL="Battery Test Summary\n\tStart time: $START_TIME\n\tEnd time: $END_TIME\n"
        echo "$EMAIL" | mail -s "Battery Life Test" "$RECIPIENT" && exit 0
        exit 1
    fi;
    sleep 1
done
