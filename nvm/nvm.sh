#!/bin/bash

if exists "node"; then
  echo_item "Node tools are already installed" "green"
else
  echo_item "Installing Node Tools" "green"
  mkdir $HOME/.nvm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm install 12.2.0
  npm install -g eslint@5.16 eslint-config-prettier@6.0.0 eslint-config-standard@12.0.0 eslint-plugin-import@2.18.0 eslint-plugin-jest@22.7.2 eslint-plugin-node@9 eslint-plugin-promise@4.2.1 eslint-plugin-standard@4.0.0 eslint-plugin-react babel-eslint yarn neovim spaceship-prompt
fi

echo ""
