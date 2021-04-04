#!/bin/zsh

# Reinstall script for Rasperry Pi running Manjaro Minimal

Sudo Pacman -S bash zsh vim

# Download dotfiles

wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.bash_profile
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.zshrc
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.vimrc
wget https://raw.githubusercontent.com/sciencefidelity/dotfiles/main/.dir_colors

mkdir .vim
mkdir .vim/colors

curl https://raw.githubusercontent.com/lifepillar/vim-gruvbox8/master/colors/gruvbox8.vim -o .vim/colors/gruvbox8.vim
curl https://raw.githubusercontent.com/lifepillar/vim-wwdc16-theme/master/colors/wwdc16.vim -o .vim/colors/wwdc16.vim

# Set up user directory structure

mkdir sites
