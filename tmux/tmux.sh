#!/bin/bash

TMUX_VERSION=2.9a
TMUX_DIR=/home/$USER/.tmux
PLUGIN_DIR=/home/$USER/.tmux/plugins
TPM_DIR=/home/$USER/.tmux/plugins/tpm

if exists "tmux"; then
  echo_item "Tmux is already installed" "green"
else
  mkdir /home/$USER/tmp/tmux
  cd /home/$USER/tmp/tmux
  wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
  tar xf tmux-${TMUX_VERSION}.tar.gz
  rm -f tmux-${TMUX_VERSION}.tar.gz
  cd tmux-${TMUX_VERSION}
  ./configure && make
  sudo make install
  cd /home/$USER/dotfiles
  rm -rf /home/$USER/tmp/tmux
fi

echo ""


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
