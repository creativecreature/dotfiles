#!/bin/bash
# solace.sh

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

if exists "nvm"; then
  echo_item "Node tools are already installed" green
else
  if get_boolean_response "Do you want to install Node.js tools?"; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    source ./.bashrc
    source ./zshrc
    nvm install 12.2.0
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
