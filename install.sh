#!/bin/bash

source 'helpers.sh'

set -o nounset

echo ""
echo_header "Starting installation and configuration"

sudo -v # Ask for sudo password & keep alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo apt-get -qq --yes update
echo ""

# -- UTILITIES -----------------------------------------------------------------
echo_header "Utilities"
source './utilities/homebrew/homebrew.sh'
source './utilities/ssh/ssh.sh'
source './utilities/git/git.sh'
source './utilities/gpg/gpg.sh'
source './utilities/direnv/direnv.sh'
source './utilities/http/http.sh'
source './utilities/tldr/tldr.sh'
source './utilities/ripgrep/ripgrep.sh'
source './utilities/jq/jq.sh'
source './utilities/xclip/xclip.sh'
source './utilities/heroku/heroku.sh'
source './utilities/gitcrypt/gitcrypt.sh'
source './utilities/fzf/fzf.sh'
source './utilities/tree/tree.sh'
source './utilities/eslint/eslint.sh'
source './utilities/kcolorchooser/kcolorchooser.sh'

install_homebrew
configure_ssh
configure_git
configure_gpg
install_direnv
install_http_utils
install_tldr
install_ripgrep
configure_ripgrep
install_jq
install_xclip
install_heroku
install_gitcrypt
install_fzf
install_tree
configure_eslint
install_kcolorchooser
echo ""



# -- PROGRAMMING LANGUAGES -----------------------------------------------------
echo_header "Programming languages"
source './languages/node.sh'
source './languages/rust.sh'
source './languages/terraform.sh'
source './languages/python.sh'
source './languages/golang.sh'

install_node
install_rust
install_terraform
install_python
install_golang
echo ""


# -- TERMINAL ------------------------------------------------------------------
echo_header "Terminal"
source './terminal/zsh/zsh.sh'
source './terminal/alacritty/alacritty.sh'
source './terminal/kitty/kitty.sh'
source './terminal/tmux/tmux.sh'
source './terminal/starship/starship.sh'

install_zsh
configure_zsh
install_alacritty
configure_alacritty
install_kitty
configure_kitty
install_tmux
configure_tmux
install_starship
echo ""



# -- EDITORS -------------------------------------------------------------------
echo_header "Editors"
source './editors/nvim/nvim.sh'

install_nvim
configure_nvim
install_lua_language_server
echo ""



# -- APPLICATIONS --------------------------------------------------------------
echo_header "Applications"
source './applications/docker.sh'
source './applications/nordvpn.sh'
source './applications/virtualbox.sh'
source './applications/vlc.sh'
source './applications/slack.sh'
source './applications/discord.sh'
source './applications/simplescreenrecorder.sh'
source './applications/1password.sh'

install_docker
install_nordvpn
install_virtualbox
install_vlc
install_slack
install_discord
install_simplescreenrecorder
install_1password
echo ""



# -- HARDWARE ------------------------------------------------------------------
echo_header "Hardware"
source "./hardware/keyboard.sh"
source './hardware/touchpad.sh'
source './hardware/usb.sh'

configure_keyboard
configure_touchpad
configure_usb
echo ""



# -- UI ------------------------------------------------------------------------
echo_header "UI"
source './ui/fonts.sh'
source './ui/gnome_tweaks.sh'
source './ui/dock.sh'
source './ui/theme.sh'
source './ui/icons.sh'

install_fonts
install_gnome_tweaks
configure_dock
install_theme
configure_theme
install_icons
configure_icons
echo ""



# -- SCRIPTS -------------------------------------------------------------------
echo_header "Scripts"
source './scripts/scripts.sh'

install_scripts
echo ""
