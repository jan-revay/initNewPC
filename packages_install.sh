#!/bin/bash -x

# TODO color the xtrace output

readonly IS_VIRTUAL_MACHINE=true

if [ ${IS_VIRTUAL_MACHINE} ]; then
    sudo apt install -y open-vm-tools open-vm-tools-desktop
fi

# see https://apt.llvm.org/
wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | sudo tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc
echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy main" | sudo tee /etc/apt/sources.list.d/llvm.list
echo "deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy main"  | sudo tee --append /etc/apt/sources.list.d/llvm.list

sudo apt install -y clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 libc++abi-dev libc++abi1 \
    libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 lld llvm-dev llvm-runtime llvm

sudo apt install -y python3-clang lldb
sudo apt install rustc

sudo apt-get update
sudo apt-get upgrade
apt list --upgradable

sudo snap install gimp
sudo snap install inkscape
sudo snap install okular
sudo snap install polar-bookshelf
sudo snap install foliate
sudo snap install vlc
sudo snap install signal-desktop
sudo snap install fontvuer

sudo snap install code
sudo snap install clion
sudo snap install todoist
sudo snap install emacs
sudo snap install caprine
sudo snap install evince

# TO TRY:

# sudo snap install codechecker
# sudo snap install gitkraken
# sudo snap install colorpie

sudo apt install -y clang-format
sudo apt install -y ripgrep
sudo apt install -y xdotool tree curl neofetch htop tmux
sudo apt-get install linux-tools-common linux-tools-generic linux-tools-"$(uname -r)"
sudo apt install -y git make python3-pip build-essential doxygen g++-multilib ccache qtcreator gitk
sudo apt install -y cmake cmake-gui libpcre3 libz3-dev
sudo apt install neovim
# sudo apt install vim

sudo apt install -y at
sudo apt install -y ttf-mscorefonts-installer
sudo snap install fontvuer
sudo apt install -y dconf-editor
sudo apt install -y gnome-tweaks

sudo apt install -y cppcheck iwyu
pip install flawfinder # C++ lint
pip install cpplint


pip install bitarray
pip install bson
pip install docutils
pip install h5py
pip install hypothesis
pip install jinja2
pip install log4mongo
pip install lxml
pip install matplotlib
pip install mock
pip install numpy
pip install pandas
pip install Pillow
pip install pymongo
pip install PySide2
pip install pytest
pip install pyyaml
pip install quantities
pip install repoze.lru
pip install requests
pip install scikit-image
pip install scipy
pip install six
pip install tabulate
pip install jira
