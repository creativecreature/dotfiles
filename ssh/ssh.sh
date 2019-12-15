#!/bin/bash

SSH_DIR=/home/$USER_NAME/.ssh
SSH_CONFIG=/home/$USER_NAME/.ssh/config
WORK_KEY_PUB=/home/$USER_NAME/.ssh/nentgroup_rsa.pub
PERSONAL_KEY_PUB=/home/$USER_NAME/.ssh/private_rsa.pub

echo_header "SSH Setup"

if [[ -d "$SSH_DIR" ]]; then
  echo_item "SSH dir already exists" "green"
else
  echo_item "Creating ~/.ssh directory" "green"
  mkdir ~/.ssh
fi

if [[ -f "$WORK_KEY_PUB" || -L "$WORK_KEY_PUB" ]]; then
  echo_item "SSH key for work already exists" "green"
else
  echo_item "Generating a SSH key for nentgroup" "green"
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/nentgroup_rsa -C "victor.conner@nentgroup.com"
fi

if [[ -f "$PERSONAL_KEY_PUB" || -L "$PERSONAL_KEY_PUB" ]]; then
  echo_item "Personal SSH key already exists" "green"
else
  echo_item "Generating personal SSH key" "green"
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/private_rsa -C "charlesvictorconner@gmail.com"
fi

echo_item "Symlinking config to ~/.ssh/config file" "green"
ln -sf /home/$USER_NAME/dotfiles/ssh/config /home/$USER_NAME/.ssh/config
chmod 600 ~/.ssh/config

echo ""
