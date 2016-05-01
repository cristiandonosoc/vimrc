@echo off
REM Install vim

REM Create backup dir structure
mkdir %USERPROFILE%\cache\swap
mkdir %USERPROFILE%\cache\backup
mkdir %USERPROFILE%\cache\undo

REM Copy the vimrc
copy _vimrc_windows %USERPROFILE%\_vimrc
copy vundle_windows.vim %USERPROFILE%\vimfiles\vundle_list.vim

REM For YouCompleteMe
REM Install Visual Studio (probably using the iso, online installer sucks)
REM Install Python (same arch as vim. Should be x64)
REM Install CMake (If having not finding CMAKE_C(XX)_COMPILER, repair Visual Studio)
REM cd ~/vimfiles/YouCompleteMe/ (or equivalent according to vundle install)
REM python install.py --clang-completer

REM In vim, run :VundleInstall
