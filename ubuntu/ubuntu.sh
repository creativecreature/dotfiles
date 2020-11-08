#!/bin/bash

echo ""
echo_header "Ubuntu Configuration"
sudo apt-get -qq --yes update



# -- Tools ----------------------------------------------------------------
echo_item "Installing some software needed for installing from source" "green"
sudo apt-get -qq --yes install wget tar libevent-dev libncurses-dev make build-essential
echo ""


# -- Keyboard ----------------------------------------------------------------
source "./hardware/keyboard.sh"

# -- Curl  -----------------------------------------------------------------------
if exists "curl"; then
  echo_item "curl is already installed" "green"
else
  sudo apt-get -qq --yes install curl
fi

echo ""



# -- zsh -----------------------------------------------------------------------
if exists "zsh"; then
  echo_item "zsh is already installed" "green"
else
  echo_item "Installing zsh" "green"
  sudo apt-get -qq --yes install zsh
  echo_item "Making zsh the default shell"
  sudo usermod -s /usr/bin/zsh $(whoami)
  curl --silent -L http://install.ohmyz.sh | sh
  git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  git clone --quiet  https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

echo ""



# -- nvm -----------------------------------------------------------------------
source 'nvm/nvm.sh'



# -- tldr ----------------------------------------------------------------------
if exists "tldr"; then
  echo_item "tldr is already installed" "green"
else
  echo_item "Installing tldr" "green"
  sudo apt-get -qq --yes install tldr
fi
echo ""



# -- rust ----------------------------------------------------------------------
source 'rust/rust.sh'



# -- alacritty -----------------------------------------------------------------
source 'alacritty/alacritty.sh'



# -- go ------------------------------------------------------------------------
if exists "go"; then
  echo_item "go is already installed" "green"
else
  echo_item "Installing go" "green"
  cd ~/tmp
  curl --silent https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
  tar xvf go1.14.1.linux-amd64.tar.gz >/dev/null
  sudo mv go /usr/local/bin/
  cd -
fi

echo ""



# -- Terraform -----------------------------------------------------------------
if exists "tfenv"; then
  echo_item "tfenv is already installed" "green"
