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
    fi
    git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting > /dev/null
    git clone --quiet  https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions > /dev/null
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
