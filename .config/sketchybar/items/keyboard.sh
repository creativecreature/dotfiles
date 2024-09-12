#!/usr/bin/env bash

keyboard=(
    icon.drawing=off
    script="$PLUGIN_DIR/keyboard.sh"
		label.padding_left=10
		label.padding_right=10
)

sketchybar --add item keyboard right        \
           --set keyboard "${keyboard[@]}"  \
           --add event keyboard_change "AppleSelectedInputSourcesChangedNotification" \
           --subscribe keyboard keyboard_change
