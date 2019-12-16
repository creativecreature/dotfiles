#!/bin/bash

echo_header "Solus Configuration"

# -- zsh -----------------------------------------------------------------------
if exists "zsh"; then
  echo_item "zsh is already installed" green
else
  sudo eopkg install zsh
fi

echo ""



# -- nvm -----------------------------------------------------------------------
if exists "node"; then
  echo_item "Node tools are already installed" green
else
  echo_item "Installing NVM and a few global NPM packages"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  NVM_DIR="/home/$USER/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm install 12.2.0
  npm install -g yarn
  npm install -g eslint eslint-plugin-react babel-eslint neovim npx
fi

echo ""



# -- Neovim --------------------------------------------------------------------
if exists "nvim"; then
  echo_item "Neovim is already installed" "green"
else
  echo_item "Installing Neovim" "green"
  sudo eopkg install neovim
  curl -fLo /home/$USER/dotfiles/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo ""



# -- Ctags --------------------------------------------------------------------
if exists "ctags"; then
  echo_item "Ctags is already installed" "green"
else
  echo_item "Installing Ctags" "green"
  sudo eopkg install ctags
fi

echo ""


# -- Ripgrep --------------------------------------------------------------------
if exists "rg"; then
  echo_item "Ripgrep is already installed" "green"
else
  echo_item "Installing Ripgrep" "green"
  sudo eopkg install ripgrep
fi

echo ""



# -- jq --------------------------------------------------------------------
if exists "jq"; then
  echo_item "jq is already installed" "green"
else
  echo_item "Installing jq" "green"
  sudo eopkg install jq
fi

echo ""

# -- Tmux --------------------------------------------------------------------
if exists "tmux"; then
  echo_item "Tmux is already installed" "green"
else
  echo_item "Installing TMUX" "green"
  sudo eopkg install tmux
fi

echo ""



# -- Slack --------------------------------------------------------------------
if exists "slack"; then
  echo_item "Slack is already installed" "green"
else
  echo_item "Installing Slack" "green"
  sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/im/slack-desktop/pspec.xml
  sudo eopkg it slack-desktop*.eopkg;sudo rm slack-desktop*.eopkg
fi

echo ""


# -- Google Chrome --------------------------------------------------------------------
if exists "google-chrome-stable"; then
  echo_item "Google chrome is already installed" "green"
else
  echo_item "Installing Google Chrome" "green"
  sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml
  sudo eopkg it google-chrome-*.eopkg;sudo rm google-chrome-*.eopkg
fi

echo ""



# -- Docker --------------------------------------------------------------------
if exists "docker"; then
  echo_item "Docker is already installed" "green"
else
  echo_item "Installing Docker" "green"
  sudo eopkg install docker
  sudo usermod -aG docker $USER
fi

echo ""



# -- Docker Compose --------------------------------------------------------------------
if exists "docker-compose"; then
  echo_item "Docker-compose is already installed" "green"
else
  echo_item "Installing docker-compose" "green"
  sudo eopkg install docker-compose
  sudo usermod -aG docker-compose $USER
fi

echo ""



# -- Make --------------------------------------------------------------------
if exists "make"; then
  echo_item "Make is already installed" "green"
else
  echo_item "Installing make" "green"
  sudo eopkg install make
fi

echo ""



# -- System dev tools --------------------------------------------------------------------
if exists "g++"; then
  echo_item "System develop tools already installed" "green"
else
  echo_item "Installing system development tools" "green"
  sudo eopkg it -c system.devel
fi

echo ""



# -- Python --------------------------------------------------------------------
if exists "virtualenv"; then
  echo_item "Virtualenv already installed" "green"
else
  echo_item "Installing virtualenv" "green"
  sudo eopkg install virtualenv
fi

echo ""



# -- Pipenv --------------------------------------------------------------------
if exists "pipenv"; then
  echo_item "Pipenv already installed" "green"
else
  echo_item "Installing pipenv" "green"
  sudo eopkg install pipenv
fi

echo ""
