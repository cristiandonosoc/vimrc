#!/bin/bash
mkdir -p ~/.vim/cache/swap
mkdir -p ~/.vim/cache/backup
mkdir -p ~/.vim/cache/undo

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/vimrc/_vimrc_linux ~/.vimrc
ln -s ~/vimrc/vundle_linux.vim ~/.vim/vundle_list.vim

# For YouCompleteMe
# Install build-essentials (g++ n' stuff)
# Install CMake
# Install libpython-dev (if needed)
# Go to ~/.vim/bundle/YouCompleteMe
# run ./install.py --clang-completer

# In vim, run :VundleInstall

# Tmux
# Install tmux
ln -s ~/vimrc/tmux.conf ~/.tmux.conf
ln -s ~/vimrc/dir_colors ~/.dir_colors

# source it from .bashrc!
ln -s ~/vimrc/bashrc ~/.bashrc.local


echo "READ THE INSTRUCTIONS FOR THINGS TO INSTALL!"
