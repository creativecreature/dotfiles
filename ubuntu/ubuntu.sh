#!/bin/bash

echo_header "Ubuntu Configuration"
sudo apt-get update



# -- Tools ----------------------------------------------------------------
echo_item "Installing some software needed for installing from source"
sudo apt-get install wget tar libevent-dev libncurses-dev make
echo ""



# -- Curl  -----------------------------------------------------------------------

if exists "curl"; then
  echo_item "curl is already installed" "green"
else
  sudo apt-get install curl
fi

echo ""



# -- zsh -----------------------------------------------------------------------

if exists "zsh"; then
  echo_item "zsh is already installed" green
else
  echo_item "Installing zsh" "green"
  sudo apt-get install zsh
fi

echo ""



# -- nvm -----------------------------------------------------------------------

if exists "node"; then
  echo_item "Node tools are already installed" green
else
  mkdir ~/.nvm
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm install 12.2.0
  npm install -g eslint@5.16 eslint-config-prettier@6.0.0 eslint-config-standard@12.0.0 eslint-plugin-import@2.18.0 eslint-plugin-jest@22.7.2 eslint-plugin-node@9 eslint-plugin-promise@4.2.1 eslint-plugin-standard@4.0.0 eslint-plugin-react babel-eslint yarn neovim
fi

echo ""



# -- Neovim --------------------------------------------------------------------

if exists "nvim"; then
  echo_item "Neovim is already installed" "green"
else
  echo_item "Installing Neovim" "green"
  curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x nvim.appimage
  sudo mv ./nvim.appimage /usr/bin/nvim
fi

echo ""



# -- Ctags --------------------------------------------------------------------

if exists "ctags"; then
  echo_item "Ctags is already installed" "green"
else
  sudo apt-get install ctags
fi

echo ""


# -- Ripgrep --------------------------------------------------------------------

if exists "rg"; then
  echo_item "Ripgrep is already installed" "green"
else
  sudo add-apt-repository ppa:x4121/ripgrep
  sudo apt-get update
  sudo apt-get install ripgrep
fi

echo ""



# -- jq --------------------------------------------------------------------

if exists "jq"; then
  echo_item "jq is already installed" "green"
else
  sudo apt-get install jq
fi

echo ""

# -- Tmux --------------------------------------------------------------------

if exists "tmux"; then
  echo_item "Tmux is already installed" "green"
else
  TMUX_VERSION=2.9a
  mkdir $HOME/tmp/tmux
  cd $HOME/tmp/tmux
  wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
  tar xf tmux-${TMUX_VERSION}.tar.gz
  rm -f tmux-${TMUX_VERSION}.tar.gz
  cd tmux-${TMUX_VERSION}
  ./configure && make
  sudo make install
  cd $HOME/code/conner/dotfiles
  rm -rf $HOME/tmp/tmux
fi

echo ""



# -- Docker --------------------------------------------------------------------
source "./docker/docker.sh"



# -- Python --------------------------------------------------------------------
if exists "virtualenv"; then
  echo_item "Virtualenv already installed" "green"
else
  echo_item "Installing virtualenv" "green"
  sudo apt-get install virtualenv
fi

echo ""



# -- Pipenv --------------------------------------------------------------------
if exists "pipenv"; then
  echo_item "Pipenv already installed" "green"
else
  echo_item "Installing pipenv" "green"
  sudo apt install python3-pip
  pip3 install pipenv
fi

echo ""



# -- Powerline Fonts -------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if [[ -n $(find $HOME/.local/share/fonts -type f -name '*Powerline*') ]]; then
    echo_item "Powerline fonts are already installed" "green"
  else
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd -
    rm -rf fonts
  fi

  echo ""
fi



# -- Gnome Tweaks ---------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "gnome-tweaks"; then
    echo_item "Gnome tweaks is already installed" "green"
  else
    sudo apt-get install gnome-tweaks
    sudo apt install gnome-shell-extension-autohidetopbar
  fi

  echo ""
fi



# -- Xclip -----------------------------------------------------------------------
if exists "xclip"; then
  echo_item "Xclip is already installed" "green"
else
  sudo apt-get install xclip
fi

echo ""



# -- Caffeine --------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "caffeine"; then
    echo_item "Caffeine is already installed" "green"
  else
    sudo apt-get install caffeine
  fi

  echo ""
fi



# -- Uninstall Unwanted Software -------------------------------------------------
echo_header "Removing unwanted software"



