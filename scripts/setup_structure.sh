#!/bin/bash

CODE_DIR=$HOME/code
VIAPLAY_DIR=$HOME/code/viaplay
CONNER_DIR=$HOME/code/conner
BIN_DIR=$HOME/bin
INSTALL_DIR=$HOME/.config/dotfile-installs
WALLPAPER_DIR=$HOME/wallpaper

echo_header "Setting up source code directory structure"

if [[ -d "$CODE_DIR" ]]; then
  echo_item "Code dir already exists" "green"
else
  echo_item "Creating code dir" "green"
  mkdir $HOME/code
fi

if [[ -d "$VIAPLAY_DIR" ]]; then
  echo_item "Viaplay dir already exists" "green"
else
  echo_item "Creating viaplay dir" "green"
  mkdir $HOME/code/viaplay
fi

if [[ -d "$CONNER_DIR" ]]; then
  echo_item "Conner dir already exists" "green"
else
  echo_item "Creating conner dir" "green"
  mkdir $HOME/code/conner
fi

if [[ -d "$BIN_DIR" ]]; then
  echo_item "Bin dir already exists" "green"
else
  echo_item "Creating bin dir" "green"
  mkdir $HOME/bin
fi

if [[ -d "$INSTALL_DIR" ]]; then
  echo_item "Dotfile-installs directory already exists" "green"
else
  echo_item "Creating dotfile-installs directory" "green"
  mkdir "$INSTALL_DIR"
fi

if [[ -d "$WALLPAPER_DIR" ]]; then
  echo_item "Wallpaper directory already exists" "green"
else
  echo_item "Creating Wallpaper directory" "green"
  mkdir "$WALLPAPER_DIR"
fi

echo ""
