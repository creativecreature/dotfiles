#!/bin/bash

configure_ssh() {
  SSH_DIR=~/.ssh
  SSH_CONFIG=~/.ssh/config
  CREATIVE_CREATURE_KEY_PUB=~/.ssh/creativecreature.pub
  PERSONAL_KEY_PUB=~/.ssh/private_rsa.pub

  mkdir -p $SSH_DIR

  if [[ -f "$CREATIVE_CREATURE_KEY_PUB" || -L "$CREATIVE_CREATURE_KEY_PUB" ]]; then
    echo_item "ssh key for creativecreature was already created" "green"
  else
    echo_item "generating a ssh key for creativecreature" "green"
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/creativecreature -C "hello@creativecreature.com"
  fi

  if [[ -f "$PERSONAL_KEY_PUB" || -L "$PERSONAL_KEY_PUB" ]]; then
    echo_item "personal ssh key already exists" "green"
  else
    echo_item "generating personal ssh key" "green"
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/private_rsa -C "charlesvictorconner@gmail.com"
  fi

  echo_item "symlinking ssh config to ~/.ssh/config" "green"
  ln -sf ~/dotfiles/utilities/ssh/config ~/.ssh/config
  chmod 600 ~/.ssh/config
}
