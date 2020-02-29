#!/bin/bash

echo_header "OSX Configuration"



# -- Upgrade & Update Homebrew -------------------------------------------------
brew upgrade
brew update



# -- Curl  ---------------------------------------------------------------------
if exists "curl"; then
  echo_item "curl is already installed" "green"
else
  echo_item "Installing Curl" "green"
  brew install curl
fi

echo ""



# -- Wget  ---------------------------------------------------------------------
if exists "wget"; then
  echo_item "Wget is already installed" "green"
else
  echo_item "Installing Wget" "green"
  brew install wget
fi

echo ""



# -- Zsh -----------------------------------------------------------------------
if exists "zsh"; then
  echo_item "zsh is already installed" green
else
  echo_item "Installing zsh" "green"
   brew install zsh
fi

echo ""



# -- Nvm -----------------------------------------------------------------------
source 'nvm/nvm.sh'



# -- Neovim --------------------------------------------------------------------
source 'nvim/nvim.sh'



# -- Ripgrep -------------------------------------------------------------------
if exists "rg"; then
  echo_item "Ripgrep is already installed" "green"
else
  echo_item "Installing ripgrep" "green"
  brew install ripgrep
fi

echo ""



# -- Jq ------------------------------------------------------------------------
if exists "jq"; then
  echo_item "jq is already installed" "green"
else
  echo_item "Installing jq" "green"
  brew install jq
fi

echo ""



# -- Tmux ----------------------------------------------------------------------
source 'tmux/tmux.sh'



# -- Docker --------------------------------------------------------------------
if exists "docker"; then
  echo_item "Docker is already installed" "green"
else
  echo_item "Installing Docker" "green"
  brew cask install docker
  brew install bash-completion
  brew install docker-completion
  brew install docker-compose-completion
fi

echo ""



# -- Python stuff -------------------------------------------------------------
if exists "virtualenv"; then
  echo_item "Virtualenv already installed" "green"
else
  echo_item "Installing Python tools" "green"
  brew install python
  brew install pipenv
  pip install virtualenv
fi

echo ""



# -- Powerline Fonts -----------------------------------------------------------
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd -
rm -rf fonts

echo ""



# -- Iterm2 -------------------------------------------------------------------
if exists "iterm"; then
  echo_item "Iterm is already installed" "green"
else
  echo_item "Installing Iterm" "green"
  brew cask install iterm2
fi

echo ""



# -- Dash -------------------------------------------------------------------
if exists "dash"; then
  echo_item "Dash is already installed" "green"
else
  echo_item "Installing Dash" "green"
  brew cask install dash
fi

echo ""



# -- Evernote ------------------------------------------------------------------
if exists "evernote"; then
  echo_item "Evernote is already installed" "green"
else
  echo_item "Installing Evernote" "green"
  brew cask install evernote
fi

echo ""



# -- Chrome --------------------------------------------------------------------
if exists "google-chrome"; then
  echo_item "Google Chrome is already installed" "green"
else
  echo_item "Installing Chrome" "green"
  brew cask install google-chrome
fi

echo ""



# -- Caffeine ------------------------------------------------------------------
if exists "caffeine"; then
  echo_item "Caffeine is already installed" "green"
else
  echo_item "Installing Caffeine" "green"
  brew cask install caffeine
fi

echo ""



# -- Slack ---------------------------------------------------------------------
if exists "slack"; then
  echo_item "slack is already installed" "green"
else
  echo_item "Installing Slack" "green"
  brew cask install slack
fi

echo ""



# -- Vlc -----------------------------------------------------------------------
if exists "vlc"; then
  echo_item "VLC is already installed" "green"
else
  echo_item "Installing VLC" "green"
  brew cask install vlc
fi

echo ""



# -- Spectacle -----------------------------------------------------------------
if exists "spectacle"; then
  echo_item "Spectacle is already installed" "green"
else
  echo_item "Installing Spectacle" "green"
  brew cask install spectacle
fi

echo ""



# -- 1password ----------------------------------------------------------------
if exists "1password"; then
  echo_item "1password is already installed" "green"
else
  echo_item "Installing 1password" "green"
  brew cask install 1password
fi

echo ""



# -- Tig -----------------------------------------------------------------------
if exists "tig"; then
  echo_item "Tig is already installed" "green"
else
  echo_item "Installing Tig" "green"
  brew install tig
fi

echo ""



# -- Bat ----------------------------------------------------------------------
if exists "bat"; then
  echo_item "Bat is already installed" "green"
else
  echo_item "Installing Bat" "green"
  brew install bat
  mkdir -p "$(bat --config-dir)/themes"
  ln -sf ~/dotfiles/bat/palenight.tmTheme "$(bat --config-dir)/themes/palenight.tmTheme"
  bat cache --build
fi

echo ""


# -- OSX Configuration ---------------------------------------------------------
echo_item "Running OSX configuration" "green"
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Only Show Open Applications In The Dock
defaults write com.apple.dock static-only -bool false
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
