#!/bin/bash -x
export PS4="\[\033[1;93m\]+ \[\033[0m\]"

# TODO
# in settings
#    - desktop icons large
#    - dock icons large
#    - multitasking -> fixed number of workspaces

mkdir ~/books
mkdir ~/c  # code

git config --global core.editor "vim"
git config --global user.name "JohnnyR"
EMAIL_NAME="jan.revay.tutor"  # obfuscate the email a bit to be more SPAM resistant...
EMAIL_DOMAIN="gmail.com"
git config --global user.email "${EMAIL_NAME}@${EMAIL_DOMAIN}"

git config --list --show-origin

# GNOME TWEAKS

# TODO add lower window on middle click
# TODO add keyboard settings
# TODO add fonts settings scaling factor

# KEYBOARD SHORTCUTS
gsettings set org.gnome.settings-daemon.plugins.media-keys home      "['<Super>e']"
gsettings set org.gnome.desktop.wm.keybindings maximize-vertically   "['<Super>z']"

# DEFAULT APPS
sudo update-alternatives --set editor /usr/bin/vim.basic

# .bashrc stuff
cp ./config_files/.bash_aliases ~/
cp ./config_files/.my_bashrc ~/

if ! grep my_bashrc ~/.bashrc; then
echo "
if [ -f ~/.my_bashrc ]; then
    . ~/.my_bashrc
fi" >> ~/.bashrc
fi
