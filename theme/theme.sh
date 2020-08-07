#!/bin/bash

THEMES_DIR=/usr/share/themes
THEME_DIR=/usr/share/themes/Nordic
ICONS_DIR=/usr/share/icons
ICON_DIR=/usr/share/icons/Zafiro

echo_header "Theme And UI Configuration"
if [[ -d "$THEMES_DIR" ]]; then
  echo_item "Themes directory already exist" "green"
else
  mkdir "$THEMES_DIR"
fi

if [[ -d "$THEME_DIR" ]]; then
  echo_item "Theme is already installed" "green"
else
  echo_item "Cloning down Nordic gtk theme" "green"
  sudo git clone --quiet https://github.com/devaddict/gtk-theme.git /usr/share/themes/Juno > /dev/null
  gsettings set org.gnome.desktop.interface gtk-theme "Juno"
  gsettings set org.gnome.desktop.wm.preferences theme "Juno"
fi

if [[ -d "$ICONS_DIR" ]]; then
  echo_item "Icons directory already exists" "green"
else
  echo_item "Creating /usr/share/icons directory"
  mkdir "$ICONS_DIR"
fi

if [[ -d "$ICON_DIR" ]]; then
  echo_item "Icon directory already exists" "green"
else
  echo_item "Cloning down Zafiro icons" "green"
  sudo git clone --quiet https://github.com/devaddict/icons.git /usr/share/icons/Zafiro > /dev/null
  gsettings set org.gnome.desktop.interface icon-theme 'Zafiro'
fi



echo ""
