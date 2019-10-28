#!/bin/bash

echo_header "Ubuntu Configuration"
sudo apt-get update



# -- Tools ----------------------------------------------------------------
echo_item "Installing some software needed for installing from source"
sudo apt-get -y install wget tar libevent-dev libncurses-dev make
echo ""



# -- Curl  -----------------------------------------------------------------------

if exists "curl"; then
  echo_item "curl is already installed" "green"
else
  sudo apt-get -y install curl
fi

echo ""



# -- zsh -----------------------------------------------------------------------

if exists "zsh"; then
  echo_item "zsh is already installed" green
else
  echo_item "Installing zsh" "green"
  sudo apt-get -y install zsh
fi

echo ""



# -- nvm -----------------------------------------------------------------------

if exists "node"; then
  echo_item "Node tools are already installed" green
else
  if get_boolean_response "Do you want to install Node.js tools?"; then
    mkdir ~/.nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm install 12.2.0
    npm install -g eslint@5.16 eslint-config-prettier@6.0.0 eslint-config-standard@12.0.0 eslint-plugin-import@2.18.0 eslint-plugin-jest@22.7.2 eslint-plugin-node@9 eslint-plugin-promise@4.2.1 eslint-plugin-standard@4.0.0 eslint-plugin-react babel-eslint yarn neovim
  else
    echo_item "Skipping Node.js tools install" red
  fi
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
  sudo apt-get -y install ctags
fi

echo ""


# -- Ripgrep --------------------------------------------------------------------

if exists "rg"; then
  echo_item "Ripgrep is already installed" "green"
else
  sudo add-apt-repository ppa:x4121/ripgrep
  sudo apt-get update
  sudo apt-get -y install ripgrep
fi

echo ""



# -- jq --------------------------------------------------------------------

if exists "jq"; then
  echo_item "jq is already installed" "green"
else
  sudo apt-get -y install jq
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
  sudo apt-get -y install virtualenv
fi

echo ""



# -- Pipenv --------------------------------------------------------------------
if exists "pipenv"; then
  echo_item "Pipenv already installed" "green"
else
  echo_item "Installing pipenv" "green"
  sudo apt install -y python3-pip
  pip3 install pipenv
fi

echo ""



# -- Powerline Fonts -------------------------------------------------------------
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



# -- Gnome Tweaks ---------------------------------------------------------------
if exists "gnome-tweaks"; then
  echo_item "Gnome tweaks is already installed" "green"
else
  sudo apt-get install -y gnome-tweaks
fi

echo ""



# -- Xclip -----------------------------------------------------------------------
if exists "xclip"; then
  echo_item "Xclip is already installed" "green"
else
  sudo apt-get install -y xclip
fi

echo ""



# -- Caffeine --------------------------------------------------------------------
if exists "caffeine"; then
  echo_item "Caffeine is already installed" "green"
else
  sudo apt-get install -y caffeine
fi

echo ""



# -- Uninstall Unwanted Software -------------------------------------------------
echo_header "Removing unwanted software"



# -- Uninstall Thunderbird -------------------------------------------------------
if exists "thunderbird"; then
  echo_item "Uninstalling thunderbird" "green"
  sudo apt-get -y remove thunderbird
else
  echo_item "Thunderbird is already uninstalled" "green"
fi

echo ""



# -- Uninstall Rhythmbox -------------------------------------------------------
if exists "rhythmbox"; then
  echo_item "Uninstalling Rhythmbox" "green"
  sudo apt-get -y remove rhythmbox
else
  echo_item "Rhythmbox is already uninstalled" "green"
fi

echo ""



# -- Uninstall Mahjongg -------------------------------------------------------
if exists "gnome-mahjongg"; then
  echo_item "Uninstalling Mahjongg" "green"
  sudo apt-get -y remove gnome-mahjongg
else
  echo_item "Mahjongg is already uninstalled" "green"
fi

echo ""



# -- Uninstall Mines -------------------------------------------------------
if exists "gnome-mines"; then
  echo_item "Uninstalling Mines" "green"
  sudo apt-get -y remove gnome-mines
else
  echo_item "Mines is already uninstalled" "green"
fi

echo ""



# -- Scrolling --------------------------------------------------------------
echo_item "Turning off natural-scroll for the touchpad" "green"
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

echo ""



# -- Dock --------------------------------------------------------------------
echo_item "Executing dock configurations"
source './dock/dock.sh'

echo ""



# -- Exfat support -----------------------------------------------------------
if [[ -f $HOME/.config/dotfile-installs/exfat ]]; then
  echo_item "Exfat support is already installed" "green"
else
  echo_item "Installing exfat support" "green"
  sudo apt install exfat-fuse exfat-utils
  sudo add-apt-repository universe
  touch $HOME/.config/dotfile-installs/exfat
fi

echo ""



# -- VLC -------------------------------------------------------------------
if exists "vlc"; then
  echo_item "VLC is already installed" "green"
else
  echo_item "Installing VLC" "green"
  sudo apt-get install vlc
fi



# -- Enpass -----------------------------------------------------------------
if exists "enpass"; then
  echo_item "Enpass is already installed" "green"
else
  sudo sh -c 'echo "deb http://repo.sinew.in/ stable main" > /etc/apt/sources.list.d/enpass.list'
  wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
  sudo apt update
  sudo apt install enpass -y
  touch $HOME/.config/dotfile-installs/enpass
fi



# -- Slack ------------------------------------------------------------------
if exists "slack"; then
  echo_item "Slack is already installed" "green"
else
  echo_item "Installing Slack" "green"
  sudo snap install slack --classic
fi

echo ""



# -- Firefox ----------------------------------------------------------------
if exists "firefox"; then
  echo_item "Firefox is already installed" "green"
else
  echo_item "Installing Firefox" "green"
  sudo apt-get install -y firefox
fi

echo ""



# -- Blueman ----------------------------------------------------------------
if exists "blueman-manager"; then
  echo_item "Blueman is already installed" "green"
else
  echo_item "Installing Blueman" "green"
  sudo apt-get install -y blueman
  sudo apt-get install -y pulseaudio-module-bluetooth
fi

echo ""



# -- VPN -------------------------------------------------------------------
source './vpn/vpn.sh'



# -- Datagrip -----------------------------------------------------------------
if exists "datagrip"; then
  echo_item "Datagrip is already installed" "green"
else
  echo_item "Installing datagrip" "green"
  sudo snap install datagrip --classic
fi



# -- Insomnia -----------------------------------------------------------------
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



# -- Heroku -------------------------------------------------------------------
if exists "heroku"; then
  echo_item "Heroku is already installed" "green"
else
  echo_item "Installing Heroku"
  sudo snap install --classic heroku
fi



# -- Gestures -------------------------------------------------------------------
source './gestures/gestures.sh'



# -- Bin -------------------------------------------------------------------
for filepath in $HOME/dotfiles/bin/*; do
  [ -e "$filepath" ] || continue
  filename=${filepath##*/}
  ln -sf $filepath $HOME/bin/$filename
done



# -- Startup Scripts -------------------------------------------------------------------
source './startup/startup.sh'