else
  echo_item "Installing tfenv" "green"
  git clone https://github.com/tfutils/tfenv.git ~/.tfenv
  sudo ln -s ~/.tfenv/bin/* /usr/local/bin
fi

echo ""



# -- Neovim --------------------------------------------------------------------
source 'nvim/nvim.sh'



# -- Ripgrep --------------------------------------------------------------------
if exists "rg"; then
  echo_item "ripgrep is already installed" "green"
else
  echo_item "Installing ripgrep" "green"
  sudo apt-get -qq --yes install ripgrep
fi

echo ""



# -- jq --------------------------------------------------------------------
if exists "jq"; then
  echo_item "jq is already installed" "green"
else
  echo_item "Installing jq" "green"
  sudo apt-get -qq --yes install jq
fi

echo ""



# -- Tmux --------------------------------------------------------------------
source 'tmux/tmux.sh'



# -- Docker --------------------------------------------------------------------
source "./docker/docker.sh"



# -- 1password --------------------------------------------------------------------
# source "./1password/1password.sh"
# Wait for 1password mini on Linux



# -- Python --------------------------------------------------------------------
if exists "virtualenv"; then
  echo_item "Virtualenv already installed" "green"
else
  echo_item "Installing virtualenv" "green"
  sudo apt-get -qq --yes install virtualenv
fi

echo ""



# -- Pipenv --------------------------------------------------------------------
if exists "pipenv"; then
  echo_item "Pipenv already installed" "green"
else
  echo_item "Installing pipenv" "green"
  sudo apt-get -qq --yes install python3-pip
  pip3 install pipenv
fi

echo ""



# -- Powerline Fonts -------------------------------------------------------------
# TODO: this find causes console output, "could not find file..."
if [[ -n $(find ~/.local/share/fonts -type f -name '*Powerline*') ]]; then
  echo_item "Powerline fonts are already installed" "green"
else
  echo_item "Installing powerline fonts" "green"
  git clone --quiet https://github.com/powerline/fonts.git --depth=1 > /dev/null
  cd fonts
  ./install.sh > /dev/null
  cd -
  rm -rf fonts
fi

echo ""



# -- Gnome Tweaks ---------------------------------------------------------------
if exists "gnome-tweaks"; then
  echo_item "Gnome tweaks is already installed" "green"
else
  sudo apt-get -qq --yes install gnome-tweaks
  sudo apt-get -qq --yes install gnome-shell-extension-autohidetopbar
fi

echo ""



# -- Xclip -----------------------------------------------------------------------
if exists "xclip"; then
  echo_item "Xclip is already installed" "green"
else
  sudo apt-get -qq --yes install xclip
fi

echo ""



# -- Caffeine --------------------------------------------------------------------
if exists "caffeine"; then
  echo_item "Caffeine is already installed" "green"
else
  sudo apt-get -qq --yes install caffeine
fi

echo ""



# -- Uninstall Unwanted Software -------------------------------------------------
echo_header "Removing unwanted software"



# -- Uninstall Thunderbird -------------------------------------------------------
if exists "thunderbird"; then
  echo_item "Uninstalling thunderbird" "green"
  sudo apt-get -qq --yes remove thunderbird
else
  echo_item "Thunderbird is already uninstalled" "green"
fi

echo ""



# -- Uninstall Rhythmbox -------------------------------------------------------
if exists "rhythmbox"; then
  echo_item "Uninstalling Rhythmbox" "green"
  sudo apt-get -qq --yes remove rhythmbox
else
  echo_item "Rhythmbox is already uninstalled" "green"
fi

echo ""



# -- Uninstall Mahjongg -------------------------------------------------------
if exists "gnome-mahjongg"; then
  echo_item "Uninstalling Mahjongg" "green"
  sudo apt-get -qq --yes remove gnome-mahjongg
else
  echo_item "Mahjongg is already uninstalled" "green"
fi

echo ""



# -- Uninstall Mines -------------------------------------------------------
if exists "gnome-mines"; then
  echo_item "Uninstalling Mines" "green"
  sudo apt-get -qq --yes remove gnome-mines
else
  echo_item "Mines is already uninstalled" "green"
fi

echo ""



# -- Scrolling --------------------------------------------------------------
echo_item "Turning off natural-scroll for the touchpad" "green"
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

echo ""



# -- Dock --------------------------------------------------------------------
echo_item "Executing dock configurations" "green"
source './dock/dock.sh'

echo ""



# -- Exfat support -----------------------------------------------------------
if [[ -f ~/.config/dotfile-installs/exfat ]]; then
  echo_item "Exfat support is already installed" "green"
else
  echo_item "Installing exfat support" "green"
  sudo apt-get -qq --yes install exfat-fuse exfat-utils
  touch ~/.config/dotfile-installs/exfat
fi

echo ""



# -- VLC -------------------------------------------------------------------
if exists "vlc"; then
  echo_item "VLC is already installed" "green"
else
  echo_item "Installing VLC" "green"
  sudo apt-get -qq --yes install vlc
fi

echo ""



# -- Enpass -----------------------------------------------------------------
ENPASS_FILE=/usr/share/applications/enpass.desktop
if [[ -f "$ENPASS_FILE" ]]; then
  echo_item "Enpass is already installed" "green"
else
  echo_item "Installing Enpass" "green"
  sudo sh -c 'echo "deb http://repo.sinew.in/ stable main" > /etc/apt/sources.list.d/enpass.list'
  wget -O - https://dl.sinew.in/keys/enpass-linux.key | sudo apt-key add -
  sudo apt-get -qq --yes update
  sudo apt-get -qq --yes install enpass
fi

echo ""



# -- Slack ------------------------------------------------------------------
if exists "slack"; then
  echo_item "Slack is already installed" "green"
else
  echo_item "Installing Slack" "green"
  sudo snap install slack --classic > /dev/null
fi

echo ""



# -- Firefox ----------------------------------------------------------------
if exists "firefox"; then
  echo_item "Firefox is already installed" "green"
else
  echo_item "Installing Firefox" "green"
  sudo apt-get -qq --yes install firefox
fi

echo ""



# -- Insomnia -----------------------------------------------------------------
# TODO: could not find package
if exists "insomnia"; then
  echo_item "Insomnia is already installed" "green"
else
  echo_item "Installing Insomnia" "green"
  echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
      wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
        | sudo apt-key add -
              sudo apt-get -qq --yes update
              sudo apt-get -qq --yes install insomnia
fi

echo ""



# -- Heroku -------------------------------------------------------------------
if exists "heroku"; then
  echo_item "Heroku is already installed" "green"
else
  echo_item "Installing Heroku" "green"
  sudo snap install --classic heroku > /dev/null
fi

echo ""



# -- Simple screen recorder ----------------------------------------------------
if exists "simplescreenrecorder"; then
  echo_item "Simple screen recorder is already installed" "green"
else
  echo_item "Installing Simple screen recorder" "green"
  sudo apt-get -qq --yes install simplescreenrecorder
fi

echo ""



# -- Git crypt -----------------------------------------------------------------
if exists "git-crypt"; then
  echo_item "Git crypt is already installed" "green"
else
  echo_item "Installing Git crypt" "green"
  sudo apt-get -qq --yes install git-crypt
fi

echo ""



# -- Tree ----------------------------------------------------------------------
if exists "tree"; then
  echo_item "Tree is already installed" "green"
else
  echo_item "Installing Tree" "green"
  sudo apt-get -qq --yes install tree
fi

echo ""



# -- NordVPN -------------------------------------------------------------------
# TODO: Failed
if exists "nordvpn"; then
  echo_item "NordVPN is already installed" "green"
else
  echo_item "Installing NordVPN" "green"
  cd ~/Downloads
  curl --silent --show-error --output /dev/null https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
  sudo dpkg -i ./nordvpn-release_1.0.0_all.deb > /dev/null
  sudo apt-get -qq --yes update
  sudo apt-get -qq --yes install nordvpn
  cd -
fi

echo ""



# -- Bat ----------------------------------------------------------------------
# TODO: Failed
if exists "bat"; then
  echo_item "Bat is already installed" "green"
else
  echo_item "Installing Bat" "green"
  sudo apt-get -qq --yes install bat
  sudo mkdir -p "$(bat --config-dir)/themes"
  sudo ln -sf ~/dotfiles/bat/palenight.tmTheme "$(bat --config-dir)/themes/palenight.tmTheme"
  sudo bat cache --build > /dev/null
fi

echo ""



# -- Virtualbox ----------------------------------------------------------------
if exists "virtualbox"; then
  echo_item "Virtualbox is already installed" "green"
else
  echo_item "Installing Virtualbox" "green"
  sudo apt-get -qq --yes install virtualbox
fi

echo ""



# -- THEME -------------------------------------------------------------------------
source 'theme/theme.sh'



# -- Startup Scripts -------------------------------------------------------------------
source './startup/startup.sh'
