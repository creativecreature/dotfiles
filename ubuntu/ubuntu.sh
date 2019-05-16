#!/bin/bash
# ubuntu.sh



# -- Git -----------------------------------------------------------------------

if exists "git"; then
  echo_item "Git is already installed" "green"
else
  sudo apt-get install git
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



# -- fzf -----------------------------------------------------------------------
if exists "fzf"; then
  echo_item "fzf is already installed" green
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  # TODO: Change vim to use Plug '~/.fzf' instead of Plug '/usr/local/opt/fzf'
fi

echo ""



# -- ripgrep ----------------------------------------------------------------------
if exists "rg"; then
  echo_item "ripgrep is already installed" green
else
  sudo apt-get install ripgrep
fi

echo ""



# -- htop ----------------------------------------------------------------------

if exists "htop"; then
  echo_item "htop is already installed" green
else
  if get_boolean_response "Do you want to install htop?"; then
    sudo apt-get install htop
  else
    echo_item "Skipping htop install" red
  fi
fi

echo ""



# -- Neovim --------------------------------------------------------------------

if exists "nvim"; then
  echo_item "Neovim is already installed" green
else
  if get_boolean_response "Do you want to install Neovim?"; then
    sudo apt-get --yes --force-yes install software-properties-common
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get --yes --force-yes install neovim python-dev python-pip python3-dev python3-pip
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  else
    echo_item "Skipping Neovim install" red
  fi
fi

echo ""



# -- Plank --------------------------------------------------------------------

if exists "plank"; then
  echo_item "Plank already installed" green
else
  sudo add-apt-repository ppa:ricotz/docky
  sudo apt-get update
  sudo apt-get install plank --yes --force-yes
fi

echo ""



# -- Plank --------------------------------------------------------------------

if exists "flat-remix"; then
  echo_item "Flat remix icons already installed"
else
  sudo add-apt-repository ppa:daniruiz/flat-remix
  sudo apt-get update
  sudo apt-get install flat-remix
fi
