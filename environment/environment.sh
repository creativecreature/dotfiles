#!/bin/bash

source 'scripts/helpers.sh'

echo_header "Environment Configuration"
echo_item "Symlinking environment file" "green"
sudo ln -sf $HOME/dotfiles/environment/environment /etc/environment

echo ""
