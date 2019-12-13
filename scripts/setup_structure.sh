#!/bin/bash

CODE_DIR=/home/$USER_NAME/code
VIAPLAY_DIR=/home/$USER_NAME/code/viaplay
USER_DIR=/home/$USER_NAME/code/$USER_NAME
BIN_DIR=/home/$USER_NAME/bin
INSTALL_DIR=/home/$USER_NAME/.config/dotfile-installs
WALLPAPER_DIR=/home/$USER_NAME/wallpaper

echo "Setting up source code directory structure"

if [[ -d "$CODE_DIR" ]]; then
  echo "Code dir already exists" "green"
else
  echo "Creating code dir" "green"
  mkdir /home/$USER_NAME/code
fi

if [[ -d "$VIAPLAY_DIR" ]]; then
  echo "Viaplay dir already exists" "green"
else
  echo "Creating viaplay dir" "green"
  mkdir /home/$USER_NAME/code/viaplay
fi

if [[ -d "$USER_DIR" ]]; then
  echo "Username dir already exists" "green"
else
  echo "Creating username code dir" "green"
  mkdir /home/$USER_NAME/code/$USER_NAME
fi

if [[ -d "$BIN_DIR" ]]; then
  echo "Bin dir already exists" "green"
else
  echo "Creating bin dir" "green"
  mkdir /home/$USER_NAME/bin
fi

if [[ -d "$INSTALL_DIR" ]]; then
  echo "Dotfile-installs directory already exists" "green"
else
  echo "Creating dotfile-installs directory" "green"
  mkdir "$INSTALL_DIR"
fi

echo ""
