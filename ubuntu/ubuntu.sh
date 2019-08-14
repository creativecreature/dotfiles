#!/bin/bash

echo_header "Ubuntu Configuration"



# -- Update repo ----------------------------------------------------------------
echo_item "Updating repo" "green"
sudo apt-get update
echo ""



# -- Tools ----------------------------------------------------------------
echo_item "Installing some software needed for installing from source"
sudo apt-get -y install wget tar libevent-dev libncurses-dev make
echo ""



# -- Git -----------------------------------------------------------------------

if exists "git"; then
  echo_item "Git is already installed" "green"
else
  sudo apt-get install git
fi

echo ""



# -- Curl  -----------------------------------------------------------------------

if exists "curl"; then
  echo_item "curl is already installed" "green"
else
  sudo apt-get install curl
fi

echo ""



# -- zsh -----------------------------------------------------------------------

if exists "zsh"; then
  echo_item "zsh is already installed" green
else
  if get_boolean_response "Do you want to install zsh?"; then
    sudo apt-get install zsh
  else
    echo_item "Skipping zsh install" red
  fi
fi

echo ""



# -- nvm -----------------------------------------------------------------------

if exists "node"; then
  echo_item "Node tools are already installed" green
else
  if get_boolean_response "Do you want to install Node.js tools?"; then
    mkdir ~/.nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm install 12.2.0
    npm install -g yarn
    npm install -g eslint eslint-plugin-react babel-eslint
  else
    echo_item "Skipping Node.js tools install" red
  fi
fi

echo ""



# -- Neovim --------------------------------------------------------------------

if exists "nvim"; then
  echo_item "Neovim is already installed" "green"
else
  echo_item "Installing Neovim" "green"
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv ./nvim.appimage /usr/bin/nvim
fi

echo ""



# -- Ctags --------------------------------------------------------------------

if exists "ctags"; then
  echo_item "Ctags is already installed" "green"
else
  sudo apt-get install ctags
fi

echo ""


# -- Ripgrep --------------------------------------------------------------------

if exists "rg"; then
  echo_item "Ripgrep is already installed" "green"
else
  sudo add-apt-repository ppa:x4121/ripgrep
  sudo apt-get update
  sudo apt-get install ripgrep
fi

echo ""



# -- jq --------------------------------------------------------------------

if exists "jq"; then
  echo_item "jq is already installed" "green"
else
  sudo apt-get install jq
fi

echo ""

# -- Tmux --------------------------------------------------------------------

if exists "tmux"; then
  echo_item "Tmux is already installed" "green"
else
  TMUX_VERSION=2.9a
  mkdir $HOME/tmp/tmux
  cd $HOME/tmp/tmux
  wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
  tar xf tmux-${TMUX_VERSION}.tar.gz
  rm -f tmux-${TMUX_VERSION}.tar.gz
  cd tmux-${TMUX_VERSION}
  ./configure && make
  sudo make install
  cd $HOME/dotfiles
  rm -rf $home/tmp/tmux
fi

echo ""



# -- Plank --------------------------------------------------------------------

if exists "plank"; then
  echo_item "Plank is already installed" "green"
else
  sudo apt-get install plank
fi

echo ""



# -- Docker --------------------------------------------------------------------

if exists "docker"; then
  echo_item "Docker is already installed" "green"
else
  sudo apt-get install docker
  sudo usermod -aG docker $USER
fi

echo ""



# -- Docker Compose --------------------------------------------------------------------

if exists "docker-compose"; then
  echo_item "Docker-compose is already installed" "green"
else
  sudo apt-get install docker-compose
  sudo usermod -aG docker-compose $USER
fi

echo ""



# -- Python --------------------------------------------------------------------
if exists "virtualenv"; then
  echo_item "Virtualenv already installed" "green"
else
  echo_item "Installing virtualenv" "green"
  sudo apt-get install virtualenv
fi

echo ""



# -- Pipenv --------------------------------------------------------------------
if exists "pipenv"; then
  echo_item "Pipenv already installed" "green"
else
  echo_item "Installing pipenv" "green"
  sudo apt-get install pipenv
fi

echo ""



# -- Powerline Fonts -------------------------------------------------------------
if [[ -n $(find $HOME/.local/share/fonts -type f -name '*Powerline*') ]]; then
  echo_item "Powerline fonts are already installed" "green"
else
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd -
  rm -rf fonts
fi

echo ""
