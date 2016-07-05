#!/bin/bash
apt-get install vim
mkdir -p ~/.vim/cache/swap
mkdir -p ~/.vim/cache/backup
mkdir -p ~/.vim/cache/undo
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/vimrc/_vimrc_linux ~/.vimrc
ln -s ~/vimrc/vundle_linux.vim ~/.vim/vundle_list.vim


# Tmux
# Install tmux
apt-get install tmux
ln -s ~/vimrc/tmux.conf ~/.tmux.conf
ln -s ~/vimrc/dir_colors ~/.dir_colors

# source it from .bashrc!
ln -s ~/vimrc/bashrc ~/.bashrc.local
echo "source ~/.bashrc.local" >> .bashrc

echo "Run :VundleInstall in vim, then ubuntu_youcompleteme.sh"
