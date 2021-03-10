#!/bin/bash

# Dotfile installer script

wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.bash_profile
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.zshrc
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.vimrc
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.dir_colors

mkdir .vim
mkdir .vim/colors

curl https://raw.githubusercontent.com/lifepillar/vim-gruvbox8/master/colors/gruvbox8.vim -o .vim/colors/gruvbox8.vim
curl https://raw.githubusercontent.com/lifepillar/vim-wwdc16-theme/master/colors/wwdc16.vim -o .vim/colors/wwdc16.vim

# Copy dotfiles to root

sudo mkdir /root/.vim
sudo mkdir /root/.vim/colors

sudo cp .bash_profile /root/
sudo cp .zshrc /root/
sudo cp .vimrc /root/
sudo cp .dir_colors /root/
sudo cp .dir_colors /root/

sudo cp .vim/colors/gruvbox8.vim /root/.vim/colors/
sudo cp .vim/colors/wwdc16.vim /root/.vim/colors/
