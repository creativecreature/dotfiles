#!/bin/bash

SSH_DIR=~/.ssh
SSH_CONFIG=~/.ssh/config
DEVADDICT_KEY_PUB=~/.ssh/devaddict_rsa.pub
PERSONAL_KEY_PUB=~/.ssh/private_rsa.pub

echo_header "SSH Setup"

if [[ -d "$SSH_DIR" ]]; then
  echo_item "SSH dir already exists" "green"
else
  echo_item "Creating ~/.ssh directory" "green"
  mkdir ~/.ssh
fi

if [[ -f "$DEVADDICT_KEY_PUB" || -L "$DEVADDICT_KEY_PUB" ]]; then
  echo_item "SSH key for devaddict already exists" "green"
else
  echo_item "Generating a SSH key for devaddict" "green"
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/devaddict_rsa -C "hello@devaddict.com"
fi

if [[ -f "$PERSONAL_KEY_PUB" || -L "$PERSONAL_KEY_PUB" ]]; then
  echo_item "Personal SSH key already exists" "green"
else
  echo_item "Generating personal SSH key" "green"
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/private_rsa -C "charlesvictorconner@gmail.com"
fi

echo_item "Symlinking config to ~/.ssh/config file" "green"
ln -sf ~/dotfiles/ssh/config ~/.ssh/config
chmod 600 ~/.ssh/config

echo ""
