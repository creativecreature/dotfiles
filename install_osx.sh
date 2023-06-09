#!/bin/bash
source 'helpers.sh'

set o nounset

echo ""
echo_header "Starting installation"

# Ask for the admin password upfront, and run a keep-alive to update existing `sudo` time stamp untilthe script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo_item "Installing homebrew" "green"
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
   eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Packages we want to have installed
WANTED_PACKAGES=(
  awscli
  btop
  coreutils
  direnv
  dive
  dockutil
  efm-langserver
  fzf
  git-crypt
  git-lfs
  gnupg
  go
  golang-migrate
  hugo
  jq
  mongodb-community
  ncdu
  neodev
  neovim
  orlangure/tap/gocovsh
  pnpm
  postgresql
  ripgrep
  rust
  starship
  tfenv
  tig
  tldr
  goreleaser
  tmux
  tree
  volta
  wget
)

# Currently installed packages
INSTALLED_PACKAGES=$(brew leaves)

# Extract the packages that we are missing
for index in "${!WANTED_PACKAGES[@]}"; do
  if [[ "${INSTALLED_PACKAGES[*]}" =~ "${WANTED_PACKAGES[$index]}" ]]; then
    unset -v WANTED_PACKAGES[$index]
  fi
done

# Casks we want to have installed
WANTED_CASKS=(
  1password
  1password-cli
  amethyst
  centered
  discord
  figma
  firefox
  firefox-developer-edition
  font-hack-nerd-font
  goland
  google-chrome
  insomnia
  kitty
  mongodb-compass
  monodraw
  nordvpn
  obsidian
  postman
  raycast
  slack
  spotify
  todoist
  vlc
)

# Currently installed casks
INSTALLED_CASKS=$(brew list --cask)

# Extract the casks that we are missing
for index in "${!WANTED_CASKS[@]}"; do
  if [[ "${INSTALLED_CASKS[*]}" =~ "${WANTED_CASKS[$index]}" ]]; then
    unset -v WANTED_CASKS[$index]
  fi
done

echo_item "Adding additional repositories to the homebrew" "green"
brew tap mongodb/brew
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

echo_item "Updating homebrew" "green"
brew update
brew upgrade


echo_item "Installing missing packages" "green"
if [ ${#WANTED_PACKAGES[@]} -eq 0 ]; then
  echo_item "All packages are already installed" "green"
else
  echo_item "Installing packages" "green"
  brew install ${WANTED_PACKAGES[@]}
fi

echo_item "Installing missing casks" "green"
if [ ${#WANTED_CASKS[@]} -eq 0 ]; then
  echo_item "All casks are already installed" "green"
else
  echo_item "Installing casks" "green"
  brew install ${WANTED_CASKS[@]} --cask
fi

echo_item "Performing cleanup" "green"
brew cleanup

install_node() {
  if exists "node"; then
    echo_item "node is already installed" "green"
  else
    echo_item "installing node" "green"
    volta install node
    volta install yarn
    volta install neovim
    volta install typescript
    volta install diagnostic-languageserver
    volta install prettier
    volta install eslint_d
    volta install aws-cdk
  fi
}
install_node

install_oh_my_zsh() {
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
install_oh_my_zsh

# Install useful fzf keybindings and fuzzy completion
# $(brew --prefix)/opt/fzf/install
