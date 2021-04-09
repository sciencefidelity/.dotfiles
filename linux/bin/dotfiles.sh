#! /bin/bash

# Dotfile installer script

wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/linux/.bash_profile
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/linux/.zshrc
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/linux/.vimrc
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/linux/.dir_colors

mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula
cd

# Copy dotfiles to root

sudo cp .bash_profile /root/
sudo cp .zshrc /root/
sudo cp .vimrc /root/
sudo cp .dir_colors /root/
sudo cp .vim /root/ -r
