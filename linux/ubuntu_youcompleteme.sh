#!/bin/bash
# For YouCompleteMe
# Install build-essentials (g++ n' stuff)
apt-get install build-essential
# Install CMake
apt-get install cmake
# Install libpython-dev (if needed)
apt-get install libpython-dev
# Go to ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
# run ./install.py --clang-completer
./install.py --clang-completer
cd -
