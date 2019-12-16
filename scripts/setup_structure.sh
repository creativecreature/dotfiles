#!/bin/bash

CODE_DIR=/home/$USER/code
VIAPLAY_DIR=/home/$USER/code/viaplay
USER_DIR=/home/$USER/code/$USER
BIN_DIR=/home/$USER/bin
INSTALL_DIR=/home/$USER/.config/dotfile-installs
WALLPAPER_DIR=/home/$USER/wallpaper

echo "Setting up source code directory structure"

if [[ -d "$CODE_DIR" ]]; then
  echo "Code dir already exists"
else
  echo "Creating code dir"
  mkdir /home/$USER/code
fi

if [[ -d "$VIAPLAY_DIR" ]]; then
  echo "Viaplay dir already exists"
else
  echo "Creating viaplay dir"
  mkdir /home/$USER/code/viaplay
fi

if [[ -d "$USER_DIR" ]]; then
  echo "Username dir already exists"
else
  echo "Creating username code dir"
  mkdir /home/$USER/code/$USER
fi

if [[ -d "$BIN_DIR" ]]; then
  echo "Bin dir already exists"
else
  echo "Creating bin dir"
  mkdir /home/$USER/bin
fi

if [[ -d "$INSTALL_DIR" ]]; then
  echo "Dotfile-installs directory already exists"
else
  echo "Creating dotfile-installs directory"
  mkdir "$INSTALL_DIR"
fi

echo ""
