#!/bin/bash

echo_header "Environment Configuration"
echo_item "Symlinking environment file" "green"
sudo ln -sf /home/$USER/dotfiles/environment/environment /etc/environment

echo ""
