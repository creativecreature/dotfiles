#!/bin/bash
source 'helpers.sh'

set -o nounset
set -o errexit

echo ""
echo ""

function apply_defaults() {
  echo_header "Writing defaults"
  # Show filename extensions by default
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  # Show Hidden Files in Finder
  defaults write com.apple.finder AppleShowAllFiles -bool true
  # Disable "natural" scroll
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
  # Don't rearrange Spaces based on recent use
  defaults write com.apple.dock mru-spaces -bool false
  # Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true
	# Hide/Show the dock at a faster phase
	defaults write com.apple.dock autohide-time-modifier -float 0.5
  # Don’t show recent applications in Dock
  defaults write com.apple.dock show-recents -bool false
  # Configure faster key repeat
	defaults write NSGlobalDomain InitialKeyRepeat -int 12
	defaults write NSGlobalDomain KeyRepeat -float 0.2
	defaults write com.apple.Accessibility KeyRepeatEnabled -bool false
}

configure_fzf() {
  echo_header "Configuring fzf"
	if [[ -f ~/.fzf.zsh ]]; then
		echo_item "fzf keybindings are already configured" "green"
	else
    $(brew --prefix)/opt/fzf/install
  fi
}

function configure_ssh() {
  echo_header "Configuring ssh"
  echo_header "Configuring ssh"

  create_directory ~/.ssh
  PERSONAL_PUB_KEY=~/.ssh/personal.pub
  WORK_PUB_KEY=~/.ssh/work.pub

  local keys=("$PERSONAL_PUB_KEY" "$WORK_PUB_KEY")
  local key_labels=("personal" "work")

  for index in "${!keys[@]}"; do
      if [[ -f "${keys[$index]}" || -L "${keys[$index]}" ]]; then
          echo_item "${key_labels[$index]} ssh key was already created" "green"
      else
          echo_item "generating a ssh key for ${key_labels[$index]} use" "green"
          ssh-keygen -t rsa -b 4096 -f ~/.ssh/${key_labels[$index]} -C "${key_labels[$index]} key"
      fi
  done

  symlink_file ~/dotfiles/ssh/config ~/.ssh/config "Symlinking ssh config to ~/.ssh/config"
  chmod 600 ~/.ssh/config
}

configure_git() {
  echo_header "Configuring git"
	symlink_file ~/dotfiles/git/gitignore_global ~/.gitignore_global "Symlinking global gitignore"
  symlink_file ~/dotfiles/git/gitconfig ~/.gitconfig "symlinking global gitconfig"
  symlink_file ~/dotfiles/git/gitconfig_personal ~/code/personal/.gitconfig "symlinking gitconfig for personal projects"
  symlink_file ~/dotfiles/git/gitconfig_work ~/code/work/.gitconfig "symlinking gitconfig for work projects"
}

configure_gpg() {
  echo_header "Configuring gpg"
  symlink_file ~/dotfiles/gpg/gpg-agent.conf ~/.gnupg/ "symlinking gpg agent config"
}

configure_zsh() {
  echo_header "Configuring zsh"
  symlink_file ~/dotfiles/zsh/zprofile ~/.zprofile "Symlinking zprofile"
  symlink_file ~/dotfiles/zsh/zshrc ~/.zshrc "Symlinking zshrc"
}

configure_ripgrep() {
  echo_header "Configuring ripgrep"
  symlink_file ~/dotfiles/ripgrep/ignore ~/.ignore "symlinking ripgrep ignore file"
}

configure_kitty() {
  echo_header "Configuring kitty"
  create_directory ~/.config/kitty/themes
  symlink_file ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf "symlinking kitty config"
  symlink_file ~/dotfiles/kitty/dark.conf ~/.config/kitty/themes/dark.conf "symlinking kitty dark theme"
  symlink_file ~/dotfiles/kitty/light.conf ~/.config/kitty/themes/light.conf "symlinking kitty light theme"
}

configure_tmux() {
  echo_header "Configuring tmux"
  create_directory ~/.tmux
  symlink_file ~/dotfiles/tmux/conf ~/.tmux.conf "symlinking tmux configuration"
  symlink_file ~/dotfiles/tmux/tat ~/bin/tat "symlinking tat script"

  create_directory ~/.tmux/plugins
  TPM_DIR=~/.tmux/plugins/tpm
  if [[ ! -d "$TPM_DIR" ]]; then
    echo_item "cloning tpm directory" "green"
    git clone --quiet https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null
  fi
}

configure_nvim() {
  echo_header "Configuring neovim"
  symlink_file ~/dotfiles/nvim ~/.config/nvim "symlinking nvim configuration"
  echo_item "installing nvim plugins" "green"
  nvim "+PackerInstall" +qall
  echo_item "updating nvim plugins" "green"
  nvim "+PackerUpdate" +qall
	echo_item "installing required python packages" "green"
  python3 -m pip install --user --upgrade pynvim
}

configure_scripts() {
  echo_header "Setting up global scripts"
  for filepath in ~/dotfiles/scripts/*; do
    filename=${filepath##*/}
    ln -sf $filepath ~/bin/$filename
  done
}

apply_defaults
configure_fzf
configure_ssh
configure_git
configure_gpg
configure_zsh
configure_ripgrep
configure_git
configure_kitty
configure_tmux
configure_nvim
configure_scripts
