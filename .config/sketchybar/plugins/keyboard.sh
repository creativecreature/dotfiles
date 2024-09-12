#!/usr/bin/env bash

LAYOUT="$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | cut -c 33- | rev | cut -c 2- | rev)"

# specify short layouts individually.
case "$LAYOUT" in
    "ABC") SHORT_LAYOUT="US";;
    *) SHORT_LAYOUT="SE";;
esac

sketchybar --set keyboard label="$SHORT_LAYOUT"
