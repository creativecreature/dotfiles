#!/bin/bash

echo_header "Hardware Configuration"
echo_item "Adding US and SE keyboard input sources" "green"
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'se')]"

echo_item "Symlinking bluetooth config"
sudo ln -sf /home/$USER/dotfiles/hardware/pulse /etc/pulse/default.pa

echo ""
