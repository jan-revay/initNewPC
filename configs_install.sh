#!/bin/bash -x
export PS4="\[\033[1;93m\]+ \[\033[0m\]"


mkdir ~/books
mkdir ~/c  # code

git config --global core.editor "vim"
git config --global user.name "JohnnyR"
EMAIL_NAME="janci.revay"  # obfuscate the email a bit to be more SPAM resistant...
EMAIL_DOMAIN="gmail.com"
git config --global user.email "${EMAIL_NAME}@${EMAIL_DOMAIN}"

git config --list --show-origin

# KEYBOARD SHORTCUTS
gsettings set org.gnome.settings-daemon.plugins.media-keys home      "['<Super>e']"
gsettings set org.gnome.desktop.wm.keybindings maximize-vertically   "['<Super>z']"

# DEFAULT APPS
sudo update-alternatives --set editor /usr/bin/vim.basic
