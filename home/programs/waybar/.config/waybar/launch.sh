#!/usr/bin/env bash

# Terminate already running bar instances
pkill waybar

# Wait until the processes have been shut down
while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

# Launch bar
waybar

echo "Bar launched..."
