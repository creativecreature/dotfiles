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



# -- Neovim --------------------------------------------------------------------

if exists "nvim"; then
  echo_item "Neovim is already installed" green
else
  if get_boolean_response "Do you want to install Neovim?"; then
    sudo eopkg install neovim
  else
    echo_item "Skipping Neovim install" red
  fi
fi

echo ""
