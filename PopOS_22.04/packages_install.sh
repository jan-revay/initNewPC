#!/bin/bash -x
# BASE IMAGE: PopOS 22.04

# TODO
# - Docker
# - ASP solver (e.g. with Datalog syntax)

export PS4="\[\033[1;93m\]+ \[\033[0m\]"
readonly GCC_VERSION=12

sudo apt update
sudo apt upgrade
apt list --upgradable # check for the packages that were not upgraded

if lspci | grep -i vmware; then  # we are running in VMware virtual machine
    sudo apt install -y open-vm-tools open-vm-tools-desktop  # install VMware drivers
else # we are running bare metal (I don't VirtualBox or other hypervisors)
    # sudo snap install spotify
    # sudo snap install zoom-client
    sudo apt install -y logiops
fi

# COMPILERS, DEBUGGERS AND RUNTIMES

# TODO check whether PopOS does not already have the latest LLVM compiler
# Install the most recent llvm see https://apt.llvm.org/
pushd /tmp || exit
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh all
rm llvm.sh
popd || exit


# TODO improve the Rust installation process using rustup.sh script
sudo apt install -y gcc-${GCC_VERSION} rustc gprolog haskell-platform coq coqide
sudo apt install -y rr # see https://github.com/rr-debugger/rr/wiki/Using-rr-in-an-IDE

# runtimes
sudo apt install -y default-jre dotnet6

# FLATPAKS
flatpak install clion
flatpak install postman
flatpak install todoist
flatpak install foliate
flatpak install signal
flatpak install caprine

# graphics & books & sound
sudo apt install -y gimp krita inkscape okular evince vlc audacity

# programming tools
sudo apt install -y code vim neovim emacs qtcreator kdevelop
sudo apt install -y ripgrep xdotool tree curl neofetch htop tmux at zsh traceroute jq
sudo apt install -y linux-tools-common linux-tools-generic linux-tools-"$(uname -r)"
sudo apt install -y git gitk python3-pip doxygen g++-multilib
sudo apt install -y make build-essential ccache ninja-build
sudo apt install -y cmake cmake-gui

# tweaks
sudo apt install -y ttf-mscorefonts-installer
sudo apt install -y dconf-editor gnome-tweaks

# additional static analyzers
sudo apt install -y cppcheck iwyu
sudo pip install flawfinder # C++ lint
sudo pip install cpplint

# TODO sudo snap install codechecker
# TODO fb infer
# TODO cppdepend
# TODO protolint
# TODO PVS

# C++ package managers
sudo pip install conan
sudo pip install scikit-image
sudo pip install docutils
sudo pip install matplotlib
sudo pip install pytest
sudo pip install numpy
sudo pip install jira
sudo pip install tabulate

# Python packages
pip install bitarray
pip install bson
pip install h5py
pip install hypothesis
pip install jinja2
pip install log4mongo
pip install lxml
pip install mock
pip install pandas
pip install Pillow
pip install pymongo
pip install pyyaml
pip install quantities
pip install requests
pip install scipy

# GNOME extensions
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/

gnome-shell-extension-installer 701
# TODO restart GNOME (resp. only reload the extension list if possible)
gnome-extensions enable scroll-workspaces@gfxmonk.net
gnome-shell-extension-installer 3851
gnome-extensions enable workspaces-bar@fthx
# TODO add the extension install list

# maybe unused
# TODO - convert to flatpaks
sudo snap install gitkraken
sudo snap install colorpie
sudo snap install sqlitebrowser
sudo apt install polar-bookshelf

# cleanup
sudo apt autoremove
