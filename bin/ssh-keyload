#!/bin/sh
# add all keys in dir to agent
DIR="${1:-/Volumes/MINI}"
grep -slR "PRIVATE" "$DIR" | xargs ssh-add
