#!/bin/bash
mkdir -p ~/.vim/cache/swap
mkdir -p ~/.vim/cache/backup
mkdir -p ~/.vim/cache/undo

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp _vimrc_linux ~/.vimrc
cp vundle_linux.vim ~/.vim/vundle_list.vim

# For YouCompleteMe
# Install build-essentials (g++ n' stuff)
# Install CMake
# Install libpython-dev (if needed)
# Go to ~/.vim/bundle/YouCompleteMe
# run ./install.py --clang-completer

# In vim, run :VundleInstall
