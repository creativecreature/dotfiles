#!/bin/bash

install_zsh() {
  if [[ -d ~/.oh-my-zsh ]]; then
    echo_item "oh my zsh is already installed" "green"
  else
    echo_item "installing oh my zsh" " green"
    curl --silent -L http://install.ohmyz.sh | sh
  fi

  if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
    echo_item "zsh-autosuggestions are already installed" "green"
  else
    echo_item "installing zsh-autosuggestions" "green"
		git clone --quiet https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  fi

  if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
    echo_item "zsh-syntax-highlighting is already installed" "green"
  else
    echo_item "installing zsh-syntax-highlighting" "green"
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  fi
}

configure_zsh() {
  echo_item "Symlinking zprofile" "green"
  ln -sf ~/dotfiles/terminal/zsh/zprofile ~/.zprofile

  echo_item "Symlinking zshrc" "green"
  ln -sf ~/dotfiles/terminal/zsh/zshrc ~/.zshrc
}
