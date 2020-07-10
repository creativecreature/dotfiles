#!/bin/bash

CODE_DIR=~/code
VIAPLAY_DIR=~/code/viaplay
USER_DIR=~/code/$USER
BIN_DIR=~/bin
CONFIG_DIR=~/.config
INSTALL_DIR=~/.config/dotfile-installs
TMP_DIR=~/tmp

echo "Setting up source code directory structure"

if [[ -d "$CODE_DIR" ]]; then
  echo "Code dir already exists"
else
  echo "Creating code dir"
  mkdir ~/code
fi

if [[ -d "$VIAPLAY_DIR" ]]; then
  echo "Viaplay dir already exists"
else
  echo "Creating viaplay dir"
  mkdir ~/code/viaplay
fi

if [[ -d "$USER_DIR" ]]; then
  echo "Username dir already exists"
else
  echo "Creating username code dir"
  mkdir ~/code/$USER
fi

if [[ -d "$BIN_DIR" ]]; then
  echo "Bin dir already exists"
else
  echo "Creating bin dir"
  mkdir ~/bin
  mkdir ~/.bin
fi

if [[ -d "$CONFIG_DIR" ]]; then
  echo "Config dir  already exists"
else
  echo "Creating Config directory"
  mkdir "$CONFIG_DIR"
fi

if [[ -d "$INSTALL_DIR" ]]; then
  echo "Dotfile-installs directory already exists"
else
  echo "Creating dotfile-installs directory"
  mkdir "$INSTALL_DIR"
fi

if [[ -d "$TMP_DIR" ]]; then
  echo "Tmp directory already exists"
else
  echo "Creating Tmp directory"
  mkdir "$TMP_DIR"
fi

echo ""
