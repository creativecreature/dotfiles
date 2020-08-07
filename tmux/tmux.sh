#!/bin/bash

TMUX_DIR=~/.tmux
PLUGIN_DIR=~/.tmux/plugins
TPM_DIR=~/.tmux/plugins/tpm

if exists "tmux"; then
  echo_item "Tmux is already installed" "green"
else
  sudo apt-get -qq install tmux
fi

echo ""


if [[ -d "$TMUX_DIR" ]]; then
  echo_item ".tmux directory already exists" "green"
else
  mkdir "$TMUX_DIR"
fi

echo_item "Symlinking tmux configuration" "green"
ln -sf ~/dotfiles/tmux/conf ~/.tmux.conf
ln -sf ~/dotfiles/tmux/conf.osx ~/.tmux.conf.osx
ln -sf ~/dotfiles/tmux/conf.linux ~/.tmux.conf.linux

if [[ -d "$PLUGIN_DIR" ]]; then
  echo_item "Plugin directory already exists" "green"
else
  mkdir "$PLUGIN_DIR"
fi

if [[ -d "$TPM_DIR" ]]; then
  echo_item "Tpm directory already exists" "green"
else
  echo_item "Cloning TPM directory" "green"
  git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null
fi

echo_item "Symlinking tat script" "green"
ln -sf ~/dotfiles/tmux/tat ~/bin/tat

echo ""
