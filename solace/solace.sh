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
    npm install yarn -g
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
    curl -fLo $($HOME)/dotfiles/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

