#!/bin/bash

TMUX_DIR=/home/$USER/.tmux
PLUGIN_DIR=/home/$USER/.tmux/plugins
TPM_DIR=/home/$USER/.tmux/plugins/tpm

echo_header "TMUX Configuration"

if [[ -d "$TMUX_DIR" ]]; then
  echo_item ".tmux directory already exists" "green"
else
  mkdir "$TMUX_DIR"
fi

echo_item "Symlinking tmux configuration" "green"
ln -sf /home/$USER/dotfiles/tmux/conf /home/$USER/.tmux.conf

if [[ -d "$PLUGIN_DIR" ]]; then
  echo_item "Plugin directory already exists" "green"
else
  mkdir "$PLUGIN_DIR"
fi

if [[ -d "$TPM_DIR" ]]; then
  echo_item "Tpm directory already exists" "green"
else
  echo_item "Cloning TPM directory" "green"
  git clone https://github.com/tmux-plugins/tpm /home/$USER/.tmux/plugins/tpm
fi

echo_item "Symlinking tat script" "green"
ln -sf /home/$USER/dotfiles/tmux/tat /home/$USER/bin/tat

echo ""
