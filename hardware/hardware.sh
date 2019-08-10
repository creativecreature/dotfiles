#!/bin/bash

source './scripts/helpers.sh'

echo_header "Hardware Configuration"
echo_item "Adding US and SE keyboard input sources"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'se')]"

echo ""
