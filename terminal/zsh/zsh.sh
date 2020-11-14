#!/bin/bash

install_zsh() {
  if exists "zsh"; then
    echo_item "zsh is already installed" "green"
  else
    echo_item "installing zsh" "green"
    sudo apt-get -qq --yes install zsh
    echo_item "setting zsh as the default shell" "green"
    sudo usermod -s /usr/bin/zsh $(whoami)
  fi

  if [[ -d ~/.oh-my-zsh ]]; then
    echo_item "oh my zsh is already installed" "green"
  else
    echo_item "installing oh my zsh" " green"
    curl --silent -L http://install.ohmyz.sh | sh
  fi

  if [[ $(dpkg -l | grep 'zsh-syntax-highlighting' >/dev/null)  ]]; then
    echo_item "zsh-syntax-highlighting is already installed" "green"
  else
    echo_item "installing zsh-syntax-highlighting" "green"
    sudo apt-get -qq --yes install zsh-syntax-highlighting
  fi

  if [[ $(dpkg -l | grep 'zsh-autosuggestions' >/dev/null)  ]]; then
    echo_item "zsh-autosuggestions is already installed" "green"
  else
    echo_item "installing zsh-autosuggestions" "green"
    sudo apt-get -qq --yes install zsh-autosuggestions
  fi
}

configure_zsh() {
  echo_item "Symlinking zprofile" "green"
  ln -sf ~/dotfiles/terminal/zsh/zprofile ~/.zprofile

  echo_item "Symlinking zshrc" "green"
  ln -sf ~/dotfiles/terminal/zsh/zshrc ~/.zshrc
}
