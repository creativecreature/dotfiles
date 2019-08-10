#!/bin/bash

source './scripts/helpers.sh'

echo_header "Terminal configuration"
echo_item "Symlinking GTK styles for the terminal"
ln -sfn $HOME/dotfiles/terminal/gtk.css $HOME/.config/gtk-3.0/gtk.css

echo ""
