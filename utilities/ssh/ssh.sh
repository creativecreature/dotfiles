#!/bin/bash

configure_ssh() {
  SSH_DIR=~/.ssh
  SSH_CONFIG=~/.ssh/config
  CREATIVE_CREATURE_KEY_PUB=~/.ssh/creativecreature.pub

  mkdir -p $SSH_DIR

  if [[ -f "$CREATIVE_CREATURE_KEY_PUB" || -L "$CREATIVE_CREATURE_KEY_PUB" ]]; then
    echo_item "ssh key for creativecreature was already created" "green"
  else
    echo_item "generating a ssh key for creativecreature" "green"
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/creativecreature -C "hello@creativecreature.com"
  fi

  echo_item "symlinking ssh config to ~/.ssh/config" "green"
  ln -sf ~/dotfiles/utilities/ssh/config ~/.ssh/config
  chmod 600 ~/.ssh/config
}
