#!/bin/bash

if exists "node"; then
  echo_item "Node tools are already installed" "green"
else
  echo_item "Installing Node Tools" "green"
  mkdir $HOME/.nvm
  curl --silent -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm install 14 --silent
  npm install -g yarn neovim >/dev/null
fi

echo ""
