#!/bin/bash

source 'scripts/helpers.sh'

CODE_DIR=$HOME/code
VIAPLAY_DIR=$HOME/code/viaplay
CONNER_DIR=$HOME/code/conner

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
  mkdir $HOME/viaplay
fi

if [[ -d "$CONNER_DIR" ]]; then
  echo_item "Conner dir already exists" "green"
else
  echo_item "Creating conner dir" "green"
  mkdir $HOME/conner
fi

echo ""
