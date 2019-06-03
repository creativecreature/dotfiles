#!/bin/bash
# solace.sh


# -- Hardware settings -----------------------------------------------------------------------

#Add US and SE input sources
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'se')]"



# -- Git -----------------------------------------------------------------------

if exists "git"; then
  echo_item "Git is already installed" "green"
else
  sudo eopkg install git
fi

echo ""



# -- zsh -----------------------------------------------------------------------

if exists "zsh"; then
  echo_item "zsh is already installed" green
else
  if get_boolean_response "Do you want to install zsh?"; then
    sudo eopkg install zsh
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
    sudo eopkg install neovim
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
  sudo eopkg install ctags
fi

echo ""


# -- Ripgrep --------------------------------------------------------------------

if exists "ripgrep"; then
  echo_item "Ripgrep is already installed" "green"
else
  sudo eopkg install ripgrep
fi

echo ""



# -- jq --------------------------------------------------------------------

if exists "jq"; then
  echo_item "jq is already installed" "green"
else
  sudo eopkg install jq
fi

echo ""

# -- Tmux --------------------------------------------------------------------

if exists "tmux"; then
  echo_item "Tmux is already installed" "green"
else
  sudo eopkg install tmux
fi

echo ""



# -- Nordic GTK --------------------------------------------------------------------

#sudo rm -rf /usr/share/themes/Nordic
#sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic
#gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
#gsettings set org.gnome.desktop.wm.preferences theme "Nordic"

echo ""



# -- Zafiro Icons --------------------------------------------------------------------

sudo rm -rf /usr/share/icons/Zafiro
sudo git clone https://github.com/zayronxio/Zafiro-icons.git /usr/share/icons/Zafiro
gsettings set org.gnome.desktop.interface icon-theme 'Zafiro'

echo ""



# -- Tilix --------------------------------------------------------------------

if exists "tilix"; then
  echo_item "Tilix is already installed" "green"
else
  sudo eopkg install tilix
  curl -fLo ~/.config/tilix/schemes/nord.json --create-dirs https://raw.githubusercontent.com/arcticicestudio/nord-tilix/develop/src/json/nord.json

fi

echo ""



# -- Slack --------------------------------------------------------------------

if exists "slack"; then
  echo_item "Slack is already installed" "green"
else
  sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/im/slack-desktop/pspec.xml
  sudo eopkg it slack-desktop*.eopkg;sudo rm slack-desktop*.eopkg
  # Todo use this: https://raw.githubusercontent.com/arcticicestudio/nord-tilix/develop/src/json/nord.json
fi

echo ""


# -- Google Chrome --------------------------------------------------------------------

if exists "google-chrome-stable"; then
  echo_item "Google chrome is already installed" "green"
else
  sudo eopkg bi --ignore-safety https://raw.githubusercontent.com/getsolus/3rd-party/master/network/web/browser/google-chrome-stable/pspec.xml
sudo eopkg it google-chrome-*.eopkg;sudo rm google-chrome-*.eopkg
fi

echo ""



# -- Docker --------------------------------------------------------------------

if exists "docker"; then
  echo_item "Docker is already installed" "green"
else
  sudo eopkg install docker
  sudo usermod -aG docker $USER
fi

echo ""



# -- Docker Compose --------------------------------------------------------------------

if exists "docker-compose"; then
  echo_item "Docker-compose is already installed" "green"
else
  sudo eopkg install docker-compose
  sudo usermod -aG docker-compose $USER
fi

echo ""



# -- Make --------------------------------------------------------------------

if exists "make"; then
  echo_item "Make is already installed" "green"
else
  sudo eopkg install make
fi

echo ""



# -- System dev tools --------------------------------------------------------------------

if exists "g++"; then
  echo_item "System develop tools already installed" "green"
else
  sudo eopkg it -c system.devel
fi

echo ""
