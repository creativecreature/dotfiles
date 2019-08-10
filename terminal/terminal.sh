#!/bin/bash

echo_header "Terminal configuration"

echo_item "Symlinking GTK styles for the terminal" "green"
ln -sfn $HOME/dotfiles/terminal/gtk.css $HOME/.config/gtk-3.0/gtk.css

echo_item "Setting up terminal colors" "green"
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti

echo ""
