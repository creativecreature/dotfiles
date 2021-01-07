#!/bin/bash

install_nvim() {
  if exists "nvim"; then
    echo_item "neovim is already installed" "green"
  else
    echo_item "installing neovim" "green"
    sudo apt-get -qq --yes install neovim
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
}

configure_nvim() {
  echo_item "symlinking nvim configuration" "green"
  rm -rf ~/.config/nvim
  ln -sfn ~/dotfiles/editors/nvim ~/.config/nvim

  echo_item "installing nvim plugins" "green"
  nvim "+PlugInstall" +qall

  echo_item "updating nvim plugins" "green"
  nvim "+PlugUpdate" +qall

  echo_item "installing coc sources" "green"
  nvim "+CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-emoji coc-python coc-rls" +qall
}
