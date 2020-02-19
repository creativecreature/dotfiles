#!/bin/bash


ZSHRC=~/.zshrc
OH_MY_ZSH=~/.oh-my-zsh

echo_header "ZSH Configuration"

if exists "zsh"; then
  if [[ -d  "$OH_MY_ZSH" ]]; then
    echo_item "Oh my zsh is already installed" "green"
  else
    if exists "curl"; then
      curl -L http://install.ohmyz.sh | sh
    elif exists "wget"; then
      wget --no-check-certificate http://install.ohmyz.sh -O - | sh
    else
      echo_item "You need either curl or wget installed to download Oh my zsh" "red"
    fi
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  fi
else
  echo_item "Zsh is not installed" "red"
fi

if [[ "$SHELL" == "$(which zsh)"  ]]; then
  echo_item "Your default shell is already set to zsh" "green"
else
  echo_item "Setting zsh to be your default shell" "green"
  chsh -s $(which zsh)
fi

echo_item "Symlinking zprofile" "green"
ln -sf ~/dotfiles/zsh/zprofile ~/.zprofile

echo_item "Symlinking zshrc" "green"
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

echo ""
