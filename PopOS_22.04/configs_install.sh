#!/bin/bash -x
# BASE IMAGE: PopOS 22.04

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
# make the email a bit more SPAM resistant as it is in a public repo...
EMAIL_NAME="jan.revay.tutor"
EMAIL_DOMAIN="gmail.com"
git config --global user.email "${EMAIL_NAME}@${EMAIL_DOMAIN}"

git config --list --show-origin

# GNOME TWEAKS

# TODO add lower window on middle click
# TODO add keyboard settings
# TODO add fonts settings scaling factor

# KEYBOARD SHORTCUTS
gsettings set org.gnome.settings-daemon.plugins.media-keys home      "['<Super>e']"
gsettings set org.gnome.desktop.interface text-scaling-factor 1.4
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'minimize'
gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'toggle-maximize'
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:close'
gsettings set org.gnome.desktop.interface locate-pointer true
# todo keyboard settings does not work
gsettings set org.gnome.desktop.input-sources.xkb-options \
    ['terminate:ctrl_alt_bksp', 'shift:both_capslock_cancel', 'caps:none']



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

# set default apps
xdg-mime default code.desktop text/markdown
xdg-mime default code.desktop application/x-shellscript
