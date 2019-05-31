#!/bin/bash
# ubuntu.sh


# -- Hardware settings -----------------------------------------------------------------------

#Add US and SE input sources
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'se')]"
sudo apt-get update
sudo apt-get install fonts-powerline


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
  echo_item "Neovim is already installed" green
else
  if get_boolean_response "Do you want to install Neovim?"; then
    sudo apt-get install neovim
    curl -fLo $HOME/dotfiles/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    echo_item "Skipping Neovim install" red
  fi
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

if exists "ripgrep"; then
  echo_item "Ripgrep is already installed" "green"
else
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
  sudo apt-get install tmux
fi

echo ""



# -- Nordic GTK --------------------------------------------------------------------

sudo rm -rf /usr/share/themes/Nordic
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic
gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic"

echo ""



# -- Zafiro Icons --------------------------------------------------------------------

sudo rm -rf /usr/share/icons/Zafiro
sudo git clone https://github.com/zayronxio/Zafiro-icons.git /usr/share/icons/Zafiro
gsettings set org.gnome.desktop.interface icon-theme 'Zafiro'

echo ""



# -- Plank --------------------------------------------------------------------

if exists "plank"; then
  echo_item "Plank is already installed" "green"
else
  sudo apt-get install plank
fi



# -- Tilix --------------------------------------------------------------------

if exists "tilix"; then
  echo_item "Tilix is already installed" "green"
else
  sudo apt-get install tilix
  git clone --depth=1 https://github.com/arcticicestudio/nord-tilix.git ./tmp/nord
  sudo mv ./tmp/nord/src/json/nord.json /usr/share/tilix/schemes/nord.json
  rm -rf ./tmp
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



# -- Make --------------------------------------------------------------------

if exists "make"; then
  echo_item "Make is already installed" "green"
else
  sudo apt-get install make
fi

echo ""
