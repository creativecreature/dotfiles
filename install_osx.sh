#!/bin/bash
source 'helpers.sh'

set o nounset

echo ""
echo_header "Starting installation"

# Ask for the admin password upfront, and run a keep-alive to update existing `sudo` time stamp untilthe script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install the command line tools
xcode-select --install

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo_item "Installing homebrew" "green"
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/conner/.zprofile
   eval "$(/opt/homebrew/bin/brew shellenv)"
fi

PACKAGES=(
	mas
	1password
	dockutil
	neovim
	tmux
	starship
	rg
	fzf
	direnv
	gnupg
	tig
	git-crypt
	git-lfs
	go
	efm-langserver
	volta
	rust
	tfenv
	jq
	tldr
	tree
	spotify-tui
	spotifyd
)

CASKS=(
	kitty
	nordvpn
	rectangle
	google-chrome
	firefox
	slack
	discord
	vlc
)
# Filter out already installed packages and casks
# for index in "${!PACKAGES[@]}" ; do [[ which PACKAGES[$index] ]] && unset -v 'PACKAGES[$index]' ; done
# PACKAGES=("${PACKAGES[@]}")

# for index in "${!CASKS[@]}" ; do [[ which CASKS[$index] ]] && unset -v 'CASKS[$index]' ; done
# CASKS=("${CASKS[@]}")


echo_item "Updating homebrew" "green"
brew upgrade
brew update

echo_item "Installing packages" "green"
brew install ${PACKAGES[@]}

echo_item "Installing casks" "green"
brew install --cask ${CASKS[@]}

echo_item "Performing cleanup" "green"
brew cleanup

echo_item "Installing nerdfonts" "green"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

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
$(brew --prefix)/opt/fzf/install

### Mas login is currently broken on mojave. See:
### Login manually for now.
echo_item "Need to log in to App Store manually to install apps with mas" "red"
echo "Opening App Store. Please login."
open "/Applications/App Store.app"
echo_item "Is app store login complete.(y/n)? " "green"
read response
if [ "$response" != "${response#[Yy]}" ]
then
	mas install 937984704 # Amphetamine
else
	echo_item "App Store login not complete. Skipping installing App Store Apps" "red"
fi
