#!/bin/bash

source 'helpers.sh'

echo ""
echo_header "Writing configuration"

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show Hidden Files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Don't rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false
# Automatically hide the menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Hide/Show the dock at a faster phase
defaults write com.apple.dock autohide-time-modifier -float 0.5
# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false
# Configure faster key repeat
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1         # normal minimum is 2 (30 ms)
# Disable auto-swoosh. Needed for the window manager.
defaults write com.apple.dock workspaces-auto-swoosh -bool NO
