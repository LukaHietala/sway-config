#!/bin/sh

# check that its BAT0
bat="/sys/class/power_supply/BAT0"

while true; do
    if [ -d "$bat" ]; then
        cap=$(cat "$bat/capacity" 2>/dev/null || echo "?")
        stat=$(cat "$bat/status" 2>/dev/null || echo "?")
        line="Battery: ${cap}% (${stat}) | $(date +"%Y-%m-%d %H:%M:%S")"
    else
        line="Battery: N/A | $(date +"%Y-%m-%d %H:%M:%S")"
    fi

    echo "$line"
    sleep 1
done

