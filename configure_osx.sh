#!/bin/bash
source 'helpers.sh'

set o nounset

echo ""
echo ""

echo_header "Writing defaults"

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show Hidden Files in Finder
defaults write com.apple.finder AppleShowAllFile

# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Don't rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Configure faster key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 1

echo ""


echo_header "Configuring ssh"
configure_ssh() {
  SSH_DIR=~/.ssh
  SSH_CONFIG=~/.ssh/config
  CREATIVE_CREATURE_KEY_PUB=~/.ssh/creativecreature.pub

  mkdir -p $SSH_DIR

  if [[ -f "$CREATIVE_CREATURE_KEY_PUB" || -L "$CREATIVE_CREATURE_KEY_PUB" ]]; then
    echo_item "ssh key for creativecreature was already created" "green"
  else
    echo_item "generating a ssh key for creativecreature" "green"
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/creativecreature -C "hello@creativecreature.com"
  fi

  echo_item "symlinking ssh config to ~/.ssh/config" "green"
  ln -sf ~/dotfiles/utilities/ssh/config ~/.ssh/config
  chmod 600 ~/.ssh/config
}
configure_ssh
echo ""


echo_header "Configuring git"
configure_git() {
	echo_item "symlinking global gitignore" "green"
	ln -sf ~/dotfiles/utilities/git/gitignore_global ~/.gitignore_global

	echo_item "symlinking global gitconfig" "green"
	ln -sf ~/dotfiles/utilities/git/gitconfig ~/.gitconfig

	echo_item "symlinking creativecreature gitconfig" "green"
	ln -sf ~/dotfiles/utilities/git/gitconfig_creativecreature ~/code/creativecreature/.gitconfig
}
configure_git
echo ""


echo_header "Configuring gpg"
configure_gpg() {
  echo_item "symlinking gpg agent config" "green"
  ln -sf ~/dotfiles/utilities/gpg/gpg-agent.conf ~/.gnupg/
}
configure_gpg
echo ""


echo_header "Configuring zsh"
configure_zsh() {
	echo_item "Symlinking zprofile" "green"
	ln -sf ~/dotfiles/terminal/zsh/zprofile ~/.zprofile

	echo_item "Symlinking zshrc" "green"
	ln -sf ~/dotfiles/terminal/zsh/zshrc ~/.zshrc
}
configure_zsh
echo ""


echo_header "Configuring ripgrep"
configure_ripgrep() {
  echo_item "symlinking ripgrep ignore file" "green"
  ln -sf ~/dotfiles/utilities/ripgrep/ignore ~/.ignore
}
configure_ripgrep() {
  echo_item "symlinking ripgrep ignore file" "green"
  ln -sf ~/dotfiles/utilities/ripgrep/ignore ~/.ignore
}
configure_ripgrep
echo ""


echo_header "Configuring eslint globally"
configure_eslint() {
  echo_item "symlinking global eslint config" "green"
  ln -sf ~/dotfiles/utilities/eslint/eslintrc ~/.eslintrc
}
configure_eslint
echo ""


echo_header "Configuring prettier globally"
configure_prettier() {
  echo_item "symlinking prettier configuration file" "green"
  ln -sf ~/dotfiles/utilities/prettier/.prettierrc ~/code/.prettierrc
}
configure_prettier
echo ""


echo_header "Configuring kitty"
configure_kitty() {
  echo_item "symlinking kitty config" "green"
  mkdir -p ~/.config/kitty
  ln -sf ~/dotfiles/terminal/kitty/kitty.conf ~/.config/kitty/kitty.conf
}
configure_kitty
echo ""


echo_header "Configuring tmux"
configure_tmux() {
  echo_item "symlinking tmux configuration" "green"
  mkdir -p ~/.tmux
  ln -sf ~/dotfiles/terminal/tmux/conf ~/.tmux.conf

  mkdir -p ~/.tmux/plugins
  TPM_DIR=~/.tmux/plugins/tpm
  if [[ ! -d "$TPM_DIR" ]]; then
    echo_item "cloning tpm directory" "green"
    git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null
  fi

  echo_item "symlinking tat script" "green"
  ln -sf ~/dotfiles/terminal/tmux/tat ~/bin/tat
}
configure_tmux
echo ""


echo_header "Configuring neovim"
configure_nvim() {
  echo_item "symlinking nvim configuration" "green"
  rm -rf ~/.config/nvim
  ln -sfn ~/dotfiles/editors/nvim ~/.config/nvim

  echo_item "installing nvim plugins" "green"
  nvim "+PackerInstall" +qall

  echo_item "updating nvim plugins" "green"
  nvim "+PackerUpdate" +qall

	echo_item "installing required python packages"
  python3 -m pip install --user --upgrade pynvim
}
configure_nvim
echo ""


echo_header "Setting up global scripts"
source './scripts/scripts.sh'
install_scripts
echo ""
