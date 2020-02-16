#!/bin/bash

echo_header "OSX Configuration"



# -- Upgrade & Update Homebrew ------------------------------------------------
brew upgrade
brew update



# -- Curl  --------------------------------------------------------------------
if exists "curl"; then
  echo_item "curl is already installed" "green"
else
  brew install curl
fi

echo ""



# -- Zsh -----------------------------------------------------------------------
if exists "zsh"; then
  echo_item "zsh is already installed" green
else
  echo_item "Installing zsh" "green"
   brew install zsh
fi

echo ""



# -- Nvm -----------------------------------------------------------------------
source 'nvm/nvm.sh'



# -- Neovim --------------------------------------------------------------------
source 'nvim/nvim.sh'



# -- Ripgrep -------------------------------------------------------------------
if exists "rg"; then
  echo_item "Ripgrep is already installed" "green"
else
  echo_item "Installing ripgrep" "green"
  brew install ripgrep
fi

echo ""



# -- Jq ------------------------------------------------------------------------
if exists "jq"; then
  echo_item "jq is already installed" "green"
else
  echo_item "Installing jq" "green"
  brew install jq
fi

echo ""



# -- Tmux ----------------------------------------------------------------------
source 'tmux/tmux.sh'



# -- Docker --------------------------------------------------------------------
if exists "docker"; then
  echo_item "Docker is already installed" "green"
else
  echo_item "Installing Docker" "green"
  brew cask install docker
  brew install bash-completion
  brew install docker-completion
  brew install docker-compose-completion
fi

echo ""



# -- Python stuff -------------------------------------------------------------
if exists "virtualenv"; then
  echo_item "Virtualenv already installed" "green"
else
  echo_item "Installing python tools" "green"
  brew install python
  brew install pipenv
  pip install virtualenv
fi

echo ""



# -- Powerline Fonts -----------------------------------------------------------
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd -
rm -rf fonts

echo ""