# -- Uninstall Thunderbird -------------------------------------------------------
if exists "thunderbird"; then
  echo_item "Uninstalling thunderbird" "green"
  sudo apt-get remove thunderbird
else
  echo_item "Thunderbird is already uninstalled" "green"
fi

echo ""



# -- Uninstall Rhythmbox -------------------------------------------------------
if exists "rhythmbox"; then
  echo_item "Uninstalling Rhythmbox" "green"
  sudo apt-get remove rhythmbox
else
  echo_item "Rhythmbox is already uninstalled" "green"
fi

echo ""



# -- Uninstall Mahjongg -------------------------------------------------------
if exists "gnome-mahjongg"; then
  echo_item "Uninstalling Mahjongg" "green"
  sudo apt-get remove gnome-mahjongg
else
  echo_item "Mahjongg is already uninstalled" "green"
fi

echo ""



# -- Uninstall Mines -------------------------------------------------------
if exists "gnome-mines"; then
  echo_item "Uninstalling Mines" "green"
  sudo apt-get remove gnome-mines
else
  echo_item "Mines is already uninstalled" "green"
fi

echo ""



# -- Scrolling --------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  echo_item "Turning off natural-scroll for the touchpad" "green"
  gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

  echo ""
fi



# -- Dock --------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  echo_item "Executing dock configurations"
  source './dock/dock.sh'

  echo ""
fi



# -- Exfat support -----------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if [[ -f $HOME/.config/dotfile-installs/exfat ]]; then
    echo_item "Exfat support is already installed" "green"
  else
    echo_item "Installing exfat support" "green"
    sudo apt install exfat-fuse exfat-utils
    sudo add-apt-repository universe
    touch $HOME/.config/dotfile-installs/exfat
  fi

  echo ""
fi



# -- VLC -------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "vlc"; then
    echo_item "VLC is already installed" "green"
  else
    echo_item "Installing VLC" "green"
    sudo apt-get install vlc
  fi
fi



# -- Enpass -----------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "enpass"; then
    echo_item "Enpass is already installed" "green"
  else
    sudo sh -c 'echo "deb http://repo.sinew.in/ stable main" > /etc/apt/sources.list.d/enpass.list'
    wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
    sudo apt update
    sudo apt install enpass -y
    touch $HOME/.config/dotfile-installs/enpass
  fi
fi



# -- Slack ------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "slack"; then
    echo_item "Slack is already installed" "green"
  else
    echo_item "Installing Slack" "green"
    sudo snap install slack --classic
  fi

  echo ""
fi



# -- Firefox ----------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "firefox"; then
    echo_item "Firefox is already installed" "green"
  else
    echo_item "Installing Firefox" "green"
    sudo apt-get install firefox
  fi

  echo ""
fi



# -- Blueman ----------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "blueman-manager"; then
    echo_item "Blueman is already installed" "green"
  else
    echo_item "Installing Blueman" "green"
    sudo apt-get install blueman
    sudo apt-get install pulseaudio-module-bluetooth
  fi

  echo ""
fi



# -- VPN -------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  source './vpn/vpn.sh'
fi



# -- Datagrip -----------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "datagrip"; then
    echo_item "Datagrip is already installed" "green"
  else
    echo_item "Installing datagrip" "green"
    sudo snap install datagrip --classic
  fi
fi



# -- Insomnia -----------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "insomnia"; then
    echo_item "Insomnia is already installed" "green"
  else
    echo_item "Installing Insomnia" "green"
    echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
      | sudo tee -a /etc/apt/sources.list.d/insomnia.list
          wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
            | sudo apt-key add -
                      sudo apt-get update
                      sudo apt-get install insomnia
  fi
fi



# -- Heroku -------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  if exists "heroku"; then
    echo_item "Heroku is already installed" "green"
  else
    echo_item "Installing Heroku"
    sudo snap install --classic heroku
  fi
fi



# -- Gestures -------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  source './gestures/gestures.sh'
fi



# -- Bin -------------------------------------------------------------------
for filepath in $HOME/dotfiles/bin/*; do
  [ -e "$filepath" ] || continue
  filename=${filepath##*/}
  ln -sf $filepath $HOME/bin/$filename
done



# -- Startup Scripts -------------------------------------------------------------------
if [[ "$HEADLESS" = false ]]; then
  source './startup/startup.sh'
fi
