#!/bin/bash
source 'helpers.sh'

set -o nounset
set -o errexit

echo ""
echo_header "Starting installation"

# Ask for the admin password upfront, and run a keep-alive to
# update existing `sudo` time stamp until the script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew. Install if needed.
if test ! $(which brew); then
    echo_item "Installing homebrew" "green"
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
   eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# These are the packages we want to have installed
WANTED_PACKAGES=(
  awscli
  btop
  coreutils
  direnv
  dive
  dockutil
  efm-langserver
  flyctl
  fzf
  git-crypt
  git-lfs
  gnupg
  go
  golang-migrate
  goreleaser
  hey
  hugo
  jq
  mongodb-community
  ncdu
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
  tmux
  tree
  volta
  wget
  youtube-dl
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# These are the currently installed packages
INSTALLED_PACKAGES=$(brew leaves)

# Extract the packages that we are missing
for index in "${!WANTED_PACKAGES[@]}"; do
  if [[ "${INSTALLED_PACKAGES[*]}" =~ "${WANTED_PACKAGES[$index]}" ]]; then
    unset -v WANTED_PACKAGES[$index]
  fi
done

# These are the casks we want to have installed
WANTED_CASKS=(
  1password
  1password-cli
  amethyst
  centered
  discord
  figma
  firefox
  firefox-developer-edition
  goland
  google-chrome
  insomnia
  kap
  kitty
  mongodb-compass
  monodraw
  nordvpn
  obsidian
  postman
  raycast
  slack
  spotify
  vlc
)

# These are the currently installed casks
INSTALLED_CASKS=$(brew list --cask)

# Extract the casks that we are missing
for index in "${!WANTED_CASKS[@]}"; do
  if [[ "${INSTALLED_CASKS[*]}" =~ "${WANTED_CASKS[$index]}" ]]; then
    unset -v WANTED_CASKS[$index]
  fi
done

echo_item "Tapping additional homebrew repositories" "green"
brew tap mongodb/brew
brew tap homebrew/cask-versions

echo_item "Updating homebrew" "green"
brew update
brew upgrade

if [ ${#WANTED_PACKAGES[@]} -eq 0 ]; then
  echo_item "All packages are already installed" "green"
else
  echo_item "Installing package: ${WANTED_PACKAGES[@]}" "green"
  brew install ${WANTED_PACKAGES[@]}
fi

if [ ${#WANTED_CASKS[@]} -eq 0 ]; then
  echo_item "All casks are already installed" "green"
else
  echo_item "Installing cask: ${WANTED_CASKS[@]}" "green"
  brew install ${WANTED_CASKS[@]} --cask
fi

echo_item "Performing homebrew cleanup" "green"
brew cleanup

echo_item "Checking for missing volta installations" "green"
VOLTA_BIN="$HOME/.volta/bin"
VOLTA_PACKAGES=("node" "pnpm" "yarn")
for PACKAGE in "${VOLTA_PACKAGES[@]}"; do
  FILE="$VOLTA_BIN/$PACKAGE"
  if [ -f "$FILE" ]; then
    echo_item "$PACKAGE is already installed" "green"
  else
    echo_item "installing $PACKAGE" "green"
    volta install $PACKAGE
  fi
done

install_oh_my_zsh() {
	if [[ -d ~/.oh-my-zsh ]]; then
		echo_item "oh my zsh is already installed" "green"
	else
		echo_item "installing oh my zsh" " green"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
}
install_oh_my_zsh
