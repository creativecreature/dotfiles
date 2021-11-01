#!/bin/bash

install_nvim() {
  if exists "nvim"; then
    echo_item "neovim is already installed" "green"
  else
    echo_item "installing neovim" "green"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
    sudo mv nvim.appimage /usr/bin/nvim
  fi
}

configure_nvim() {
  echo_item "symlinking nvim configuration" "green"
  rm -rf ~/.config/nvim
  ln -sfn ~/dotfiles/editors/nvim ~/.config/nvim

  echo_item "installing nvim plugins" "green"
  nvim "+PackerInstall" +qall

  echo_item "updating nvim plugins" "green"
  nvim "+PlugUpdate" +qall
}

install_lua_language_server() {
  LANGUAGE_SERVER_DIR=~/lua-language-server
  if [[ ! -d "$LANGUAGE_SERVER_DIR" ]]; then
    echo_item "installing lua language server" "green"
    sudo apt install ninja-build build-essential libreadline-dev
    cd
    git clone https://github.com/sumneko/lua-language-server
    cd lua-language-server
    git submodule update --init --recursive
    cd 3rd/luamake
    ./compile/install.sh
    cd ../..
    ./3rd/luamake/luamake rebuild
    cd
    # Install lua and luarocks
    curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
    tar -zxf lua-5.3.5.tar.gz
    rm lua-5.3.5.tar.gz
    cd lua-5.3.5
    make linux test
    sudo make install
    cd -
    rm -rf lua-5.3.5
    wget https://luarocks.org/releases/luarocks-3.3.1.tar.gz
    tar zxpf luarocks-3.3.1.tar.gz
    rm luarocks-3.3.1.tar.gz
    cd luarocks-3.3.1
    ./configure --with-lua-include=/usr/local/include
    make
    sudo make install
    cd
    rm -rf luarocks-3.3.1
    sudo luarocks install --server=https://luarocks.org/dev luaformatter
    go install github.com/mattn/efm-langserver@latest
    cd ~/dotfiles
  else
    echo_item "lua language server is already installed" "green"
  fi
}
