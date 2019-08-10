#!/bin/bash

source 'scripts/helpers.sh'

TMUX_DIR=$HOME/.tmux
PLUGIN_DIR=$HOME/.tmux/plugins
TPM_DIR=$HOME/.tmux/plugins/tpm

echo_header "TMUX Configuration"

if [[ -d "$TMUX_DIR" ]]; then
  echo_item ".tmux directory already exists" "green"
else
  mkdir "$TMUX_DIR"
fi

echo_item "Symlinking tmux configuration" "green"
ln -sf $HOME/dotfiles/tmux/conf $HOME/.tmux.conf

if [[ -d "$PLUGIN_DIR" ]]; then
  echo_item "Plugin directory already exists" "green"
else
  mkdir "$PLUGIN_DIR"
fi

if [[ -d "$TPM_DIR" ]]; then
  echo_item "Tpm directory already exists" "green"
else
  echo_item "Cloning TPM directory" "green"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo_item "Symlinking tat script" "green"
ln -sf $HOME/dotfiles/tmux/tat $HOME/bin/tat

echo ""
