#!/bin/bash
# Install .dotfiles

# -- Import from other scripts -------------------------------------------------
source 'scripts/helpers.sh'



# -- Setup directory structure -------------------------------------------------
echo_header "Setting up source code directory structure"
CODE_DIR=$HOME/code
VIAPLAY_DIR=$HOME/code/viaplay
CONNER_DIR=$HOME/code/conner

if [[ -d "$CODE_DIR" ]]; then
  echo_item "Code dir already exists" "green"
else
  echo_item "Creating code dir" "green"
  mkdir $HOME/code
fi

if [[ -d "$VIAPLAY_DIR" ]]; then
  echo_item "Viaplay dir already exists" "green"
else
  echo_item "Creating viaplay dir" "green"
  mkdir $HOME/viaplay
fi

if [[ -d "$CONNER_DIR" ]]; then
  echo_item "Conner dir already exists" "green"
else
  echo_item "Creating conner dir" "green"
  mkdir $HOME/conner
fi

echo ""



# -- OSX- or Linux-Specific Setup ----------------------------------------------
if system_is_OSX; then
  source 'osx/osx.sh'
elif system_is_linux; then
  #source 'ubuntu/ubuntu.sh'
  source solus/solus.sh
fi



# -- GIT -----------------------------------------------------------------------
source 'git/configure-git.sh'



# -- ZSH Setup -----------------------------------------------------------------
if exists "zsh"; then
  if get_boolean_response "Do you want to install ZSH configuration files?"; then

    # -- ZSHRC
    ln -sf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
    echo_item "Linked zshrc" "green"

    # -- OH MY ZSH
    if [ -d $HOME/.oh-my-zsh/ ]; then
      echo_item "Oh my ZSH is already installed" "green"
    else
      if exists "curl"; then
        curl -L http://install.ohmyz.sh | sh
      elif exists "wget"; then
        wget --no-check-certificate http://install.ohmyz.sh -O - | sh
      else
        echo_item "You need either curl or wget installed to download Oh My ZSH"
      fi
    fi

  else
    echo_item "Ignoring ZSH configuration" "red"
  fi
else
  echo_item "ZSH is not installed"
fi

echo ""



# -- NVIM -----------------------------------------------------------------------
rm -rf $HOME/.config/nvim
ln -sfn $HOME/dotfiles/nvim $HOME/.config/nvim
echo_item "Linked nvim configuration" "green"

echo ""



# -- TMUX -----------------------------------------------------------------------
ln -sf $HOME/dotfiles/tmux/conf $HOME/.tmux.conf
echo_item "Linked tmux configuration" "green"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo_item "Cloned tmux plugin manager" "green"
ln -sf $HOME/dotfiles/tmux/tat $HOME/bin/tat
echo_item "Linked tat script" "green"

echo ""



# -- ESLINT -----------------------------------------------------------------------
ln -sf $HOME/dotfiles/eslint/eslintrc $HOME/.eslintrc
echo_item "Linked global eslint config" "green"

echo ""



# -- RIPGREP -----------------------------------------------------------------------
ln -sf $HOME/dotfiles/ripgrep/ignore $HOME/.ignore
echo_item "Linked ripgrep ignore file" "green"

echo ""
