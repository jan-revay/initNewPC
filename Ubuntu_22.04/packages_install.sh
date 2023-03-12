#!/bin/bash -x
# BASE IMAGE: Ubuntu 22.04

# TODO
# - Docker
# - ASP solver (e.g. with Datalog syntax)

export PS4="\[\033[1;93m\]+ \[\033[0m\]"
readonly GCC_VERSION=12

sudo apt update
sudo apt upgrade
apt list --upgradable # check for the packages that were not upgraded

readonly IS_VMWARE_VIRTUAL_MACHINE=true  # maybe make this a parameter in the future
if [ ${IS_VMWARE_VIRTUAL_MACHINE} ]; then
    sudo apt install -y open-vm-tools open-vm-tools-desktop  # VMware drivers
else
    sudo snap install spotify
    sudo snap install zoom-client
    sudo apt install -y logiops
fi

# COMPILERS, DEBUGGERS AND RUNTIMES

# Install the most recent llvm see https://apt.llvm.org/
pushd /tmp || exit
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh all
rm llvm.sh
popd || exit

sudo apt install -y gcc-${GCC_VERSION}
sudo apt install -y rr # see https://github.com/rr-debugger/rr/wiki/Using-rr-in-an-IDE

# TODO improve the Rust installation process using rustup.sh script
sudo apt install -y rustc gprolog haskell-platform

# runtimes
sudo apt install -y default-jre dotnet6

# SNAPS

# productivity
sudo snap install --classic code
sudo snap install --classic clion
sudo snap install emacs
sudo snap install postman
sudo snap install todoist
sudo snap install coq-prover

# graphics & books & sound
sudo snap install gimp
sudo snap install krita
sudo snap install inkscape
sudo snap install okular
sudo snap install evince
sudo snap install foliate
sudo snap install polar-bookshelf
sudo snap install vlc
sudo snap install audacity
sudo snap install fontvuer
# messaging
sudo snap install signal-desktop
sudo snap install caprine

sudo apt install -y vim neovim qtcreator kdevelop
sudo apt install -y ripgrep xdotool tree curl neofetch htop tmux at zsh traceroute jq
sudo apt install -y linux-tools-common linux-tools-generic linux-tools-"$(uname -r)"
sudo apt install -y git gitk python3-pip doxygen g++-multilib
sudo apt install -y make build-essential ccache ninja-build
sudo apt install -y cmake cmake-gui

sudo apt install -y ttf-mscorefonts-installer
sudo apt install -y dconf-editor gnome-tweaks

# additional static analyzers
sudo apt install -y cppcheck iwyu
sudo pip install flawfinder # C++ lint
sudo pip install cpplint
sudo snap install codechecker
# TODO fb infer
# TODO cppdepend
# TODO protolint
# TODO PVS

# C++ package managers
sudo pip install conan

# Python packages
pip install bitarray
pip install bson
sudo pip install docutils
pip install h5py
pip install hypothesis
pip install jinja2
pip install log4mongo
pip install lxml
sudo pip install matplotlib
pip install mock
sudo pip install numpy
pip install pandas
pip install Pillow
pip install pymongo
sudo pip install pytest
pip install pyyaml
pip install quantities
pip install requests
sudo pip install scikit-image
pip install scipy
sudo pip install tabulate
sudo pip install jira

# GNOME extensions
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
mv gnome-shell-extension-installer /usr/bin/

# TODO add the extension install list

# maybe unused
sudo snap install gitkraken
sudo snap install colorpie
sudo snap install colorpie
sudo snap install sqlitebrowser

# cleanup
sudo apt autoremove
